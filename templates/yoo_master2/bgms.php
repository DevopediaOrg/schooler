<?php

defined('_JEXEC') or die('Restricted access');


/*==========================================================
  Code for DB access.
----------------------------------------------------------*/
function getQueryResult($db,$resultType)
{
    switch ($resultType) {
    	case 0:
    		$result = $db->loadResult();
    		break;
    	case 1:
    		$result = $db->loadRow();
    		break;
    	case 2:
    	default:
    		$result = $db->loadRowList();
    		break;
    }
    return $result;
}

function executeQuery($query, $resultType=2)
{
	$db = JFactory::getDBO();
    $db->setQuery( $query );
    if (preg_match("/^SELECT/",$query))
    	return getQueryResult($db,$resultType);
    else $db->query();
}


function getTableData($tablename, $fields='*', $match=1, $resultType=2)
{
	$db = JFactory::getDBO();
    $query = "SELECT $fields FROM $tablename WHERE $match";
    //echo "$query<br>";
    $db->setQuery( $query );
    return getQueryResult($db,$resultType);
}


function takeDbBackup($dbBackupFile, $currtime)
{
	$config = JFactory::getConfig();
	backup_tables('localhost',
	              $config->get('user'),
	              $config->get('password'),
	              $config->get('db'),
	              $dbBackupFile);
	if (ftp_file('server261.com', 'bgms', 'shishukunj', $dbBackupFile)) {
		update_backup_timestamp($currtime);
	}
}


/*==========================================================
  Export DB tables to a file and FTP the file.
----------------------------------------------------------*/
function backup_tables($host,$user,$pass,$name,$file,$tables = '*')
{ // Source: http://davidwalsh.name/backup-mysql-database-php

	$link = mysql_connect($host,$user,$pass);
	mysql_select_db($name,$link);

	//get all of the tables
	if($tables == '*')
	{
		$tables = array();
		$result = mysql_query('SHOW TABLES');
		while($row = mysql_fetch_row($result))
		{
			$tables[] = $row[0];
		}
	}
	else
	{
		$tables = is_array($tables) ? $tables : explode(',',$tables);
	}

	//cycle through
	foreach($tables as $table)
	{
		$result = mysql_query('SELECT * FROM '.$table);
		$num_fields = mysql_num_fields($result);

		$return.= 'DROP TABLE IF EXISTS '.$table.';';
		$row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE IF NOT EXISTS '.$table));
		$return.= "\n\n".$row2[1].";\n\n";

		for ($i = 0; $i < $num_fields; $i++)
		{
			while($row = mysql_fetch_row($result))
			{
				$return.= 'INSERT INTO '.$table.' VALUES(';
				for($j=0; $j<$num_fields; $j++)
				{
					$row[$j] = addslashes($row[$j]);
					$row[$j] = ereg_replace("\n","\\n",$row[$j]);
					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
					if ($j<($num_fields-1)) { $return.= ','; }
				}
				$return.= ");\n";
			}
		}
		$return.="\n\n\n";
	}

	//save file
	$handle = fopen($file,'w+');
	fwrite($handle,$return);
	fclose($handle);
}

function ftp_file($ftp_server, $ftp_user_name, $ftp_user_pass, $file)
{
	$conn_id = ftp_connect($ftp_server);
	$login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);
	if ($conn_id && $login_result) {
		$upload = ftp_put($conn_id, $file, $file, FTP_BINARY);
		if ($upload) { // successful upload
			ftp_close($conn_id);
			return true;
		}
	}
	ftp_close($conn_id);
	return false;
}

function get_backup_timestamp()
{
	$db = JFactory::getDbo();
	$query = $db->getQuery(true);

	$conditions = array(
	    $db->quoteName('title') . ' = ' . $db->quote('Home'),
	    $db->quoteName('alias') . ' = ' . $db->quote('home')
	);
	$query->select($db->quoteName(array('fulltext')));
	$query->from($db->quoteName('#__content'));
	$query->where($conditions);

	$db->setQuery($query);
	$db->query();
	return $db->loadResult();
}

function update_backup_timestamp($currtime)
{
	$db = JFactory::getDbo();
	$query = $db->getQuery(true);

	$fields = array(
	    $db->quoteName('fulltext') . ' = ' . $db->quote($currtime)
	);
	$conditions = array(
	    $db->quoteName('title') . ' = ' . $db->quote('Home'),
	    $db->quoteName('alias') . ' = ' . $db->quote('home')
	);
	$query->update($db->quoteName('#__content'))->set($fields)->where($conditions);

	$db->setQuery($query);
	$db->query();
}


/*==========================================================
  Following code is called from ChronoForms as configured
  via Joomla admin GUI.
----------------------------------------------------------*/
if (false) { // Noted here for reference only
	// Start code to include in ChronoForms to call these functions
	require_once ( JPATH_BASE.DS.'templates'.DS.'yoo_master2'.DS.'bgms.php' );
}

function getRecordId($formname)
{
	$user = JFactory::getUser();
	$userId = $user->get('id');

	$id = -1;
	if (isset($_REQUEST['id'])) { // editing a record
		$id = $_REQUEST['id'];
	}
	else { // adding a new record
		$id = getTableData("#__$formname", "id", "user_id='$userId' ORDER BY created DESC LIMIT 1", 0);
		//$id = getTableData("#__gradesform,#__studentform", "#__studentform.id", "#__gradesform.user_id='$userId' AND studentId=#__studentform.id ORDER BY #__gradesform.created DESC LIMIT 1", 0);
	}

	return $id;
}

function getPhotoFileName($form, $file_name)
{
	$id = getRecordId('studentform');
	$suffix = preg_replace("/.*\.(png|gif|jpg|jpeg)/","$1",strtolower($file_name));
	return "Photo-$id.$suffix";
}

function readPhotoDir()
{
	$urlpath = 'components/com_chronoforms5/chronoforms/uploads/studentForm';
	$photos = scandir(JPATH_BASE.DS.$urlpath);
	return $photos;
}

function findPhoto($id)
{ // we need to search the folder to know the extension: use latest if multiple extensions exist
	$urlpath = 'components/com_chronoforms5/chronoforms/uploads/studentForm';
	$photos = readPhotoDir();
	$currPhotos = array(); // only for debugging
	$latestModTime = 0; $latestPhoto = '';
	foreach ($photos as $photo) {
		if (preg_match("/^Photo-$id\./",$photo)) {
			$modTime = filemtime(JPATH_BASE."/$urlpath/$photo");
			if ($modTime > $latestModTime) {
				$latestModTime = $modTime;
				$latestPhoto = "$urlpath/$photo";
			}
			array_push($currPhotos, $photo); // only for debugging
		}
	}
	// return implode("/",$currPhotos); // only for debugging

	if ($latestPhoto=='') { // if not found, use default.
		$sex = getTableData("#__studentform", "sex", "id='$id'", 0);
		if ($sex=='Male') {
			$latestPhoto = "$urlpath/boy.jpg";
		}
		else {
			$latestPhoto = "$urlpath/girl.jpg";
		}
	}

	return $latestPhoto;
}

function getExamOptions($order='ASC')
{
	$exams = array('Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (100 marks)','Test 3 (25 marks)','Test 4 (25 marks)','Final Exam (100 marks)');
	if ($order=='ASC') return $exams;
	else return array_reverse($exams);
}

function msgPostFormSubmit($linkType)
{ // To be called only after the form is saved in DB
	if ($linkType=='grades') {
		$aliasname = 'view-grades';
		$id = getRecordId('gradesform');
	}
	else if ($linkType=='sponsor') {
		$aliasname = 'view-sponsors';
		$id = getRecordId('sponsorform');
	}
	else {
		$aliasname = 'view-students';
		$id = getRecordId('studentform');
	}

	$itemLink = preg_replace("/(view-students|view-sponsors|view-grades|add-student|add-sponsor|add-grades)[?]?.*$/","$aliasname?id=$id",$_SERVER['REQUEST_URI'],1);

	echo "<div class=message>Details have been saved.<br>";
	echo "You may wish to <a href='$itemLink'>review them</a>.</div>";
}

function getPhotoCode($id, $attr='')
{
	$photo = preg_replace("/index\.php.*/","",$_SERVER['REQUEST_URI']).findPhoto($id);
	return "<img class=studentPhoto $attr src='$photo' alt='Photo'/>";
}

function getGrade($percentage)
{
	if ($percentage>=90) return 'A+';
	if ($percentage>=75) return 'A';
	if ($percentage>=65) return 'B+';
	if ($percentage>=50) return 'B';
	if ($percentage>=35) return 'C+';
	return 'C';
}

function getClassDisplayText($myclass)
{
	if ($myclass<1 || $myclass>10) return '-';
	$romans = array('-','I','II','III','IV','V','VI','VII','VIII','IX','X');
	return $romans[$myclass];
}

function deleteStudent($id)
{	// Do not delete the grades of this student.
	executeQuery("DELETE FROM #__studentform WHERE id=$id", 0);
	echo "<div class=message>Entry has been deleted.<br>";
}

function deleteSponsor($id)
{	// Do not delete the grades of this student.
	executeQuery("DELETE FROM #__sponsorform WHERE id=$id", 0);
	echo "<div class=message>Entry has been deleted.<br>";
}

function showStudent($id)
{
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Student Details</h2></td>";

	$result = getTableData("#__studentform",
							 "name,dateOfBirth,age,sex,admissionNumber,studentUid,class,`group`,parent,guardian,sponsor",
							 "id='$id'",
							 1);

	if (count($result)==0) {
		echo "</tr><tr><td><div class='error message'>The requested entry does not exist.</td></tr></table>";
		return;
	}

	$user = JFactory::getUser();
	if (!$user->guest) {
		echo "<td style='text-align:right'>";
		echo "<b><a href='".preg_replace("/view-students/","add-student",$_SERVER['REQUEST_URI'])."'>Edit</a></b>";
		echo " | <b><a onclick='return confirm(\"Are you sure you want to delete this entry?\")' href='".preg_replace("/view-students\?.*/","view-students?action=delete&id=$id",$_SERVER['REQUEST_URI'])."'>Delete</a></b>";
		echo "</td>";
	}

	echo "</tr></table>";

	$headings = array('Name','Date of Birth','Age','Sex','Admission No.','Student ID','Class','Group','Parent','Guardian','Sponsor');
	echo "<table class=studentView>";
	for ($i=0; $i<count($headings); $i++) {
		if ($i==0) { // first cell is for photo
			echo "<tr><td style='border:0px; vertical-align:top; width:256px' rowspan='"
				.strval(count($headings)+2) . "'>".getPhotoCode($id)."</td><th>" // 2 rows added at the end
				.$headings[$i]."</th><td>$result[$i]</td></tr>";
		}
		else {
			if ($i==6) { // class: convert to Roman numerals for display
				$currRes = getClassDisplayText($result[$i]);
			}
			else $currRes = $result[$i];
			echo "<tr><th>".$headings[$i]."</th><td>$currRes</td></tr>";
		}
		if ($i==count($headings)-1){ // end of processing
			$studentGradesLink = preg_replace("/\/students[?]?.*$/","/grades/view-grades?studentId=$id",$_SERVER['REQUEST_URI'],1);
			echo "<tr><td colspan=2 style='border:0px'>&nbsp;</td></tr>";
			echo "<tr><td></td><td style='border:0px'><a href='$studentGradesLink'>View grades</a></td></tr>";			
		}
	}
	echo "</table>";
}

function showSponsorList()
{
	
}

function printAllGradesTable($data, $year, $class)
{
	$rows = array('Kannada','English','Hindi','Mathematics','General Science','Social Studies','Total','Physical Education','Computer Science','Attendance','Conduct','Remarks','Date');
	$cols = array_merge(array('Subject'),getExamOptions('ASC'));
	echo "<h3 style='margin-top:40px'>$year / Class $class</h3>";
	echo "<table class=studentAllGrades>";

	echo "<tr rowspan=2><th>$cols[0]</th>";
	for ($i=1; $i<count($cols); $i++) {
		if (isset($data[$cols[$i]]['link']) && $data[$cols[$i]]['link']) echo "<th colspan=3><a href='".$data[$cols[$i]]['link']."'>".preg_replace("/ \(/","<br>(",$cols[$i])."</a></th>";
		else echo "<th colspan=3>".preg_replace("/ \(/","<br>(",$cols[$i])."</th>";
	}
	echo "</tr>";

	echo "<tr><td>&nbsp;</td>".str_repeat("<td class=gradeHead>Grade</td><td class=gradeHead>%</td><td class=gradeHead>Marks</td>",count($cols)-1)."</tr>";
	for ($i=0; $i<count($rows); $i++) {
		if ($rows[$i]=='Total') echo "<tr><td><b>".$rows[$i]."</b></td>";
		else echo "<tr><td>".$rows[$i]."</td>";
		for ($j=1; $j<count($cols); $j++) {
			if (!isset($data[$rows[$i]][$cols[$j]])) {
				if ($i<=6) $cell = array('grade'=>'','%'=>'','marks'=>'');
				else $cell = '';
			}
			else $cell = $data[$rows[$i]][$cols[$j]];
			if ($i<=6) {
				if ($rows[$i]=='Total') {
					echo "<td><b>".$cell['grade']."</b></td>";
					echo "<td class=marks><b>".$cell['%']."</b></td>";
					echo "<td class=marks><b>".$cell['marks']."</b></td>";
				}
				else {
					echo "<td>".$cell['grade']."</td>";
					echo "<td class=marks>".$cell['%']."</td>";
					echo "<td class=marks>".$cell['marks']."</td>";
				}
			}
			else {
				echo "<td colspan=3>".$cell."</td>";
			}
		}
		echo "</tr>";
	}
	echo "</table>";
}

function showStudentAllGrades($id)
{	// $id is with reference to studentsform
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Student Grades (All Exams)</h2></td>";
	echo "</tr></table>";

	$studentDetails = getTableData("#__studentform","name,studentUid,class,`group`","id=$id", 1);
	if (count($studentDetails)==0) {
		echo "<div class='error message'>The requested student does not exist. Grades cannot be displayed.</div>";
		return;
	}
	
	echo "<table class=studentView>";
	echo "<tr><td rowspan=4 width=120px>".getPhotoCode($id, "style='width:100px'")."</td>";
	$studentLink = preg_replace("/\/grades\/.*/","/students/view-students?id=".$id,$_SERVER['REQUEST_URI']);
	echo "  <th>Student Name</th><td><a href='".$studentLink."'>".$studentDetails[0]."</a></td></tr>";
	echo "<tr><th>Student ID</th><td>".$studentDetails[1]."</td></tr>";
	echo "<tr><th>Class</th><td>".getClassDisplayText($studentDetails[2])."</td></tr>";
	echo "<tr><th>Group</th><td>".$studentDetails[3]."</td></tr>";
	echo "</table>";

	$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
	$results = getTableData("#__studentform,#__gradesform",
							 "studentId,year,examType,DATE_FORMAT(#__gradesform.created,'%d %M %Y'),DATE_FORMAT(#__gradesform.modified,'%d %M %Y'),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,physicalEducation,conduct,attendance,remarks,#__gradesform.id,#__gradesform.class",
							 "#__studentform.id=studentId AND studentId=$id ORDER BY year DESC, FIELD(examType,$examOptStr)");

	if (count($results)==0) {
		echo "<table class=studentView>";
		echo "<tr><td><div class=message style='margin-top:50px'>No grades have been recorded for this student.</div></td></tr></table>";
		echo "</table>";
		return;
	}

	$year = ''; $gradesId=-1; $data = array();
	for ($i=0; $i<count($results); $i++) {
		$res = $results[$i];
		if ($year!='' && $res[1]!=$year) { // start of a new year, print processed one
			printAllGradesTable($data, $year, $class);
			$data = array();
		}
		$year = $res[1];
		$class = getClassDisplayText($res[17]);
		$examType = $res[2];
		$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$examType);
		$numSubjects = 0;
		if (setGrade($data['Kannada'][$examType], $res[5], $maxMarks)) $numSubjects++;
		if (setGrade($data['English'][$examType], $res[6], $maxMarks)) $numSubjects++;
		if (setGrade($data['Hindi'][$examType], $res[7], $maxMarks)) $numSubjects++;
		if (setGrade($data['Mathematics'][$examType], $res[8], $maxMarks)) $numSubjects++;
		if (setGrade($data['General Science'][$examType], $res[9], $maxMarks)) $numSubjects++;
		if (setGrade($data['Social Studies'][$examType], $res[10], $maxMarks)) $numSubjects++;
		setGrade($data['Total'][$examType], $res[5]+$res[6]+$res[7]+$res[8]+$res[9]+$res[10], $numSubjects*$maxMarks);
		$data['Physical Education'][$examType] = $res[11];
		$data['Computer Science'][$examType] = $res[12];
		$attendanceFields = explode('/',preg_replace("/ /","",$res[14]));
		if (count($attendanceFields)==2 && $attendanceFields[1]) {
			$percentage = floor(0.5+100*$attendanceFields[0]/$attendanceFields[1]);
			$data['Attendance'][$examType] = $res[14]." ($percentage %)";
		}
		else {
			$data['Attendance'][$examType] = $res[14];
		}
		$data['Conduct'][$examType] = $res[13];
		$data['Remarks'][$examType] = $res[15];
		if (preg_match("/[1-9]/",$res[4])) $data['Date'][$examType] = $res[4];
		else $data['Date'][$examType] = $res[3];
		$gradesLink = preg_replace("/\/grades\/.*/","/grades/view-grades?id=".$res[16],$_SERVER['REQUEST_URI']);
		$data[$examType]['link'] = $gradesLink; // we will have id per exam
	}
	if ($year!='') printAllGradesTable($data, $year, $class);
}

function setGrade(&$data, $marks, $maxMarks)
{
	if ($marks) {
		$data['%'] = floor(0.5+100*$marks/$maxMarks);
		$data['grade'] = getGrade($data['%']);
		$data['marks'] = $marks;
		return true;
	}
	return false;
}

function getOptStr($opts, $autoVal=true, $startVal=0, $sel='')
{
	$str = ''; $i=$startVal;
	foreach ($opts as $opt) {
		if ($autoVal) $val = $i;
		else $val = $opt;
		$i++;

		if ($sel==$opt) $str .= "<option selected=selected value='$val'>$opt</option>";
		else $str .= "<option value='$val'>$opt</option>";
	}
	return $str;
}

function deleteStudentGrades($id)
{
	executeQuery("DELETE FROM #__gradesform WHERE id=$id", 0);
	echo "<div class=message>Entry has been deleted.<br>";
}

function showStudentGrades($id)
{ // $id is with reference to gradesform
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Student Grades</h2></td>";

	$gradesEntryExists = getTableData("#__gradesform","COUNT(*)","id=$id", 0);
	if ($gradesEntryExists==0) {
		echo "</tr><tr><td><div class='error message'>The requested entry does not exist.</td></tr></table>";
		return;
	}

	$result = getTableData("#__studentform,#__gradesform",
							"studentId,name,#__studentform.class,#__gradesform.class,year,examType,DATE_FORMAT(#__gradesform.created,'%d %M %Y'),DATE_FORMAT(#__gradesform.modified,'%d %M %Y'),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,physicalEducation,conduct,attendance,remarks",
							 "#__studentform.id=studentId AND #__gradesform.id='$id'",
							 1);
	if (count($result)==0) {
		echo "</tr><tr><td><div class='error message'>The requested student does not exist. Grades cannot be displayed.</td></tr></table>";
		return;
	}

	$user = JFactory::getUser();
	if (!$user->guest) {
		echo "<td style='text-align:right'>";
		echo "<b><a href='".preg_replace("/view-grades/","add-grades",$_SERVER['REQUEST_URI'])."'>Edit</a></b>";
		echo " | <b><a onclick='return confirm(\"Are you sure you want to delete this entry?\")' href='".preg_replace("/view-grades\?.*/","view-grades?action=delete&id=$id",$_SERVER['REQUEST_URI'])."'>Delete</a></b>";
		echo "</td>";
	}
	echo "</tr></table>";
	
	$studentLink = preg_replace("/\/grades[?]?.*$/","/students/view-students?id=$result[0]",$_SERVER['REQUEST_URI'],1);
	$studentGradesLink = preg_replace("/\/grades[?]?.*$/","/grades/view-grades?studentId=$result[0]",$_SERVER['REQUEST_URI'],1);
							 
	$headings = array('Student Name','Current','This Grade For','Year','Assessment','Date','Kannada','English','Hindi','Mathematics','General Science','Social Studies','Computer Science','Physical Education','Conduct','Attendance','Remarks');
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$result[5]);
	$totalMarks = 0; $numSubjects = 0;
	echo "<table class=studentView>";
	for ($i=$j=0; $i<count($headings); $i++, $j++) {
		$fieldVal = $result[$j+1];
		if ($i==0) { // first cell is for photo
			echo "<tr><td style='border:0px; vertical-align:top; width:256px' rowspan='"
				.strval(count($headings)+6) . "'>" . getPhotoCode($id)."</td><th>" // 6 rows are added for separation and total marks
				. $headings[$i]."</th><td colspan=3><a href='$studentLink'>$fieldVal</a></td></tr>";
		}
		else if ($i==1 || $i==2)  {
			echo "<tr><th>".$headings[$i]."</th><td colspan=3>Class ".getClassDisplayText($fieldVal)."</td></tr>";
		}
		else if ($i==5) {
			if (preg_match("/[1-9]/",$result[7])) $fieldVal = $result[7]; // use modified datetime
			echo "<tr><th>".$headings[$i]."</th><td colspan=3>$fieldVal</td></tr>";
			$j++;
		}
		else if ($i>=6 && $i<=11) {
			if ($fieldVal>0) {
				$totalMarks += $fieldVal;
				$numSubjects++;
				$percentage = floor(0.5+100*$fieldVal/$maxMarks);
				echo "<tr class=marks><th>".$headings[$i]."</th>";
				echo "<td style='text-align:left'>".getGrade($percentage)."</td>";
				echo "<td>$percentage %</td>";
				echo "<td>$fieldVal</td>";
				echo "</tr>";
			}
			else { // we assume that student did not take this subject: no one will get zero!
				echo "<tr class=marks><th>".$headings[$i]."</th>";
				echo "<td style='text-align:left'>&nbsp;</td>";
				echo "<td>&nbsp;</td>";
				echo "<td>&nbsp;</td>";
				echo "</tr>";
			}
		}
		else if ($i==15) {
			$attendanceFields = explode('/',preg_replace("/ /","",$fieldVal));
			if (count($attendanceFields)==2 && $attendanceFields[1]) {
				$percentage = floor(0.5+100*$attendanceFields[0]/$attendanceFields[1]);
				echo "<tr><th>".$headings[$i]."</th><td colspan=3>$fieldVal ($percentage %)</td></tr>";
			}
			else {
				echo "<tr><th>".$headings[$i]."</th><td colspan=3>$fieldVal</td></tr>";
			}
		}
		else echo "<tr><th>".$headings[$i]."</th><td colspan=3>$fieldVal</td></tr>";

		if ($i==5) {
			echo "<tr><td colspan=4 style='border:0px'>&nbsp;</td></tr>";
			echo "<tr><td style='border:0px'>&nbsp;</td><td class=gradeHead style='text-align:left'>Grade</td><td class=gradeHead>Percentage</td><td class=gradeHead>Marks</td></tr>";
		}
		else if ($i==11) {
			if ($numSubjects*$maxMarks) {
				$percentage = floor(0.5+100*$totalMarks/($numSubjects*$maxMarks)); // count only subjects taken for overall percentage
				echo "<tr class=marks><td style='text-align:left'><b>Total</b></td><td style='text-align:left'><b>".getGrade($percentage)."</b></td><td><b>$percentage %</b></td><td><b>$totalMarks</b></td></tr>";
			}
			else echo "<tr class=marks><td style='text-align:left'><b>Total</b></td><td style='text-align:left'><b>&nbsp;</b></td><td><b>&nbsp;</b></td><td><b>&nbsp;</b></td></tr>";
			echo "<tr><td colspan=4 style='border:0px'>&nbsp;</td></tr>";
		}
		else if ($i==count($headings)-1){ // end of processing
			echo "<tr><td colspan=4 style='border:0px'>&nbsp;</td></tr>";
			echo "<tr><td></td><td colspan=3 style='border:0px'><a href='$studentGradesLink'>View all grades</a> of this student.</td></tr>";			
		}
	}
	echo "</table>";
}

function validateGradesForm($form)
{
	$studentId = $form->data['studentId'];
	$year = $form->data['year'];
	$examType = $form->data['examType'];

	$user = JFactory::getUser();
	$userId = $user->get('id');
	$id = getTableData("#__gradesform", "id",
					"user_id='$userId' AND studentId='$studentId' AND year='$year' AND examType='$examType' ORDER BY modified DESC, created DESC LIMIT 1", 0);

	if ($id!=0 && (!isset($_REQUEST['id']) || $id!=$_REQUEST['id'])) {
		// either adding a new record or editing an existing one: clash with record in table ($id)
		$itemLink = preg_replace("/(view-students|view-sponsors|view-grades|add-student|add-sponsor|add-grades)[?]?.*$/","add-grades?id=$id",$_SERVER['REQUEST_URI'],1);
		echo "<div class='error message'>Grades for this student were already entered earlier.<br>";
		echo "You may wish to <a href='$itemLink'>edit them</a>.</div>";
		return 'fail';
	}
	return 'success';
}

function isGradesFormToBeShown()
{
	$numStudents = getTableData("#__studentform", "COUNT(id)", "1", 0);
	if ($numStudents) return 'success';
	else {
		echo "<div class=message>Can't add grades because no students have been entered into the system.<br>";
		return 'fail';
	}
}

function printCustomCodeGradesForm()
{
	$options = array();
	$results = getTableData("#__studentform", "class,id,name", "1 ORDER BY class+0, name");
	foreach ($results as $result) { // presence of $results checked in isGradesFormToBeShown()
		array_push($options, "$result[0]:$result[1]:$result[2]");
	}
	insertGradesFormJS();
	echo "<div id=classStudentMap style='display:none'>".implode('/',$options)."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='loadStudentNames(\"init\")' />\n";
}

function printCustomCodeReportsForm()
{
	$options = array();
	$results = getTableData("#__studentform", "class,id,name", "1 ORDER BY class+0, name");
	foreach ($results as $result) {
		array_push($options, "$result[0]:$result[1]:$result[2]");
	}
	insertReportsFormJS();
	echo "<div id=classStudentMap style='display:none'>".implode('/',$options)."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadReportsForm()' />\n";
}

function printCustomCodeSponsorForm()
{
	$options = array();
	$results = getTableData("#__studentform", "id,name", "1 ORDER BY name");
	foreach ($results as $result) {
		array_push($options, "$result[0]:$result[1]");
	}
	insertSponsorFormJS();
	echo "<div id=idStudentMap style='display:none'>".implode('/',$options)."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadSponsorForm()' />\n";
}

function insertGradesFormJS()
{
?>
<script type='text/javascript'>
//<![CDATA[

window.addEvent('domready', function() {
  $('class').addEvent('change', function() {
    loadStudentNames('onchange');
  });

  $('studentName').addEvent('change', function() {
    setStudentId();
  });

  $('gradesSubmit').addEvent('click', function() {
    return validateForm();
  });
});

function validateForm()
{
	elem = document.getElementById('attendance');
	var str = elem.value;
	fields = str.replace(/ /g,'').split('/');
	re = new RegExp('[0-9]+');
	if (fields.length!=2 ||
		fields[0].match(re)==null ||
		fields[1].match(re)==null ||
		parseInt(fields[0]) > parseInt(fields[1])) {
		alert("INPUT ERROR. Attendance input format: attended days / total days. Example, 24/30.");
		elem.value = '';
		return false;
	}
	return true;
}

function setStudentId()
{
	studentIdElem = document.getElementById('studentId');
	studentNameElem = document.getElementById('studentName');
	studentIdElem.value = studentName.options[studentName.selectedIndex].value;
}

function loadStudentNames(context)
{
	studentNameElem = document.getElementById('studentName');
	while(studentNameElem.options.length > 0) studentNameElem.remove(0);

	classElem = document.getElementById('class');
	mapElem = document.getElementById('classStudentMap');

	studentIdElem = document.getElementById('studentId');
	if (context=='init' && studentIdElem.value!=-1) { // editing a record
		re = new RegExp('([0-9]+):'+studentIdElem.value+':([A-Za-z ]+)');
    	found = mapElem.innerHTML.match(re);
		if (found.length) {
			for (var i=0; i<classElem.length; i++) {
				if (classElem.options[i].value==found[1]) {
					classElem.selectedIndex = i;
					break;
				}
			}
		}
	}

	students = mapElem.innerHTML.split('/');
	selectIndex = -1;
	for (var i=0; i<students.length; i++) {
		fields = students[i].split(':');
		if (classElem.value == fields[0]) { // applicable class
			var option = document.createElement("option");
			option.value = fields[1];
			option.text = fields[2];
			studentNameElem.add(option);

			if (studentIdElem.value==fields[1]) selectIndex = studentNameElem.length-1;
		}
	}

	if (selectIndex!=-1) {
		studentNameElem.selectedIndex = selectIndex;
		//classElem.disabled=true;
		//studentNameElem.disabled=true;
	}
	else setStudentId();
}
//]]>
</script>
<?php
}

function insertReportsFormJS()
{
?>
<script type='text/javascript'>
//<![CDATA[

window.addEvent('domready', function() {
  $('class').addEvent('change', function() {
    loadStudentNames('onchange');
  });

  $('reportTypeId').addEvent('change', function() {
    processFilters();
  });
});

function onLoadReportsForm()
{
	loadStudentNames('init');
 	processFilters();
}

function processFilters()
{
	// Filters: reportTypeId reportYearId reportExamTypeId class studentId
	// reportTypeId: 'View student sex ratio','View student sponsorship','View grades from an assessment','View top students from an assessment','View a student\'s performance over time'

	reportTypeElem = document.getElementById('reportTypeId');
	reportYearElem = document.getElementById('reportYearId');
	reportExamTypeElem = document.getElementById('reportExamTypeId');
	classElem = document.getElementById('class');
	studentNameElem = document.getElementById('studentId');

	switch (parseInt(reportTypeElem.value)) {
		case 2:
		case 3:
			reportYearElem.style.display = 'block';
			reportExamTypeElem.style.display = 'block';
			classElem.style.display = 'none';
			studentNameElem.style.display = 'none';
			break;
		case 4:
			reportYearElem.style.display = 'none';
			reportExamTypeElem.style.display = 'none';
			classElem.style.display = 'block';
			studentNameElem.style.display = 'block';
			break;
		default: // includes 0 and 1
			reportYearElem.style.display = 'none';
			reportExamTypeElem.style.display = 'none';
			classElem.style.display = 'none';
			studentNameElem.style.display = 'none';
			break;
	}
}

function loadStudentNames(context)
{
	studentNameLoadElem = document.getElementById('studentIdLoad');

	studentNameElem = document.getElementById('studentId');
	while(studentNameElem.options.length > 0) studentNameElem.remove(0);

	classElem = document.getElementById('class');
	mapElem = document.getElementById('classStudentMap');

	students = mapElem.innerHTML.split('/');
	for (var i=0; i<students.length; i++) {
		fields = students[i].split(':');
		if (classElem.value == fields[0]) { // applicable class
			var option = document.createElement("option");
			option.value = fields[1];
			option.text = fields[2];
			studentNameElem.add(option);
			if (studentNameLoadElem.value==fields[1])
				studentNameElem.selectedIndex = studentNameElem.options.length-1;
		}
	}
}
//]]>
</script>
<?php
}

function insertSponsorFormJS()
{
?>
<script type='text/javascript'>
//<![CDATA[
function onLoadSponsorForm()
{
	loadStudentNames('init');
}

function loadStudentNames(context)
{
	sponsoredStudentsElem = document.getElementById('sponsoredStudents');
	while(sponsoredStudentsElem.options.length > 0) sponsoredStudentsElem.remove(0);

	mapElem = document.getElementById('idStudentMap');

	if (mapElem.innerHTML=='') {
		var option = document.createElement("option");
		option.value = -1;
		option.text = "No students defined.";
		sponsoredStudentsElem.add(option);
		sponsoredStudentsElem.disabled = true;
		return;		
	}

	students = mapElem.innerHTML.split('/');	
	for (var i=0; i<students.length; i++) {
		fields = students[i].split(':');
		var option = document.createElement("option");
		option.value = fields[0];
		option.text = fields[1];
		sponsoredStudentsElem.add(option);
/*		for(var j=0; j<sponsoredStudentsLoad.length; j++) {
            if(sponsoredStudentsLoad[j] == fields[0]) {
				sponsoredStudentsElem.selectedIndex = studentNameElem.options.length-1;
            }
        }*/
	}

	//sponsoredStudentsLoadElem = document.getElementById('sponsoredStudentsLoad');
	//sponsoredStudentsLoad = sponsoredStudentsLoadElem.split(',');
	//sponsoredStudentsElem.val(sponsoredStudentsLoad); 
}
//]]>
</script>
<?php	
}

function showStudentFormTitle()
{
	if (isset($_REQUEST['id'])) {
		$id = $_REQUEST['id'];
		echo "<table class=studentPageTitle><tr>";
		echo "<td><h2>Editing Student Details</h2></td>";
		echo "</tr></table>";
		echo getPhotoCode($id);
		return array('id' => $id);
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Adding a New Student</h2></td>";
	echo "</tr></table>";
	return array('id' => '99999999');
}

function showSponsorFormTitle()
{
	if (isset($_REQUEST['id'])) {
		$id = $_REQUEST['id'];
		echo "<table class=studentPageTitle><tr>";
		echo "<td><h2>Editing Sponsor Details</h2></td>";
		echo "</tr></table>";
		echo getPhotoCode($id);
		return array('id' => $id);
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Adding a New Sponsor</h2></td>";
	echo "</tr></table>";
	return array('id' => '99999999');
}

function showGradesFormTitle()
{
	if (isset($_REQUEST['id'])) {
		$id = $_REQUEST['id'];
		echo "<table class=studentPageTitle><tr>";
		echo "<td><h2>Editing Student Grades</h2></td>";
		echo "</tr></table>";
		return array('id' => $id);
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Adding New Grades</h2></td>";
	echo "</tr></table>";
	return array('id' => '99999999');
}

function showStudentList()
{
	if (isset($_REQUEST['id'])) {
		if (isset($_REQUEST['action']) && $_REQUEST['action']=='delete') deleteStudent($_REQUEST['id']);
		else showStudent($_REQUEST['id']);
		return;
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Listing All Students</h2></td>";
	echo "</tr></table>";

	$allPhotoStr = '/'.implode('/',readPhotoDir()).'/';
	$itemLink = preg_replace("/view-students\??.*/","view-students",$_SERVER['REQUEST_URI']);
	$columnHeadings = array('Photo','Student ID','Admission No.','Name','Class','Group','Sex','Parent','Guardian','Sponsor');
	$students = getTableData("#__studentform",
							 "id,studentUid,admissionNumber,name,class,`group`,sex,parent,guardian,sponsor",
							 "1 ORDER BY name ASC"
				);

	# Find duplicates in studentUid
	$dups = array(); $uids = array();
	foreach ($students as $student) array_push($uids, $student[1]);
	foreach(array_count_values($uids) as $val => $c) {
	    if($c > 1) $dups[] = $val;
	}

	echo "<table class=studentList>";
	if (count($dups)>0) {
		echo "<tr><td colspan='".count($columnHeadings)."' style='border:0px;text-align:right'><span class=duplicateErr>*</span> Please correct duplicate student IDs.</td></tr>";
	}
	echo "<tr>";
	foreach ($columnHeadings as $colHead) {
		echo "<th>$colHead</th>";
	}
	echo "</tr>";

	if (count($students)==0) {
		echo "<tr><td colspan=".count($columnHeadings)."><div class=message>No students have been entered into the system.</div></td></tr></table>";
		return;
	}

	foreach ($students as $student) {
		$id = $student[0];
		echo "<tr>";
		if (preg_match("/\/Photo-$id\.(png|gif|jpg|jpeg)\//",$allPhotoStr)) {
			echo "<td>".getPhotoCode($id, "style='width:64px'")."</td>";
		}
		else echo "<td>&nbsp;</td>";
		for ($i=1; $i<count($student); $i++) { // ignore id
			if ($i==1) { // indicate duplicates
				if (in_array($student[$i],$dups)) echo "<td>".$student[$i]." <span class=duplicateErr>*</span></td>";
				else echo "<td>".$student[$i]."</td>";
			}
			else if ($i==3) { // have link for name
				echo "<td><a href='$itemLink?id=$id'>".$student[$i]."</td>";
			}
			else if ($i==4) { // conversion for class
				echo "<td>".getClassDisplayText($student[$i])."</td>";
			}
			else echo "<td>".$student[$i]."</td>";
		}
		echo "</tr>";
	}
	echo "</table>";
}

function showGradesList()
{
	if (isset($_REQUEST['id'])) {
		if (isset($_REQUEST['action']) && $_REQUEST['action']=='delete') deleteStudentGrades($_REQUEST['id']);
		else showStudentGrades($_REQUEST['id']);
		return;
	}
	else if (isset($_REQUEST['studentId'])) {
		showStudentAllGrades($_REQUEST['studentId']);
		return;
	}

	if (isset($_REQUEST['year'])) {
		$year = $_REQUEST['year'];
	}
	else {
		$year = getTableData("#__gradesform","year","1 ORDER BY year DESC LIMIT 1",0);
	}

	if (isset($_REQUEST['examType'])) {
		$examType = $_REQUEST['examType'];
	}
	else {
		$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
		$examType = getTableData("#__gradesform","examType","1 ORDER BY FIELD(examType,$examOptStr) LIMIT 1",0);
	}
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$examType);

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Recent Grades</h2></td>";
	echo "</tr></table>";

	$allPhotoStr = '/'.implode('/',readPhotoDir()).'/';
	$columnHeadings = array('Photo','Current Class','Student ID','Name','Kannada','English','Hindi','Mathematics','General Science','Social Studies','Total','Details');

	# Get only current class, not the class where the student was in the past
	# If there are no grades for a combination of year and examType, the student will not be displayed
	$students = getTableData("#__studentform,#__gradesform",
							 "studentId,#__studentform.class,studentUid,name,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks",
							 "#__studentform.id=studentId AND year='$year' AND examType='$examType' ORDER BY #__studentform.class+0, name"
				);

	echo "<table class=studentList>";

	// Display form for user selection
	echo "<tr style='border:0px'><td colspan=".count($columnHeadings)." style='text-align:right;border:0px'>";
	$actionUrl = preg_replace("/[?].*/","",$_SERVER['REQUEST_URI']);
	echo "<form id=gradeSelForm method=get onsubmit='return true;' action='$actionUrl'>";
	#$years = getTableData("#__gradesform","DISTINCT(year)","1 ORDER BY year DESC");
	$yrsArr = array('2014-15','2013-14');
	#foreach ($years as $yr) array_push($yrsArr,$yr[0]);
	echo "<select style='width:100px;margin-right:5px' name=year>".getOptStr($yrsArr,false,0,$year)."</select>";
	echo "<select style='margin-right:5px' name=examType>".getOptStr(getExamOptions('DESC'),false,0,$examType)."</select>";
	echo "<input type=submit value='Get Grades' />";
	echo "</form>";
	echo "</td></tr>";

	# Find duplicates in combination of student, year, examType: already filtered for the last two
	$dups = array(); $studentIds = array();
	foreach ($students as $student) array_push($studentIds, $student[0]);
	foreach(array_count_values($studentIds) as $val => $c) {
	    if($c > 1) $dups[] = $val;
	}

	if (count($dups)>0) {
		echo "<tr><td colspan='".count($columnHeadings)."' style='border:0px;text-align:right'><span class=duplicateErr>*</span> Please correct duplicate entries for the same student.</td></tr>";
	}

	echo "<tr>";
	foreach ($columnHeadings as $colHead) {
		echo "<th>$colHead</th>";
	}
	echo "</tr>";

	if (count($students)==0) {
		echo "<tr><td colspan=".count($columnHeadings)."><div class=message>No grades have been recorded for this combination of year and assessment type.</div></td></tr></table>";
		return;
	}

	foreach ($students as $student) {
		$totalMarks = $numSubjects = 0;
		$studentId = $student[0];
		$data = array();
		echo "<tr>";
		$itemLink = preg_replace("/view-grades\??.*/","view-grades",$_SERVER['REQUEST_URI']);
		if (preg_match("/\/Photo-$studentId\.(png|gif|jpg|jpeg)\//",$allPhotoStr)) {
			echo "<td>".getPhotoCode($studentId,"style='width:64px'")."</td>";
		}
		else echo "<td>&nbsp;</td>";
		for ($i=1; $i<count($student); $i++) { // ignore id
			if ($i==1) {
				echo "<td>".getClassDisplayText($student[$i])."</td>";
			}
			else if ($i==3) { // have link for name and indicate duplicates
				$itemLink = preg_replace("/\/grades\/.*/","/students/view-students",$_SERVER['REQUEST_URI']);
				if (in_array($studentId,$dups)) echo "<td><a href='$itemLink?id=$studentId'>".$student[$i]." <span class=duplicateErr>*</span></td>";
				else echo "<td><a href='$itemLink?id=$studentId'>".$student[$i]."</td>";
			}
			else if ($i>=4 && $i<=9) {
				if (setGrade($data,$student[$i],$maxMarks)) {
					$totalMarks += $student[$i];
					$numSubjects++;
					echo "<td>".$data['grade']."</td>";
				}
				else echo "<td>&nbsp;</td>";
			}
			else echo "<td>".$student[$i]."</td>";
			if ($i==count($student)-1) {
				// Total
				if (setGrade($data,$totalMarks,$numSubjects*$maxMarks)) echo "<td>".$data['grade']."</td>";
				else echo "<td>&nbsp;</td>";

				// link to student all grades
				$itemLink = preg_replace("/\/grades\/.*/","/grades/view-grades",$_SERVER['REQUEST_URI']);
				echo "<td><a href='$itemLink?studentId=$studentId'>Details</td>";
			}
		}
		echo "</tr>";
	}
	echo "</table>";
}

function showReports()
{
	$numStudents = getTableData("#__studentform", "COUNT(id)", "1", 0);
	if ($numStudents==0) {
		echo "<div class=message>There are no reports to view because no students have been entered into the system.<br>";
		return;
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing School Reports</h2></td>";
	echo "</tr></table>";

	$graphs = array('View student profile','View student sponsorship','View grades from an assessment','View top students from an assessment','View a student\'s performance over time');

	if (isset($_REQUEST['reportType'])) {
		$reportTypeKey = $_REQUEST['reportType'];
	}
	else {
		$reportTypeKey = 0;
	}
	$reportType = $graphs[$reportTypeKey];

	if (isset($_REQUEST['year'])) {
		$year = $_REQUEST['year'];
	}
	else {
		$year = getTableData("#__gradesform","year","1 ORDER BY year DESC LIMIT 1",0);
	}

	if (isset($_REQUEST['examType'])) {
		$examType = $_REQUEST['examType'];
	}
	else {
		$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
		$examType = getTableData("#__gradesform","examType","1 ORDER BY FIELD(examType,$examOptStr) LIMIT 1",0);
	}

	$classes = array('I','II','III','IV','V','VI','VII','VIII','IX','X');
	if (isset($_REQUEST['class'])) {
		$class = $_REQUEST['class'];
		$studentId = $_REQUEST['studentId'];
	}
	else {
		$class = 1;
		$studentId = getTableData("#__studentform","id","class='$class' ORDER BY name LIMIT 1");
	}

	// Display form for user selection
	echo "<table class=studentList>";
	echo "<tr style='border:0px'><td style='border:0px'>";
	$actionUrl = preg_replace("/[?].*/","",$_SERVER['REQUEST_URI']);
	echo "<form id=reportSelForm method=get onsubmit='return true;' action='$actionUrl'>";
	echo "<select id=reportTypeId style='width:320px;margin-right:5px;float:left' name=reportType>".getOptStr($graphs,true,0,$reportType)."</select>";
	echo "<select id=class style='margin-right:5px;display:none;float:left' name=class>".getOptStr($classes,true,1,$classes[$class-1])."</select>";
	echo "<input id=studentIdLoad type=hidden disabled=disabled value='$studentId' />";
	echo "<select id=studentId style='margin-right:5px;display:none;float:left' name=studentId></select>"; # leave options to JS
	#$years = getTableData("#__gradesform","DISTINCT(year)","1 ORDER BY year DESC");
	$yrsArr = array('2014-15','2013-14');
	#foreach ($years as $yr) array_push($yrsArr,$yr[0]);
	echo "<select id=reportYearId style='width:100px;margin-right:5px;display:none;float:left' name=year>".getOptStr($yrsArr,false,0,$year)."</select>";
	echo "<select id=reportExamTypeId style='margin-right:5px;display:none;float:left' name=examType>".getOptStr(getExamOptions('DESC'),false,0,$examType)."</select>";
	echo "<input type=submit value='View Report' />";
	echo "</form>";
	echo "</td></tr>";
	echo "</table>";

	$currtime = time();
	$pathPrefix = JURI::root();
	echo "<script src='$pathPrefix/media/d3/d3.v3.min.js'></script>\n";

	// Delete old files: 10 minutes
	$datafiles = scandir(JPATH_BASE);
	foreach($datafiles as $file) {
		if(preg_match("/^data.*\.(csv)$/",$file) && is_file($file) 
			&& $currtime - filemtime($file) >= 10*60) {
			unlink($file);
		}
	}
	
	switch ($reportTypeKey) {
		default:
			reportStudentProfile($currtime,$pathPrefix);
			break;
		case 1:
			reportSponsorship($currtime,$pathPrefix);
			break;
		case 2:
			reportGrades($currtime,$pathPrefix,$year,$examType);
			break;
		case 3:
			reportTopStudents($currtime,$pathPrefix,$year,$examType);
			break;
		case 4:
			reportStudentPerformance($currtime,$pathPrefix,$class,$studentId);
			break;
	}
}

function getCsvFormat($arr, $fillZeros=false)
{
	$retStr = ''; $prevVal = -1;
	foreach ($arr as $row) { // can't use indices since they can be any type
		if ($fillZeros && $prevVal!=-1 && $prevVal+1<$row[0]) {
			for ($k=$prevVal+1; $k<$row[0]; $k++) {
				$retStr .= "$k".str_repeat(',0',count($row)-1)."\n";
			}
		}
		$prevVal = $row[0];
		for ($j=0; $j<count($row); $j++) {
			if ($j==count($row)-1) $retStr .= $row[$j]."\n";
			else $retStr .= $row[$j].",";
		}
	}
	return $retStr;
}

function printToFile($filename, $header, $str)
{
	$basePath = "/home/iedf/www/bgms"; // "C:\wamp\www"; // /var/www /home/iedf/www/bgms
	$fh = fopen("$basePath/$filename", 'w') or die("Can't open file for saving data into CSV file.");
	fwrite($fh, "$header\n$str");
	fclose($fh);
}

function reorderByAge($results)
{	// Function is not used for the moment: handled in MySQL query
	$arr = array(); $minAge = $maxAge = -1;
	foreach ($results as $result) {
		if ($minAge==-1) { // first age
			$minAge = $result[0];
			$arr[$minAge] = array($minAge, 0, 0);
		}
		if ($maxAge<$result[0]) { // first or next age
			for ($j=$maxAge+1; $maxAge!=-1 && $j<=$result[0]; $j++) {
				$arr[$j] = array($j, 0, 0);
			}
			$maxAge = $result[0];
		}
		if ($result[1]=='Female') $arr[$result[0]][1] = $result[2];
		else $arr[$result[0]][2] = $result[2];
	}
	return $arr;
}

function reportStudentProfile($currtime, $pathPrefix)
{
	echo "<h3>Sex Ratio</h3>";
	$csvFile = "dataSexRatio-$currtime.csv";
	$results = getTableData("#__studentform", "sex,COUNT(*)", "1 GROUP BY sex");
	printToFile($csvFile, "sex,count", getCsvFormat($results, false));
	echo "<sexRatio src='/$csvFile'></sexRatio>\n";

	echo "<div class=graphTitle><h3>Age Profile</h3></div>";
	$csvFile = "dataAgeHist-$currtime.csv";
	$results = getTableData("#__studentform", "age,SUM(CASE WHEN sex='Female' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' THEN 1 ELSE 0 END)", "1 GROUP BY age ORDER BY age+0");
	printToFile($csvFile, "Age,Female,Male", getCsvFormat($results, true));
	echo "<ageHist src='/$csvFile'></ageHist>\n";

	echo "<div class=graphTitle><h3>Group Profile</h3></div>";
	$csvFile = "dataGroupProfile-$currtime.csv";
	$results = getTableData("#__studentform", "`group`,SUM(CASE WHEN sex='Female' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' THEN 1 ELSE 0 END)", "1 GROUP BY `group` ORDER BY `group`");
	printToFile($csvFile, "Group,Female,Male", getCsvFormat($results, true));
	echo "<groupProfile src='/$csvFile'></groupProfile>\n";

	echo "<div class=graphTitle><h3>Class Profile</h3></div>";
	$csvFile = "dataClassProfile-$currtime.csv";
	$results = getTableData("#__studentform", "class,SUM(CASE WHEN sex='Female' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' THEN 1 ELSE 0 END)", "1 GROUP BY class ORDER BY class+0");
	$arr = array();
	for($i=0; $i<count($results); $i++) {
		$arr[$i] = $results[$i];
		$arr[$i][0] = getClassDisplayText($arr[$i][0]);
	}
	printToFile($csvFile, "Class,Female,Male", getCsvFormat($arr, false));
	echo "<classProfile src='/$csvFile'></classProfile>\n";

	echo "<script src='$pathPrefix/media/d3/studentProfile.js'></script>";

	return;
}

function reportSponsorship($currtime, $pathPrefix)
{
	echo "<h3>Sponsorship Summary</h3>";
	$csvFile = "dataSponsorhip-$currtime.csv";
	$results = array();
	array_push($results, getTableData("#__studentform", "'Sponsored-Female',COUNT(*)", "sex='Female' AND sponsor REGEXP '[a-zA-Z]'", 1));
	array_push($results, getTableData("#__studentform", "'Sponsored-Male',COUNT(*)", "sex='Male' AND sponsor REGEXP '[a-zA-Z]'", 1));
	array_push($results, getTableData("#__studentform", "'Unsponsored-Female',COUNT(*)", "sex='Female' AND sponsor NOT REGEXP '[a-zA-Z]'", 1));
	array_push($results, getTableData("#__studentform", "'Unsponsored-Male',COUNT(*)", "sex='Male' AND sponsor NOT REGEXP '[a-zA-Z]'", 1));
	printToFile($csvFile, "group,count", getCsvFormat($results, false));
	echo "<sponsorship src='/$csvFile'></sponsorship>\n";

	echo "<div class=graphTitle><h3>Age Profile of Sponsored Students</h3></div>";
	$csvFile = "dataSponsoredAgeHist-$currtime.csv";
	$results = getTableData("#__studentform", "age,SUM(CASE WHEN sex='Female' AND sponsor REGEXP '[a-zA-Z]' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' AND sponsor REGEXP '[a-zA-Z]' THEN 1 ELSE 0 END)", "1 GROUP BY age ORDER BY age+0");
	printToFile($csvFile, "Age,Female,Male", getCsvFormat($results, true));
	echo "<sponsored src='/$csvFile'></sponsored>\n";

	echo "<div class=graphTitle><h3>Age Profile of Students Waiting Sponsorship</h3></div>";
	$csvFile = "dataUnsponsoredAgeHist-$currtime.csv";
	$results = getTableData("#__studentform", "age,SUM(CASE WHEN sex='Female' AND sponsor NOT REGEXP '[a-zA-Z]' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' AND sponsor NOT REGEXP '[a-zA-Z]' THEN 1 ELSE 0 END)", "1 GROUP BY age ORDER BY age+0");
	printToFile($csvFile, "Age,Female,Male", getCsvFormat($results, true));
	echo "<unsponsored src='/$csvFile'></unsponsored>\n";

	echo "<script src='$pathPrefix/media/d3/sponsorship.js'></script>";
	
	return;
}

function reportGrades($currtime, $pathPrefix, $year, $examType)
{
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$examType);

	echo "<h3>School Performance Based On Subject Grades</h3>";
	$csvFile = "dataSchoolPerf-$currtime.csv";
	$results = getTableData("#__studentform,#__gradesform", "#__gradesform.class,`group`,sex,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks", "#__studentform.id=studentId AND year='$year' AND examType='$examType'");
	$grades = array(); $allGrades = array('A+','A','B+','B','C+','C');
	foreach ($allGrades as $grade) $grades[$grade] = 0;
	$subjects = array(); $allSubjects = array('Kannada','English','Hindi','Math','Science','Social');
	foreach ($allSubjects as $subject) $subjects[$subject] = array();
	$classes = array(); $allClasses = array('I','II','III','IV','V','VI','VII','VIII','IX','X');
	foreach ($allClasses as $class) $classes[$class] = array();
	$groups = array(); $allGroups = array('Azad','Bhagath','Subhash','Vivek');
	foreach ($allGroups as $group) $groups[$group] = array();
	foreach ($results as $result) {
		for ($j=3; $j<9; $j++) {
			if ($result[$j]>0) { // grade is recorded for this subject
				$percentage = floor(0.5+100*$result[$j]/$maxMarks);
				$grade = getGrade($percentage);
				$grades[$grade]++;
				if ($grade=='A' || $grade=='A+') $gradeIdx = 'A/A+';
				else if ($grade=='B' || $grade=='B+') $gradeIdx = 'B/B+';
				else $gradeIdx = 'C/C+';
				$class = getClassDisplayText($result[0]);
				$classes[$class][$gradeIdx]++;
				$groups[$result[1]][$gradeIdx]++;
				switch ($j) {
					case 3: $subjects['Kannada'][$gradeIdx]++; break;
					case 4: $subjects['English'][$gradeIdx]++; break;
					case 5: $subjects['Hindi'][$gradeIdx]++; break;
					case 6: $subjects['Math'][$gradeIdx]++; break;
					case 7: $subjects['Science'][$gradeIdx]++; break;
					case 8: $subjects['Social'][$gradeIdx]++; break;
				}
			}
		}		
	}
	
	$arr = array();
	foreach ($allGrades as $grade) array_push($arr, array($grade,$grades[$grade]));
	printToFile($csvFile, "grade,count", getCsvFormat($arr, false));
	echo "<schoolPerf src='/$csvFile'></schoolPerf>\n";
	
	echo "<div class=graphTitle><h3>Grades by Subject</h3></div>";
	$csvFile = "dataGradesSubject-$currtime.csv";
	$arr = array();
	foreach ($allSubjects as $subject) array_push($arr, array($subject,$subjects[$subject]['A/A+'],$subjects[$subject]['B/B+'],$subjects[$subject]['C/C+']));
	printToFile($csvFile, "Subject,A/A+,B/B+,C/C+", getCsvFormat($arr, true));
	echo "<gradesSubject src='/$csvFile'></gradesSubject>\n";

	echo "<div class=graphTitle><h3>Grades by Class</h3></div>";
	$csvFile = "dataGradesClass-$currtime.csv";
	$arr = array();
	foreach ($allClasses as $class) array_push($arr, array($class,$classes[$class]['A/A+'],$classes[$class]['B/B+'],$classes[$class]['C/C+']));
	printToFile($csvFile, "Class,A/A+,B/B+,C/C+", getCsvFormat($arr, true));
	echo "<gradesClass src='/$csvFile'></gradesClass>\n";

	echo "<div class=graphTitle><h3>Grades by Group</h3></div>";
	$csvFile = "dataGradesGroup-$currtime.csv";
	$arr = array();
	foreach ($allGroups as $group) array_push($arr, array($group,$groups[$group]['A/A+'],$groups[$group]['B/B+'],$groups[$group]['C/C+']));
	printToFile($csvFile, "Group,A/A+,B/B+,C/C+", getCsvFormat($arr, true));
	echo "<gradesGroup src='/$csvFile'></gradesGroup>\n";
	
	echo "<script src='$pathPrefix/media/d3/grades.js'></script>";

	return;
}

function reportTopStudents($currtime, $pathPrefix, $year, $examType)
{
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$examType);

	echo "<h3>Class Toppers by Group</h3>";
	$csvFile = "dataTopStudents-$currtime.csv";
	echo "<topStudents src='/$csvFile'></topStudents>\n";
	
	$results = getTableData("#__studentform,#__gradesform", "#__studentform.class,name,`group`,sex,(kannadaMarks+englishMarks+hindiMarks+mathMarks+generalScienceMarks+socialStudiesMarks) AS total,#__gradesform.id,studentId", "#__studentform.id=studentId AND year='$year' AND examType='$examType' ORDER BY #__studentform.class+0, total DESC");
	$prevClass = -1; $rank = $males = $females = 0; $groupmap = array();
	foreach ($results as $result) {
		if ($prevClass!=$result[0]) {
			if ($prevClass!=-1) {
				echo "</table>";
				$rank = 0;
			}
			echo "<div class=graphTitle><h3>Class ".getClassDisplayText($result[0])." Toppers</h3></div>";
			echo "<table class=studentView>";
			echo "<tr><th>Rank</th><th>Photo</th><th>Student Name</th><th>Group</th><th>%</th><th>Details</th></tr>";
		}
		$rank++;
		if ($rank<=5) { // only 5 toppers shown per class
			if (!isset($groupmap[$result[2]])) {
				$groupmap[$result[2]]['Male']=0;
				$groupmap[$result[2]]['Female']=0;
			}
			$groupmap[$result[2]][$result[3]]++;
			$percentage = floor(0.5+(100*$result[4])/(6*$maxMarks)); // consider all subjects for topper's list
			$studentLink = preg_replace("/\/reports[?]?.*$/","/students/view-students?id=$result[6]",$_SERVER['REQUEST_URI'],1);
			$itemLink = preg_replace("/\/reports[?]?.*$/","/grades/view-grades?id=$result[5]",$_SERVER['REQUEST_URI'],1);
			echo "<tr><td style='font-size:2em'>$rank</td><td>".getPhotoCode($result[6],"style='width:64px'")."</td>";
			echo "<td><a href='$studentLink'>$result[1]</a></td><td>$result[2]</td><td>$percentage %</td>";
			echo "<td><a href='$itemLink'>Details</a></td></tr>";
		}
		$prevClass = $result[0];
	}
	echo "</table>";
	
	$arr = array();
	ksort($groupmap);
	foreach ($groupmap as $key => $val) {
		array_push($arr, array($key,$val['Female'],$val['Male']));
	}
	printToFile($csvFile, "Group,Female,Male", getCsvFormat($arr, false));

	echo "<script src='$pathPrefix/media/d3/topStudents.js'></script>";
	
	return;
}

function reportStudentPerformance($currtime, $pathPrefix, $class, $studentId)
{
?>
<style>
studentTimePerf { font: 11px sans-serif; }
.axis path, .axis line { fill: none; stroke: #000; shape-rendering: crispEdges; }
.x.axis path { display: none; }
.line { fill: none; stroke: steelblue; stroke-width: 1.5px;}
</style>
<?php
	$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
	$results = getTableData("#__studentform,#__gradesform","name,year,examType,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks","studentId='$studentId' AND #__studentform.id=studentId ORDER BY year DESC, FIELD(examType,$examOptStr) LIMIT 1", 1);

	if (count($results)==0) {
		echo "<div class=message>No grades have been recorded for this combination of student, year and assessment type.</div>";
		return;
	}

	$classAvg = getTableData("#__gradesform","kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks","class='$class' AND year='".$results[1]."' AND examType='".$results[2]."'");
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$results[2]);
	$allSubjects = array('Kannada','English','Hindi','Math','Science','Social');
	$classGrades = array();
	foreach ($classAvg as $avg) {
		for ($j=0; $j<count($avg); $j++) {
			if ($avg[$j]>0) {
				$classGrades[$allSubjects[$j]]['Total'] += $avg[$j];
				$classGrades[$allSubjects[$j]]['Count']++;
			}
		}
	}
	foreach ($classGrades as $key => $val) {
		if (isset($val['Count']) && $val['Count']>0)
			$classGrades[$key]['Avg'] =  $val['Total']/$val['Count'];
	}
	echo "<h3>Recent Grades for $results[0]</h3>";
	echo "Class ".getClassDisplayText($class)." / $results[1] / $results[2]<br>";
	$arr = array();
	for ($i=0; $i<count($allSubjects); $i++) {
		$studentPercent = floor(0.5+100*$results[$i+3]/$maxMarks);
		$classPercent = floor(0.5+100*$classGrades[$allSubjects[$i]]['Avg']/$maxMarks);
		array_push($arr, array($allSubjects[$i],$studentPercent,$classPercent));
	}
	$csvFile = "dataStudentRecentPerf-$currtime.csv";
	printToFile($csvFile, "Subject,This Student,Class Average", getCsvFormat($arr, false));
	echo "<studentRecentPerf src='/$csvFile'></studentRecentPerf>\n";
	
	echo "<div class=graphTitle><h3>Student's Performance Over Time</h3></div>";
	// Limit to recent 6 tests, consider only those where at least one subject has recorded marks
	$results = getTableData("#__gradesform","CONCAT(year,'/',examType),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks","studentId='$studentId' AND (kannadaMarks+englishMarks+hindiMarks+mathMarks+generalScienceMarks+socialStudiesMarks)>0 ORDER BY year DESC, FIELD(examType,$examOptStr) LIMIT 6");
	$arr = array();
	for ($i=count($results)-1, $j=0; $i>=0; $i--, $j++) {
		$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$results[$i][0]);
		$arr[$j][0] = preg_replace("/ \(.*/","",$results[$i][0]);
		$arr[$j][0] = preg_replace("/Test (\d)/","Test$1",$arr[$j][0]);
		$arr[$j][0] = preg_replace("/ Exam/","",$arr[$j][0]);
		for ($k=1; $k<count($results[$i]); $k++) {
			$arr[$j][$k] = floor(0.5+100*$results[$i][$k]/$maxMarks);
		}
	}
	$csvFile = "dataStudentTimePerf-$currtime.csv";
	printToFile($csvFile, "quarter,".implode(",",$allSubjects), getCsvFormat($arr, false));
	echo "<studentTimePerf src='/$csvFile'></studentTimePerf>\n";
	
	echo "<script src='$pathPrefix/media/d3/studentPerformance.js'></script>";

	return;
}

?>
