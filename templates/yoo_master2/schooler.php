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
	require_once("schooler.config.php");
	$config = JFactory::getConfig();
	backup_tables('localhost',
	              $config->get('user'),
	              $config->get('password'),
	              $config->get('db'),
	              $dbBackupFile);
	if (ftp_file($backupServer, $ftpUser, $ftpPwd, $dbBackupFile)) {
		update_backup_timestamp($currtime);
	}
}


/*==========================================================
  Export DB tables to a file and FTP the file.
----------------------------------------------------------*/
function backup_tables($host,$user,$pass,$name,$file,$tables = '*')
{	// Source: http://davidwalsh.name/backup-mysql-database-php
	$link = mysql_connect($host,$user,$pass);
	mysql_select_db($name,$link);
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

	$allTables = '';
	foreach ($tables as $table) {
		if ($allTables!='') $allTables .= " $table";
		else $allTables .= "$table";
	}

	$result = exec("C:\wamp2.4\bin\mysql\mysql5.6.12\bin\mysqldump.exe -u$user $name $allTables > $file");
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
	require_once ( JPATH_BASE.DS.'templates'.DS.'yoo_master2'.DS.'schooler.php' );
}

function getYears()
{	// also to update ChronoForms gradesForm in Joomla admin view.
	#$years = getTableData("#__gradesform","DISTINCT(year)","1 ORDER BY year DESC");
	#foreach ($years as $yr) array_push($yrsArr,$yr[0]);
	return array('2014-15','2013-14');
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

function deletePhoto($id)
{
	$urlpath = 'components/com_chronoforms5/chronoforms/uploads/studentForm';
	array_map('unlink', glob("$urlpath/Photo-$id.*"));
}

function getExamOptions($order='ASC',$class=0)
{
	if ($class==0)
		$exams = array('Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (50 marks)','Midterm Exam (100 marks)','Test 3 (25 marks)','Test 4 (25 marks)','Test 4 (100 marks)','Final Exam (50 marks)','Final Exam (100 marks)');
	else if ($class==-1)
		$exams = array('Test 1','Test 2','Midterm Exam','Test 3','Test 4','Final Exam');
	else if ($class==10)
		$exams = array('Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (100 marks)','Test 3 (25 marks)','Test 4 (100 marks)','Final Exam (100 marks)');
	else if ($class>=8)
		$exams = array('Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (100 marks)','Test 3 (25 marks)','Test 4 (25 marks)','Final Exam (100 marks)');
	else
		$exams = array('Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (50 marks)','Test 3 (25 marks)','Test 4 (25 marks)','Final Exam (50 marks)');
	if ($order=='ASC') return $exams;
	else return array_reverse($exams);
}

function getMaxMarks($class, $examType)
{
	if ($class==10 && preg_match('/(Test 4)/',$examType)) $maxMarks = 100;
	else if ($class>=8 && preg_match('/(Final|Midterm)/',$examType)) $maxMarks = 100;
	else if ($class<8 && preg_match('/(Final|Midterm)/',$examType)) $maxMarks = 50;
	else $maxMarks = 25;
	return $maxMarks;
}

function getKannadaMaxMarks($class, $examType)
{
	if ($class==10 && preg_match('/(Final|Midterm|Test 4)/',$examType)) $maxMarks = 125;
	else if ($class==9 && preg_match('/(Final)/',$examType)) $maxMarks = 125;
	else $maxMarks = getMaxMarks($class, $examType);
	return $maxMarks;
}

function getSubjects($class)
{
	if ($class>=6) $subjects = array('Kannada','English','Hindi','Math','Science','Social','Computer');
	else if ($class>=5) $subjects = array('Kannada','English','Hindi','Math','Science','Social');
	else if ($class>=4) $subjects = array('Kannada','English','Hindi','Math','Science');
	else $subjects = array('Kannada','English','Math','Science');
	return $subjects;
}

function getNumberOfSubjects($class)
{
	return count(getSubjects($class));
}

function msgPostFormSubmit($linkType)
{ // To be called only after the form is saved in DB
	if ($linkType=='grades') {
		$aliasname = 'view-grades';
		$idname = 'id';
		$id = getRecordId('gradesform');
	}
	else if ($linkType=='skills') {
		$aliasname = 'view-grades';
		$gradesId = $_REQUEST['gradesId'];
		$idname = "id=".$gradesId."&skillsId";
		$id = getRecordId('skillsform');
	}
	else if ($linkType=='sponsor') {
		$aliasname = 'view-sponsors';
		$idname = 'id';
		$id = getRecordId('sponsorform');
	}
	else {
		$idname = 'id';
		$id = getRecordId('studentform');
		$class = getTableData("#__studentform","class","id='$id'",0);
		if ($class>10) $aliasname = 'view-graduates';
		else $aliasname = 'view-students';
	}

	if ($id=='' || $id<0) {
		echo "<div class='error message'>Unable to save the details submitted. Please try again.<br>";
	}
	else {
		$itemLink = preg_replace("/(view-students|view-graduates|view-sponsors|view-grades|add-student|add-sponsor|add-grades|add-skills)[?]?.*$/","$aliasname?".$idname."=$id",$_SERVER['REQUEST_URI'],1);
		echo "<div class=message>Details have been saved.<br>";
		echo "You may wish to <a href='$itemLink'>review them</a>.</div>";
	}
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
	if ($myclass<1) return '-';
	if ($myclass>10) return 'Graduated';
	$romans = array('-','I','II','III','IV','V','VI','VII','VIII','IX','X');
	return $romans[$myclass];
}

function deleteStudent($id, $who='student')
{	// Do not delete the grades or skills of this student.
	// deletePhoto($id);
	executeQuery("DELETE FROM #__studentform WHERE id=$id", 0); // will delete nothing if id doesn't exist
	echo "<div class=message>Entry has been deleted.<br>";
}

function deleteSponsor($id)
{
	$studentsExist = getTableData("#__sponsorform","COUNT(*)","id=$id AND sponsoredStudents REGEXP '[1-9]'",0);
	if ($studentsExist > 0) {
		echo "<div class='error message'>Sponsor can be deleted only if he/she has no sponsored students.<br>";
	}
	else {
		executeQuery("DELETE FROM #__sponsorform WHERE id=$id", 0); // will delete nothing if id doesn't exist
		echo "<div class=message>Entry has been deleted.<br>";
	}
}

function getAgeQuery()
{
	return "YEAR(CURDATE()) - YEAR(STR_TO_DATE(dateOfBirth,'%d/%m/%Y')) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(STR_TO_DATE(dateOfBirth,'%d/%m/%Y'), '%m%d')) AS age";
}

function showStudent($id, $who='student')
{
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Student Details</h2></td>";

	$result = getTableData("#__studentform",
							 "name,dateOfBirth,".getAgeQuery().",sex,admissionNumber,studentUid,class,parentStatus,economicStatus",
							 "id='$id'",
							 1);

	if (count($result)==0) {
		echo "</tr><tr><td><div class='error message'>The requested entry does not exist.</td></tr></table>";
		return;
	}

	$user = JFactory::getUser();
	if (!$user->guest) {
		echo "<td style='text-align:right'>";
		echo "<b><a href='".preg_replace("/view-(students|graduates)/","add-student",$_SERVER['REQUEST_URI'])."'>Edit</a></b>";
		echo " | <b><a onclick='return confirm(\"Are you sure you want to delete this entry?\")' href='".preg_replace("/view-(students|graduates)\?.*/","view-$1?action=delete&id=$id",$_SERVER['REQUEST_URI'])."'>Delete</a></b>";
		echo "</td>";
	}

	echo "</tr></table>";

	$headings = array('Name','Date of Birth','Age','Sex','Admission No.','Student ID','Class','Parent Status','Economic Status');
	echo "<table class=studentView>";
	for ($i=0; $i<count($headings); $i++) {
		if ($i==0) { // first cell is for photo
			echo "<tr><td style='border:0px; vertical-align:top; width:256px' rowspan='"
				.strval(count($headings)+2) . "'>".getPhotoCode($id,"style='width:240px'")."</td><th>" // 2 rows added at the end
				.$headings[$i]."</th><td>$result[$i]</td></tr>";
		}
		else {
			if ($i==6) { // class: convert to Roman numerals for display
				$currRes = getClassDisplayText($result[$i]);
			}
			else if (false && $i==count($headings)-1) { // Sponsors no longer shown
				$sponsorLink = preg_replace("/students\/view-students\??.*/","sponsors/view-sponsors",$_SERVER['REQUEST_URI']);
				$sponsors = getTableData("#__sponsorform","id,name,sponsorUid,CONCAT(',',sponsoredStudents,',')","1 ORDER BY name");
				if ($sponsors) {
					$currRes = "<ol>";
					foreach ($sponsors as $sponsor) {
						if (preg_match("/,$id,/",$sponsor[3])) {
							$currRes .= "<li><a href='$sponsorLink?id=$sponsor[0]'>$sponsor[1]</a></li>";
						}
					}
					$currRes .= "</ol>";
					$currRes = preg_replace("/<ol><\/ol>/","&nbsp;",$currRes);
				}
				else $currRes = '&nbsp;';
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

function showSponsor($id)
{
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Sponsor Details</h2></td>";

	$result = getTableData("#__sponsorform","name,sponsorUid,sponsoredStudents","id='$id'",1);
	if (count($result)==0) {
		echo "</tr><tr><td><div class='error message'>The requested entry does not exist.</td></tr></table>";
		return;
	}

	$user = JFactory::getUser();
	if (!$user->guest) {
		echo "<td style='text-align:right'>";
		echo "<b><a href='".preg_replace("/view-sponsors/","add-sponsor",$_SERVER['REQUEST_URI'])."'>Edit</a></b>";
		if ($result[2]=='') echo " | <b><a onclick='return confirm(\"Are you sure you want to delete this entry?\")' href='".preg_replace("/view-sponsors\?.*/","view-sponsors?action=delete&id=$id",$_SERVER['REQUEST_URI'])."'>Delete</a></b>";
		echo "</td>";
	}

	echo "</tr></table>";

	$studentLink = preg_replace("/\/sponsors\/view-sponsors[?]?.*$/","/students/view-students",$_SERVER['REQUEST_URI'],1);
	$graduateLink = preg_replace("/\/sponsors\/view-sponsors[?]?.*$/","/students/view-graduates",$_SERVER['REQUEST_URI'],1);
	$headings = array('Name','Sponsor ID','Sponsored Students');
	echo "<table class=studentView>";
	for ($i=0; $i<count($headings); $i++) {
		if ($i==2) {
			if ($result[2]) {
				echo "<tr><th>".$headings[$i]."</th>";
				$students = getTableData("#__studentform","id,name,class,`group`","id IN ($result[2]) ORDER BY name");
				if ($students) {
					echo "<td><ol>";
					foreach ($students as $student) {
						if ($student[2]>10)
							echo "<li><a href='$graduateLink?id=$student[0]'>$student[1]</a> / Class ".getClassDisplayText($student[2])." / Group $student[3]</li>";
						else
							echo "<li><a href='$studentLink?id=$student[0]'>$student[1]</a> / Class ".getClassDisplayText($student[2])." / Group $student[3]</li>";
					}
					echo "</ol></td>";
				}
				else echo "<td>&nbsp;</td>";
				echo "</tr>";
			}
			else echo "<tr><th>".$headings[$i]."</th><td>&nbsp;</td></tr>";
		}
		else {
			echo "<tr><th>".$headings[$i]."</th><td>$result[$i]</td></tr>";
		}
	}
	echo "</table>";
}

function showSponsorList()
{
	if (isset($_REQUEST['id'])) {
		if (isset($_REQUEST['action'])) {
			if ($_REQUEST['action']=='report') generateSponsorReport($_REQUEST['id']);
			else if ($_REQUEST['action']=='delete') deleteSponsor($_REQUEST['id']);
			else showSponsor($_REQUEST['id']);
		}
		else showSponsor($_REQUEST['id']);
		return;
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Listing All Sponsors</h2></td>";
	echo "</tr></table>";

	$itemLink = preg_replace("/view-sponsors\??.*/","view-sponsors",$_SERVER['REQUEST_URI']);
	$studentLink = preg_replace("/\/sponsors\/view-sponsors[?]?.*$/","/students/view-students",$_SERVER['REQUEST_URI'],1);
	$graduateLink = preg_replace("/\/sponsors\/view-sponsors[?]?.*$/","/students/view-graduates",$_SERVER['REQUEST_URI'],1);
	$columnHeadings = array('Sponsor ID','Name','Sponsored Students','Actions');
	$sponsors = getTableData("#__sponsorform","id,sponsorUid,name,sponsoredStudents","1 ORDER BY name ASC");

	$user = JFactory::getUser();
	if ($user->guest) array_pop($columnHeadings);

	# Find duplicates in sponsorUid
	$dups = array(); $uids = array();
	foreach ($sponsors as $sponsor) array_push($uids, $sponsor[1]);
	foreach(array_count_values($uids) as $val => $c) {
	    if($c > 1) $dups[] = $val;
	}

	echo "<table class=studentList>";
	if (count($dups)>0) {
		echo "<tr><td colspan='".count($columnHeadings)."' style='border:0px;text-align:right'><span class=duplicateErr>*</span> Please correct duplicate sponsor IDs.</td></tr>";
	}
	echo "<tr>";
	foreach ($columnHeadings as $colHead) {
		echo "<th>$colHead</th>";
	}
	echo "</tr>";

	if (count($sponsors)==0) {
		echo "<tr><td colspan=".count($columnHeadings)."><div class=message>No sponsors have been entered into the system.</div></td></tr></table>";
		return;
	}

	foreach ($sponsors as $sponsor) {
		$id = $sponsor[0];
		echo "<tr>";
		for ($i=1; $i<count($sponsor); $i++) { // ignore id
			if ($i==1) { // indicate duplicates
				if (in_array($sponsor[$i],$dups)) echo "<td>".$sponsor[$i]." <span class=duplicateErr>*</span></td>";
				else echo "<td>".$sponsor[$i]."</td>";
			}
			else if ($i==2) { // have link for name
				echo "<td><a href='$itemLink?id=$id'>".$sponsor[$i]."</td>";
			}
			else if ($i==3) { // conversion for sponsored students
				if ($sponsor[$i]) {
					$students = getTableData("#__studentform","id,name,class,`group`","id IN ($sponsor[$i]) ORDER BY name");
					if ($students) {
						echo "<td><ol>";
						foreach ($students as $student) {
							if ($student[2]>10) echo "<li><a href='$graduateLink?id=$student[0]'>$student[1]</a> / Class ".getClassDisplayText($student[2])." / Group $student[3]</li>";
							else echo "<li><a href='$studentLink?id=$student[0]'>$student[1]</a> / Class ".getClassDisplayText($student[2])." / Group $student[3]</li>";
						}
						echo "</ol></td>";
						if (!$user->guest) echo "<td><a href='$itemLink?id=$id&action=report'>Download Reports</a></td>";
					}
					else if (!$user->guest) echo "<td>&nbsp;</td><td>&nbsp;</td>";
					else echo "<td>&nbsp;</td>";
				}
				else if (!$user->guest) echo "<td>&nbsp;</td><td>&nbsp;</td>";
				else echo "<td>&nbsp;</td>";
			}
			else echo "<td>".$sponsor[$i]."</td>";
		}
		echo "</tr>";
	}
	echo "</table>";
}

function printAllGradesTable($data, $inconsistent=0, $first=0)
{
	if ($data['class']>=6 || $inconsistent) {
		$numSubjects = 7;
		$rows = array('Kannada','English','Hindi','Mathematics','General Science','Social Studies','Computer Science','Total','Physical Education','Attendance','Conduct','Skills','Remarks','Date');
	}
	else {
		$numSubjects = 6;
		$rows = array('Kannada','English','Hindi','Mathematics','General Science','Social Studies','Total','Physical Education','Attendance','Conduct','Skills','Remarks','Date');
	}
	if ($inconsistent) array_push($rows, 'Graded for Class');
	$cols = array_merge(array('Subject'),getExamOptions('ASC',$data['class']));
	$pdflink = preg_replace("/\/view-grades\?.*/","/view-grades?studentId=".$data['studentId'],$_SERVER['REQUEST_URI']);
	echo "<table style='width:100%'><tr>";
	$user = JFactory::getUser();
	if ($inconsistent) { // no PDF download when there are errors
		echo "<td><h3 style='margin-top:40px;'>".$data['year']." / Class <span class=error>?</span></h3></td>";
		echo "<td style='text-align:right;vertical-align:bottom'><span class=duplicateErr>*</span> Grades recorded against different classes in the same year. Please correct.</td>";
	}
	else {
		echo "<td><h3 style='margin-top:40px;'>".$data['year']." / Class ".getClassDisplayText($data['class'])."</h3></td>";
		if (!$user->guest) {
			echo "<td style='text-align:right;vertical-align:bottom'>";
			if ($first) echo "<a href='$pdflink&action=pdfall'>PDF All</a> | "; // suppressed if first table is inconsistent
			echo "<a href='$pdflink&action=pdf&year=".$data['year']."'>PDF</a>";
			echo "</td>";
		}
	}
	echo "</tr></table>";
	echo "<table class=studentAllGrades>";

	// Table header is printed first
	echo "<tr rowspan=2><th>$cols[0]</th>";
	for ($i=1; $i<count($cols); $i++) {
		if (isset($data['link'][$cols[$i]]) && $data['link'][$cols[$i]]) echo "<th colspan=3><a href='".$data['link'][$cols[$i]]."'>".preg_replace("/ \(/","<br>(",$cols[$i])."</a></th>";
		else echo "<th colspan=3>".preg_replace("/ \(/","<br>(",$cols[$i])."</th>";
	}
	echo "</tr>";

	// Table content
	$showFootnote = false;
	echo "<tr><td>&nbsp;</td>".str_repeat("<td class=gradeHead>Grade</td><td class=gradeHead>%</td><td class=gradeHead>Marks</td>",count($cols)-1)."</tr>";
	for ($i=0; $i<count($rows); $i++) {
		if ($rows[$i]=='Total') echo "<tr><td><b>".$rows[$i]."</b></td>";
		else if ($rows[$i]=='Graded for Class') echo "<tr><td>".$rows[$i]."<span class=duplicateErr>*</span></td>";
		else echo "<tr><td>".$rows[$i]."</td>";
		for ($j=1; $j<count($cols); $j++) {
			if (!isset($data[$rows[$i]][$cols[$j]])) {
				if ($i<=$numSubjects) $cell = array('grade'=>'','%'=>'','marks'=>'');
				else $cell = '';
			}
			else $cell = $data[$rows[$i]][$cols[$j]];
			if ($i<=$numSubjects) {
				if ($rows[$i]=='Total') {
					echo "<td><b>".$cell['grade']."</b></td>";
					echo "<td class=marks><b>".$cell['%']."</b></td>";
					echo "<td class=marks><b>".$cell['marks']."</b></td>";
				}
				else {
					echo "<td>".$cell['grade']."</td>";
					echo "<td class=marks>".$cell['%']."</td>";
					if ($rows[$i]=='Kannada' && getKannadaMaxMarks($data['class'],$cols[$j])==125) {
						echo "<td class=marks><sup>*</sup>".$cell['marks']."</td>";
						$showFootnote = true;
					}
					else
						echo "<td class=marks>".$cell['marks']."</td>";
				}
			}
			else {
				echo "<td colspan=3>".$cell."</td>";
			}
		}
		echo "</tr>";
	}
	if ($showFootnote) echo "<tr><td colspan=19 style='border:0px;font-size:0.9em;text-align:right'><i>* Out of 125 marks.</i></td></tr>";
	echo "</table>";
}

function saveGradesData(&$data, $res, $skillsRes)
{
	$data['studentId'] = $res[0];
	$data['name'] = $res[18];
	$data['dateOfBirth'] = $res[19];
	$data['studentUid'] = $res[20];
	$data['year'] = $res[1];
	$class = $data['class'] = $res[17];
	$examType = $res[2];
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$examType);
	$kannadaMaxMarks = getKannadaMaxMarks($class,$examType);
	$totalBaseMarks = 0;
	$data['Graded for Class'][$examType] = getClassDisplayText($class);
	if (setGrade($data['Kannada'][$examType], $res[5], $kannadaMaxMarks)) $totalBaseMarks += $kannadaMaxMarks;
	if (setGrade($data['English'][$examType], $res[6], $maxMarks)) $totalBaseMarks += $maxMarks;
	if (setGrade($data['Hindi'][$examType], $res[7], $maxMarks)) $totalBaseMarks += $maxMarks;
	if (setGrade($data['Mathematics'][$examType], $res[8], $maxMarks)) $totalBaseMarks += $maxMarks;
	if (setGrade($data['General Science'][$examType], $res[9], $maxMarks)) $totalBaseMarks += $maxMarks;
	if (setGrade($data['Social Studies'][$examType], $res[10], $maxMarks)) $totalBaseMarks += $maxMarks;
	if (setGrade($data['Computer Science'][$examType], $res[11], $maxMarks)) $totalBaseMarks += $maxMarks;
	setGrade($data['Total'][$examType], $res[5]+$res[6]+$res[7]+$res[8]+$res[9]+$res[10]+$res[11], $totalBaseMarks);
	$data['Physical Education'][$examType] = $res[12];
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
	$data['link'][$examType] = $gradesLink; // we will have id per exam

	// Finally, save the skills
	foreach ($skillsRes as $row) {
		if ($row[1]==$res[16]) {
			$data['Skills'][$examType] = "<a href='".preg_replace("/\/index\.php\/.*/","/index.php/grades/view-grades?id=$res[16]&skillsId=$row[0]",$_SERVER['REQUEST_URI'])."'>Skills</a>";
		}
	}
	$user = JFactory::getUser();
	if (!$user->guest) {
		if (!isset($data['Skills'][$examType]) && preg_match("/(Midterm|Final)/",$examType))
			$data['Skills'][$examType] = "<a href='".preg_replace("/\/index\.php\/.*/","/index.php/grades/add-skills?gradesId=$res[16]",$_SERVER['REQUEST_URI'])."'>Add</a>";
	}
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
	//echo "<tr><th>Group</th><td>".$studentDetails[3]."</td></tr>";
	echo "</table>";

	// Fields obtained should be in line with saveGradesData
	$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
	$results = getTableData("#__studentform,#__gradesform",
							 "studentId,year,examType,DATE_FORMAT(#__gradesform.created,'%d %M %Y'),DATE_FORMAT(#__gradesform.modified,'%d %M %Y'),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,physicalEducation,conduct,attendance,remarks,#__gradesform.id,#__gradesform.class,name,dateOfBirth,studentUid",
							 "#__studentform.id=studentId AND studentId=$id ORDER BY year DESC, FIELD(examType,$examOptStr)");

	if (count($results)==0) {
		echo "<table class=studentView><tr>";
		echo "<tr><td><div class=message style='margin-top:50px'>No grades have been recorded for this student.</div></td></tr>";
		echo "</table>";
		return;
	}

	// To improve performance, we do a single query for skills across all years and exams
	$skillsResults = getSkills($results);

	$year = ''; $data = $gradedClass = array();
	$inconsistent = 0;
	$firstTable = 1;
	for ($i=0; $i<count($results); $i++) {
		$res = $results[$i];
		if ($year!='' && $res[1]!=$year) { // start of a new year, print processed one
			printAllGradesTable($data, $inconsistent, $firstTable);
			$data = $gradedClass = array();
			$inconsistent = 0;
			$firstTable = 0;
		}
		saveGradesData($data, $res, $skillsResults);
		$year = $data['year'];
		if (count($gradedClass) && !in_array($data['class'],$gradedClass)) $inconsistent = 1;
		else array_push($gradedClass,$data['class']);
	}
	if ($year!='') printAllGradesTable($data, $inconsistent, $firstTable);
}

function getSkills($results)
{
	$gradesIds = array();
	foreach ($results as $res) {
		if (!in_array($res[16],$gradesIds)) $gradesIds[] = $res[16];
	}
	$skillsResults = getTableData("#__skillsform","id,gradesId","gradesId IN (".implode(',',$gradesIds).")");
	return $skillsResults;
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
	executeQuery("DELETE FROM #__skillsform WHERE gradesId=$id", 0); // will delete nothing if id doesn't exist
	executeQuery("DELETE FROM #__gradesform WHERE id=$id", 0); // will delete nothing if id doesn't exist
	echo "<div class=message>Entry has been deleted.<br>";
}

function deleteStudentSkills($id)
{
	executeQuery("DELETE FROM #__skillsform WHERE id=$id", 0); // will delete nothing if id doesn't exist
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
	$allowedClasses = getUserClassPermissions();
	if (!$user->guest && ($allowedClasses==0 || $result[2]==$result[3])) {
		// permission to all classes or current class = graded class
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
	$kannadaMaxMarks = getKannadaMaxMarks($result[3],$result[5]);
	$totalMarks = 0; $totalBaseMarks = 0; $numSubjects = 0;
	echo "<table class=studentView>";
	for ($i=$j=0; $i<count($headings); $i++, $j++) {
		$fieldVal = $result[$j+1];
		if ($i==0) { // first cell is for photo
			echo "<tr><td style='border:0px; vertical-align:top; width:256px' rowspan='"
				.strval(count($headings)+6) . "'>" . getPhotoCode($result[0],"style='width:240px'")."</td><th>" // 6 rows are added for separation and total marks
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
		else if ($i>=6 && $i<=12) {
			if ($fieldVal>0) {
				// computerScience for class 6 and above but display if marks are recorded
				$totalMarks += $fieldVal;
				if ($i==6) {
					$totalBaseMarks += $kannadaMaxMarks;
					$percentage = floor(0.5+100*$fieldVal/$kannadaMaxMarks);
					if ($kannadaMaxMarks==125) $subjectText = $headings[$i]." (125 marks)";
					else $subjectText = $headings[$i];
				}
				else {
					$totalBaseMarks += $maxMarks;
					$percentage = floor(0.5+100*$fieldVal/$maxMarks);
					$subjectText = $headings[$i];
				}
				echo "<tr class=marks><th>$subjectText</th>";
				echo "<td style='text-align:left'>".getGrade($percentage)."</td>";
				echo "<td>$percentage %</td>";
				echo "<td>$fieldVal</td>";
				echo "</tr>";
			}
			else if ($i!=12 || $i==12 && $result[3]>=6) {
				// computerScience for class 6 and above
				// we assume that student did not take this subject: no one will get zero!
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
		else if ($i==12) {
			if ($totalBaseMarks) {
				$percentage = floor(0.5+100*$totalMarks/$totalBaseMarks); // count only subjects taken for overall percentage
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

function showStudentSkills($id)
{ // $id is with reference to skillsform
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Student Skills</h2></td>";

	$skillsEntryExists = getTableData("#__skillsform","COUNT(*)","id=$id", 0);
	if ($skillsEntryExists==0) {
		echo "</tr><tr><td><div class='error message'>The requested entry does not exist.</td></tr></table>";
		return;
	}

	$result = getTableData("#__studentform,#__gradesform,#__skillsform",
							"studentId,name,#__studentform.class,#__gradesform.class,year,examType,DATE_FORMAT(#__skillsform.created,'%d %M %Y'),DATE_FORMAT(#__skillsform.modified,'%d %M %Y'),kannadaReadingSkills,kannadaWritingSkills,kannadaSpeakingSkills,englishReadingSkills,englishWritingSkills,englishSpeakingSkills,hindiReadingSkills,hindiWritingSkills,hindiSpeakingSkills,mathSkills,scienceSkills,socialStudiesSkills,otherInterests,behaviour,#__skillsform.remarks",
							 "#__studentform.id=studentId AND #__gradesform.id=gradesId AND #__skillsform.id=$id",
							 1);
	if (count($result)==0) {
		echo "</tr><tr><td><div class='error message'>The requested student or grades do not exist. Grades cannot be displayed.</td></tr></table>";
		return;
	}

	$user = JFactory::getUser();
	if (!$user->guest) {
		echo "<td style='text-align:right'>";
		$editLink = preg_replace("/view-grades\?id=(\d+)&skillsId=(\w+)/","add-skills?id=$2&gradesId=$1",$_SERVER['REQUEST_URI']);
		echo "<b><a href='".$editLink."'>Edit</a></b>";
		echo " | <b><a onclick='return confirm(\"Are you sure you want to delete this entry?\")' href='".preg_replace("/view-grades\?.*/","view-grades?action=delete&skillsId=$id",$_SERVER['REQUEST_URI'])."'>Delete</a></b>";
		echo "</td>";
	}
	echo "</tr></table>";

	$studentLink = preg_replace("/\/grades[?]?.*$/","/students/view-students?id=$result[0]",$_SERVER['REQUEST_URI'],1);
	$studentGradesLink = preg_replace("/\/grades[?]?.*$/","/grades/view-grades?studentId=$result[0]",$_SERVER['REQUEST_URI'],1);
	$headings = array('Student Name','Current','This Grade For','Year','Assessment','Date','Kannada Reading Skills','Kannada Writing Skills','Kannada Speaking Skills','English Reading Skills','English Writing Skills','English Speaking Skills','Hindi Reading Skills','Hindi Writing Skills','Hindi Speaking Skills','Mathematics','Sciences','Social Studies','Other Interests','Behaviour','Remarks & Suggestions');
	$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$result[5]);
	$totalMarks = 0; $numSubjects = 0;
	echo "<table class=studentView>";
	for ($i=$j=0; $i<count($headings); $i++, $j++) {
		$fieldVal = $result[$j+1];
		if ($i==0) { // first cell is for photo
			echo "<tr><td style='border:0px; vertical-align:top; width:256px' rowspan='"
				.strval(count($headings)+4) . "'>" . getPhotoCode($result[0],"style='width:240px'")."</td><th>"
				. $headings[$i]."</th><td><a href='$studentLink'>$fieldVal</a></td></tr>";
		}
		else if ($i==1 || $i==2)  {
			echo "<tr><th>".$headings[$i]."</th><td>Class ".getClassDisplayText($fieldVal)."</td></tr>";
		}
		else if ($i==5) {
			if (preg_match("/[1-9]/",$result[7])) $fieldVal = $result[7]; // use modified datetime
			echo "<tr><th>".$headings[$i]."</th><td>$fieldVal</td></tr>";
			$j++;
		}
		else echo "<tr><th>".$headings[$i]."</th><td>$fieldVal</td></tr>";

		// Add blank row as separator
		if ($i==5 || $i==14) echo "<tr><td colspan=3>&nbsp;</td></tr>";

		if ($i==count($headings)-1){ // end of processing
			echo "<tr><td colspan=3>&nbsp;</td></tr>";
			echo "<tr><td>&nbsp;</td><td style='border:0px'><a href='$studentGradesLink'>View all grades</a> of this student.</td></tr>";
		}
	}
	echo "</table>";
}

function validateGradesForm($form)
{
	$studentId = $form->data['studentId'];
	$year = $form->data['year'];
	$examType = $form->data['examType'];

	$id = getTableData("#__gradesform", "id",
					"studentId='$studentId' AND year='$year' AND examType='$examType' ORDER BY modified DESC, created DESC LIMIT 1", 0);

	if ($id!=0 && (!isset($_REQUEST['id']) || $id!=$_REQUEST['id'])) {
		// either adding a new record or editing an existing one: clash with record in table ($id)
		$itemLink = preg_replace("/(view-students|view-graduates|view-sponsors|view-grades|add-student|add-sponsor|add-grades)[?]?.*$/","add-grades?id=$id",$_SERVER['REQUEST_URI'],1);
		echo "<div class='error message'>Grades for this student were already entered earlier.<br>";
		echo "You may wish to <a href='$itemLink'>edit them</a>.</div>";
		return 'fail';
	}
	return 'success';
}

function validateSkillsForm($form)
{
	$gradesId = $form->data['gradesId'];

	$id = getTableData("#__skillsform", "id",
					"gradesId='$gradesId' ORDER BY modified DESC, created DESC LIMIT 1", 0);

	if ($id!=0 && (!isset($_REQUEST['id']) || $id!=$_REQUEST['id'])) {
		// either adding a new record or editing an existing one: clash with record in table ($id)
		$itemLink = preg_replace("/(view-students|view-graduates|view-sponsors|view-grades|add-student|add-sponsor|add-grades|add-skills)[?]?.*$/","add-skills?id=$id&gradesId=$gradesId",$_SERVER['REQUEST_URI'],1);
		echo "<div class='error message'>Skills for this student and assessment were already entered earlier.<br>";
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

function isSkillsFormToBeShown()
{
	if (isset($_REQUEST['gradesId'])) {
		$gradesId = $_REQUEST['gradesId'];
		$id = getTableData("#__gradesform", "id", "id='$gradesId'", 0);
		if ($id) return 'success';
	}

	echo "<div class=message>Please add skills via the Grades page with respect to a specific exam.<br>";
	return 'fail';
}

function printCustomCodeStudentForm()
{
	insertStudentFormJS();
	echo "<div id=allowedClasses style='display:none'>".getUserClassPermissions()."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadStudentForm()' />\n";
}

function printCustomCodeGradesForm()
{
	$options = array();
	$results = getTableData("#__studentform", "class,id,name", "class<=10 ORDER BY class+0, name");
	foreach ($results as $result) { // presence of $results checked in isGradesFormToBeShown()
		array_push($options, "$result[0]:$result[1]:$result[2]");
	}
	insertGradesFormJS();
	echo "<div id=allowedClasses style='display:none'>".getUserClassPermissions()."</div>\n";
	echo "<div id=classStudentMap style='display:none'>".implode('/',$options)."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadGradesForm()' />\n";
}

function printCustomCodeSkillsForm()
{
	insertSkillsFormJS();
	$gradesId = $_REQUEST['gradesId'];
	$result = getTableData("#__studentform,#__gradesform,#__skillsform",
							"studentId,name,#__studentform.class,#__gradesform.class,year,examType",
							 "#__studentform.id=studentId AND #__gradesform.id='$gradesId'",
							 1);
	$headings = array('Student Name','Current','This Grade For','Year','Assessment');
	echo "<table class=studentView>";
	for ($i=$j=0; $i<count($headings); $i++, $j++) {
		$fieldVal = $result[$j+1];
		if ($i==1 || $i==2)  {
			echo "<tr><th>".$headings[$i]."</th><td>Class ".getClassDisplayText($fieldVal)."</td></tr>";
			}
		else echo "<tr><th>".$headings[$i]."</th><td>$fieldVal</td></tr>";
	}
	echo "</table>";

	echo "<div id=gradesRefId style='display:none'>$gradesId</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadSkillsForm()' />\n";
}

function printCustomCodeReportsForm()
{
	$options = array();
	$results = getTableData("#__studentform", "class,id,name", "class<=10 ORDER BY class+0, name");
	if (count($results)==0) return; // user informed via showReports()

	foreach ($results as $result) {
		array_push($options, "$result[0]:$result[1]:$result[2]");
	}
	insertReportsFormJS();
	echo "<div id=classStudentMap style='display:none'>".implode('/',$options)."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadReportsForm()' />\n";
}

function printCustomCodeSponsorForm()
{
	if (isset($_REQUEST['id'])) { // editing a record
		$id = $_REQUEST['id'];
	}
	else $id = -1;
	$showStr = '';

	// Don't show students who already have 3 sponsors
	$sponsoredStudents = getTableData("#__sponsorform", "sponsoredStudents,id", "sponsoredStudents REGEXP '[1-9]'");
	$sponsorCount = array();
	foreach ($sponsoredStudents as $row) {
		$arr = explode(',',$row[0]);
		foreach ($arr as $item) {
			if (!isset($sponsorCount[$item])) $sponsorCount[$item]=0;
			$sponsorCount[$item]++;
		}
		if ($id==$row[1]) $showStr = $row[0];
	}

	$hideStr = '';
	foreach ($sponsorCount as $key => $value) {
		if ($value>=3) {
			if ($hideStr!='') $hideStr .=  ",$key";
			else $hideStr = $key;
		}
	}

	$options = array();
	if ($showStr) {
		if($hideStr) $filter = "id IN ($showStr) OR id NOT IN ($hideStr)";
		else $filter = "id IN ($showStr)";
	}
	else {
		if($hideStr) $filter = "id NOT IN ($hideStr)";
		else $filter = '1';
	}
	$results = getTableData("#__studentform", "id,name", "$filter ORDER BY name");
	foreach ($results as $result) {
		array_push($options, "$result[0]:$result[1]");
	}
	insertSponsorFormJS();
	echo "<div id=idStudentMap style='display:none'>".implode('/',$options)."</div>\n";
	echo "<img src='".preg_replace("/index\.php.*/","images/blank.gif",$_SERVER['REQUEST_URI'])."' onload='onLoadSponsorForm()' />\n";
}

function insertStudentFormJS()
{
?>
<script type='text/javascript'>
//<![CDATA[

function onLoadStudentForm()
{
	filterClassOptions();
}

function filterClassOptions()
{
	classElem = document.getElementById('class');
	allowedClasses = document.getElementById('allowedClasses').innerHTML.split(',');
	if (allowedClasses!=0) { // restricted access
		for (var i=0; i<classElem.length; i++) {
			if (allowedClasses.indexOf(classElem.options[i].value)==-1) {
				classElem.remove(i);
				i--;
			}
		}
	}
}

function validateDateOfBirth()
{
	numDays = new Array(0,31,29,31,30,31,30,31,31,30,31,30,31)
	elem = document.getElementById('dateOfBirth');
	var fields = elem.value.match(/^\s*(\d\d)\/(\d\d)\/(\d\d\d\d)\s*$/)
	if (!fields || fields.length!=4 ||
		parseInt(fields[3])<1980 || parseInt(fields[3])>2014 ||
		parseInt(fields[2])<0 || parseInt(fields[2])>12 ||
		parseInt(fields[1])>numDays[parseInt(fields[2])]) { // simplistic check for Feb
		alert("INPUT ERROR. Please correct the date of birth.");
		return false;
	}
	return true;
}
//]]>
</script>
<?php
}

function insertGradesFormJS()
{
?>
<script type='text/javascript'>
//<![CDATA[

window.addEvent('domready', function() {
  $('currentClass').addEvent('change', function() {
    loadStudentNames('onchange');
  });

  $('class').addEvent('change', function() {
    updateSubjects();
    updateExamType();
  });

  $('studentName').addEvent('change', function() {
    setStudentId();
  });

  $('gradesSubmit').addEvent('click', function() {
	  // so that DB is cleared for disabled fields
	  var subjects = ['kannadaMarks','englishMarks','hindiMarks','mathMarks','generalScienceMarks','socialStudiesMarks','computerScience'];
	  for (i=0; i<subjects.length; i++)
		  document.getElementById(subjects[i]).disabled = false;
    return true;
  });

});

function onLoadGradesForm()
{
	var savedExamType = document.getElementById('examType').value;
	loadStudentNames('init');
	updateSubjects();
	updateExamType(savedExamType);
}

function updateSubjects()
{
	classElem = document.getElementById('class');

	elem = document.getElementById('hindiMarks');
	if (parseInt(classElem.value)>=4) {
		elem.disabled = false;
		elem.value = elem.defaultValue;
	}
	else {
		elem.disabled = true;
		elem.value = '';
	}

	elem = document.getElementById('socialStudiesMarks');
	if (parseInt(classElem.value)>=5) {
		elem.disabled = false;
		elem.value = elem.defaultValue;
	}
	else {
		elem.disabled = true;
		elem.value = '';
	}

	elem = document.getElementById('computerScience');
	if (parseInt(classElem.value)>=6) {
		elem.disabled = false;
		elem.value = elem.defaultValue;
	}
	else {
		elem.disabled = true;
		elem.value = '';
	}
}

function updateExamType(savedExamType)
{
	var examTypes50 = ['Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (50 marks)','Test 3 (25 marks)','Test 4 (25 marks)','Final Exam (50 marks)'];
	var examTypes100 = ['Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (100 marks)','Test 3 (25 marks)','Test 4 (25 marks)','Final Exam (100 marks)'];
	var examTypesClass10 = ['Test 1 (25 marks)','Test 2 (25 marks)','Midterm Exam (100 marks)','Test 3 (25 marks)','Test 4 (100 marks)','Final Exam (100 marks)'];

	classElem = document.getElementById('class');
	examTypeElem = document.getElementById('examType');
	if (typeof(savedExamType)==='undefined')
		savedExamType = document.getElementById('examType').value;
	if (parseInt(classElem.value)==10) examTypes = examTypesClass10;
	else if (parseInt(classElem.value)>=8) examTypes = examTypes100;
	else examTypes = examTypes50;

	while(examTypeElem.options.length > 0) examTypeElem.remove(0);
	for (i=0; i<examTypes.length; i++) {
		var option = document.createElement("option");
		option.value = examTypes[i];
		option.text = examTypes[i];
		examTypeElem.add(option);
		if (savedExamType==examTypes[i]) examTypeElem.selectedIndex = i;
	}

}

function validateClass()
{
	currentClassElem = document.getElementById('currentClass');
	classElem = document.getElementById('class');
	if (parseInt(classElem.value) > parseInt(currentClassElem.value)) {
		alert("INPUT ERROR. Class for recording grades must be <= current class.");
		return false;
	}
	return true;
}

function validateKannadaMarks() { return validateMarks('kannadaMarks'); }
function validateEnglishMarks() { return validateMarks('englishMarks'); }
function validateHindiMarks() { return validateMarks('hindiMarks'); }
function validateMathMarks() { return validateMarks('mathMarks'); }
function validateGeneralScienceMarks() { return validateMarks('generalScienceMarks'); }
function validateSocialStudiesMarks() { return validateMarks('socialStudiesMarks'); }
function validateComputerScienceMarks() { return validateMarks('computerScience'); }
function validateMarks(subject)
{
	// class IX/Final: Kannada 125
	// class X/(Midterm|Test 4|Final): Kannada 125
	classElem = document.getElementById('class');
	elem = document.getElementById('examType');
	var maxMarks;
	if (parseInt(classElem.value)==10 &&
		elem.value.match(/(Midterm|Test 4|Final)/) &&
		subject=='kannadaMarks')
		maxMarks = 125;
	else if (parseInt(classElem.value)==9 &&
			elem.value.match(/(Final)/) &&
			subject=='kannadaMarks')
			maxMarks = 125;
	else
		maxMarks = elem.value.replace(/.*\((\d+) marks.*/g,"$1");
	if (parseInt(document.getElementById(subject).value) > parseInt(maxMarks)) {
		alert("INPUT ERROR. Marks must not exceed the maximum of " + maxMarks + ".");
		return false;
	}
	return true;
}

function validateAttendance()
{
	elem = document.getElementById('attendance');
	var str = elem.value.replace(/ /g,'');
	if (str=='') return true; // optional item

	fields = str.split('/');
	re = new RegExp('[0-9]+');
	if (fields.length!=2 ||
		fields[0].match(re)==null ||
		fields[1].match(re)==null) {
		alert("INPUT ERROR. Attendance input format: attended days / total days. Example, 24/30.");
		return false;
	}
	else if (parseInt(fields[0]) > parseInt(fields[1])) {
		alert("INPUT ERROR. Attended days must be <= total days.");
		return false;
	}
	elem.value = str; // after removal of spaces, if any.
	return true;
}

function setStudentId()
{
	studentIdElem = document.getElementById('studentId');
	studentNameElem = document.getElementById('studentName');
	studentIdElem.value = studentName.options[studentName.selectedIndex].value;
}

function loadClassYearOptions()
{
	currentClassElem = document.getElementById('currentClass');
	classElem = document.getElementById('class');
	while(classElem.options.length > 0) classElem.remove(0);

	var classes = ['I','II','III','IV','V','VI','VII','VIII','IX','X'];
	allowedClasses = document.getElementById('allowedClasses').innerHTML.split(',');
	if (allowedClasses!=0) { // restricted access
		// Show only current class
		var option = document.createElement("option");
		option.value = currentClassElem.options[currentClassElem.selectedIndex].value;
		option.text = classes[option.value-1];
		classElem.add(option);
		classElem.selectedIndex = 0;
		updateSubjects();
		updateExamType();

		// Show only latest year
		yearElem = document.getElementById('year');
		while(yearElem.options.length > 1) yearElem.remove(1);

		updateSubjects();
		updateExamType();

		return;
	}

	for (var i=0; i<currentClassElem.length && i<=currentClassElem.selectedIndex; i++) {
		var option = document.createElement("option");
		option.value = i+1;
		option.text = classes[i];
		classElem.add(option);
	}
	updateSubjects();
	updateExamType();
}

function loadStudentNames(context)
{
	studentNameElem = document.getElementById('studentName');
	while(studentNameElem.options.length > 0) studentNameElem.remove(0);

	// Filter based on user permissions
	allowedClasses = document.getElementById('allowedClasses').innerHTML.split(',');
	currentClassElem = document.getElementById('currentClass');
	var classes = ['I','II','III','IV','V','VI','VII','VIII','IX','X'];
	for (var i=0; i<currentClassElem.length; i++) {
		classNum = classes.indexOf(currentClassElem[i].innerHTML)+1;
		if (allowedClasses!='0' && (classNum==-1 || allowedClasses.indexOf(classNum.toString())==-1)) {
			currentClassElem.remove(i);
			i--;
		}
	}

	classElem = document.getElementById('class');
	mapElem = document.getElementById('classStudentMap');
	if (context == 'init') {
		// For saved studentId, set the current class
		studentIdElem = document.getElementById('studentId');
		if (context=='init' && studentIdElem.value!=-1) { // editing a record
			re = new RegExp('([0-9]+):'+studentIdElem.value+':([A-Za-z ]+)');
	    	found = mapElem.innerHTML.match(re);
			if (found.length) {
				for (var i=0; i<currentClassElem.length; i++) {
					if (currentClassElem.options[i].value==found[1]) {
						currentClassElem.selectedIndex = i;
						break;
					}
				}
			}
		}

		var savedClassVal = classElem.options[classElem.selectedIndex].value;
		loadClassYearOptions();
		classElem.value = savedClassVal;
		updateExamType();
	}
	else {
		// when current class is changed, update class
		loadClassYearOptions();
		classElem.value = currentClassElem.options[currentClassElem.selectedIndex].value;
		updateSubjects();
		updateExamType();
	}

	students = mapElem.innerHTML.split('/');
	selectIndex = -1;
	for (var i=0; i<students.length; i++) {
		fields = students[i].split(':');
		if (currentClassElem.value == fields[0]) { // applicable class
			var option = document.createElement("option");
			option.value = fields[1];
			option.text = fields[2];
			studentNameElem.add(option);

			if (studentIdElem.value==fields[1]) selectIndex = studentNameElem.length-1;
		}
	}

	if (selectIndex!=-1) {
		studentNameElem.selectedIndex = selectIndex;
		//currentClassElem.disabled=true;
		//studentNameElem.disabled=true;
		//classElem.disabled=true;
	}
	else setStudentId();
}
//]]>
</script>
<?php
}

function insertSkillsFormJS()
{
?>
<script type='text/javascript'>
//<![CDATA[

function onLoadSkillsForm()
{
	formElem = document.getElementById('chronoform-skillsForm');
	gradesRefIdElem = document.getElementById('gradesRefId');
	if (gradesRefIdElem.innerHTML!='') {
		gradesIdElem = formElem.getElementById('gradesId');
		gradesIdElem.value = gradesRefIdElem.innerHTML;
	}
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

  $('reportsSubmit').addEvent('click', function() {
  	reportTypeElem = document.getElementById('reportTypeId');
  	if (parseInt(reportTypeElem.value)==5) {
      return confirm('CAUTION: This will promote ALL students to the next higher class. This should be done only at the start of an academic year. Are you sure you want to do this?');
    }
    else if (parseInt(reportTypeElem.value)==4) {
      return confirm('INFO: This take will up to a minute. Click OK to proceed.');
    }
    return true;
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
		case 1:
		case 2:
			reportYearElem.style.display = 'block';
			reportExamTypeElem.style.display = 'block';
			classElem.style.display = 'none';
			studentNameElem.style.display = 'none';
			break;
		case 3:
			reportYearElem.style.display = 'none';
			reportExamTypeElem.style.display = 'none';
			classElem.style.display = 'block';
			studentNameElem.style.display = 'block';
			break;
		case 4:
			reportYearElem.style.display = 'block';
			reportExamTypeElem.style.display = 'none';
			classElem.style.display = 'block';
			studentNameElem.style.display = 'none';
			break;
		default: // includes 0, 5
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
window.addEvent('domready', function() {
  $('sponsorSubmit').addEvent('click', function() {
    return validateForm();
  });
});

function validateForm()
{
	var selOpt = [];
	sponsoredValuesElem = document.getElementById('sponsoredValues');
	for (var i=0; i<sponsoredValuesElem.options.length; i++){
		if (sponsoredValuesElem.options[i].selected) {
			selOpt.push(sponsoredValuesElem.options[i].value);
		}
	}

	sponsoredStudentsElem = document.getElementById('sponsoredStudents');
	if (selOpt.length) sponsoredStudentsElem.value = selOpt.join();
	else sponsoredStudentsElem.value = '';

	return true;
}

function onLoadSponsorForm()
{
	loadStudentNames('init');
}

function loadStudentNames(context)
{
	sponsoredValuesElem = document.getElementById('sponsoredValues');
	while(sponsoredValuesElem.options.length > 0) sponsoredValuesElem.remove(0);

	mapElem = document.getElementById('idStudentMap');

	if (mapElem.innerHTML=='') {
		var option = document.createElement("option");
		option.value = -1;
		option.text = "No students defined.";
		sponsoredValuesElem.add(option);
		sponsoredValuesElem.disabled = true;
		return;
	}

	students = mapElem.innerHTML.split('/');
	for (var i=0; i<students.length; i++) {
		fields = students[i].split(':');
		var option = document.createElement("option");
		option.value = fields[0];
		option.text = fields[1];
		sponsoredValuesElem.add(option);
	}


	sponsoredStudentsElem = document.getElementById('sponsoredStudents');
	if (sponsoredStudentsElem.value!='') {
		sponsoredStudents = sponsoredStudentsElem.value.split(',');
		for (var i=0; i<sponsoredValuesElem.options.length; i++) {
			for (var j=0; j<sponsoredStudents.length; j++) {
				if (sponsoredValuesElem.options[i].value==sponsoredStudents[j]) {
					sponsoredValuesElem.options[i].selected = true;
					break;
				}
			}
		}
	}
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
		echo getPhotoCode($id,"style='width:240px'");
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

function showSkillsFormTitle()
{
	if (isset($_REQUEST['id'])) {
		$id = $_REQUEST['id'];
		echo "<table class=studentPageTitle><tr>";
		echo "<td><h2>Editing Student Skills</h2></td>";
		echo "</tr></table>";
		return array('id' => $id);
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Adding New Skills</h2></td>";
	echo "</tr></table>";
	return array('id' => '99999999');
}

function getUserClassPermissions()
{
	$classStr = ['I','II','III','IV','V','VI','VII','VIII','IX','X'];
	$classes = array();
	$user = JFactory::getUser();
	$groups = implode(',',$user->getAuthorisedGroups());
	$results = getTableData("#__usergroups", "title", "id IN ($groups)");
	foreach ($results as $row) {
		if (preg_match("/Teacher Class (\S+)/",$row[0], $matches)) {
			$classes[] = array_search($matches[1], $classStr) + 1;
		}
	}
	if (count($classes)==0) return 0;
	return implode(',',$classes);
}

function showStudentList($who='student')
{
	if ($who=='graduate') {
		$filter = 'class>10';
		$title = 'Graduates';
	}
	else {
		$classes = getUserClassPermissions();
		if ($classes==0) $filter = 'class<=10';
		else $filter = "class IN ($classes)";
		$title = 'Students';
	}

	if (isset($_REQUEST['id'])) {
		if (isset($_REQUEST['action']) && $_REQUEST['action']=='delete') deleteStudent($_REQUEST['id'],$who);
		else showStudent($_REQUEST['id'],$who);
		return;
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Listing All $title</h2></td>";
	echo "</tr></table>";

	$allPhotoStr = '/'.implode('/',readPhotoDir()).'/';
	$itemLink = preg_replace("/view-(students|graduates)\??.*/","view-$1",$_SERVER['REQUEST_URI']);
	$sponsorLink = preg_replace("/students\/view-(students|graduates)\??.*/","sponsors/view-sponsors",$_SERVER['REQUEST_URI']);
	$columnHeadings = array('Photo','Student ID','Admission No.','Name','Class','Sex','Parent Status','Economic Status');
	$students = getTableData("#__studentform",
							 "id,studentUid,admissionNumber,name,class,sex,parentStatus,economicStatus",
							 "$filter ORDER BY class+0, name ASC"
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
		if ($who=='student') echo "<tr><td colspan=".count($columnHeadings)."><div class=message>No students have been entered into the system.</div></td></tr></table>";
		else echo "<tr><td colspan=".count($columnHeadings)."><div class=message>There are no graduates to display.</div></td></tr></table>";
		return;
	}

	$sponsors = false; //getTableData("#__sponsorform","id,name,sponsorUid,CONCAT(',',sponsoredStudents,',')","1 ORDER BY name");
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
			else if ($i==6) { // parent status
				if ($student[$i]=='Both parents are alive')
					echo "<td><img style='width:32px' src='../../images/male-icon.png' /><img style='width:32px' src='../../images/female-icon.png' /></td>";
				else if ($student[$i]=='Only father is alive')
					echo "<td><img style='width:32px' src='../../images/male-icon.png' /></td>";
				else if ($student[$i]=='Only mother is alive')
					echo "<td><img style='width:32px' src='../../images/blank-parent-icon.png' /><img style='width:32px' src='../../images/female-icon.png' /></td>";
				else echo "<td>&nbsp;</td>";
			}
			else if ($i==7) { // economic status
				if ($student[$i]!='Family is above poverty line')
					echo "<td><img style='width:32px' src='../../images/thumbs-down.png' /></td>";
				else echo "<td>&nbsp;</td>";
			}
			else echo "<td>".$student[$i]."</td>";
			if (false && $i==count($student)-1) { // Sponsors no longer shown
				if ($sponsors) {
					$outStr = "<td><ol>";
					foreach ($sponsors as $sponsor) {
						if (preg_match("/,$student[0],/",$sponsor[3])) {
							$outStr .= "<li><a href='$sponsorLink?id=$sponsor[0]'>$sponsor[1]</a></li>";
						}
					}
					$outStr .= "</ol></td>";
					echo preg_replace("/<td><ol><\/ol><\/td>/","<td>&nbsp;</td>",$outStr);
				}
				else echo "<td>&nbsp;</td>";
			}
		}
		echo "</tr>";
	}
	echo "</table>";
}

function showGradesList()
{
	if (isset($_REQUEST['skillsId'])) {
		if (isset($_REQUEST['action']) && $_REQUEST['action']=='delete') deleteStudentSkills($_REQUEST['skillsId']);
		else showStudentSkills($_REQUEST['skillsId']);
		return;
	}
	else if (isset($_REQUEST['id'])) {
		if (isset($_REQUEST['action']) && $_REQUEST['action']=='delete') deleteStudentGrades($_REQUEST['id']);
		else showStudentGrades($_REQUEST['id']);
		return;
	}
	else if (isset($_REQUEST['studentId'])) {
		if (isset($_REQUEST['action'])) {
			if ($_REQUEST['action']=='pdfall') generateStudentGradesReport($_REQUEST['studentId']);
			else if ($_REQUEST['action']=='pdf' && $_REQUEST['year']) generateStudentGradesReport($_REQUEST['studentId'],$_REQUEST['year']);
			return;
		}
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
		$examType = preg_replace('/\s+\(.*/','',$examType);
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Grades</h2></td>";
	echo "</tr></table>";

	$allPhotoStr = '/'.implode('/',readPhotoDir()).'/';
	$columnHeadings = array('Photo','Current Class','Grades for Class','Student ID','Name','Kannada','English','Hindi','Maths','General Science','Social Studies','Computer Science','Total','Details');

	# Filtering based on login permissions
	$classes = getUserClassPermissions();
	if ($classes==0) $filter = '#__gradesform.class<=10';
	else $filter = "#__gradesform.class IN ($classes)";

	# Get only current class, not the class where the student was in the past
	# If there are no grades for a combination of year and examType, the student will not be displayed
	$students = getTableData("#__studentform,#__gradesform",
							 "studentId,#__studentform.class,#__gradesform.class,studentUid,name,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience",
							 "$filter AND #__studentform.id=studentId AND year='$year' AND examType LIKE '%$examType%' ORDER BY #__studentform.class+0, name"
				);

	echo "<table class=studentList>";

	// Display form for user selection
	echo "<tr style='border:0px'><td colspan=".count($columnHeadings)." style='text-align:right;border:0px'>";
	$actionUrl = preg_replace("/[?].*/","",$_SERVER['REQUEST_URI']);
	echo "<form id=gradeSelForm method=get onsubmit='return true;' action='$actionUrl'>";
	$yrsArr = getYears();
	echo "<select style='width:100px;margin-right:5px' name=year>".getOptStr($yrsArr,false,0,$year)."</select>";
	echo "<select style='margin-right:5px' name=examType>".getOptStr(getExamOptions('DESC',-1),false,0,$examType)."</select>";
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
		$totalMarks = $totalBaseMarks = 0;
		$studentId = $student[0];
		$data = array();
		echo "<tr>";
		$itemLink = preg_replace("/view-grades\??.*/","view-grades",$_SERVER['REQUEST_URI']);
		if (preg_match("/\/Photo-$studentId\.(png|gif|jpg|jpeg)\//",$allPhotoStr)) {
			echo "<td>".getPhotoCode($studentId,"style='width:64px'")."</td>";
		}
		else echo "<td>&nbsp;</td>";

		$maxMarks = getMaxMarks($student[2], $examType);
		$kannadaMaxMarks = getKannadaMaxMarks($student[2], $examType);
		for ($i=1; $i<count($student); $i++) { // ignore id
			if ($i==1 || $i==2) {
				echo "<td>".getClassDisplayText($student[$i])."</td>";
			}
			else if ($i==4) { // have link for name and indicate duplicates
				$itemLink = preg_replace("/\/grades\/.*/","/students/view-students",$_SERVER['REQUEST_URI']);
				if (in_array($studentId,$dups)) echo "<td><a href='$itemLink?id=$studentId'>".$student[$i]." <span class=duplicateErr>*</span></td>";
				else echo "<td><a href='$itemLink?id=$studentId'>".$student[$i]."</td>";
			}
			else if ($i>=5 && $i<=11) {
				if ($i==5) $max = $kannadaMaxMarks;
				else $max = $maxMarks;
				if (setGrade($data,$student[$i],$max)) {
					$totalMarks += $student[$i];
					$totalBaseMarks += $max;
					echo "<td>".$data['grade']."</td>";
				}
				else echo "<td>&nbsp;</td>";
			}
			else echo "<td>".$student[$i]."</td>";
			if ($i==count($student)-1) {
				// Total
				if (setGrade($data,$totalMarks,$totalBaseMarks)) echo "<td>".$data['grade']."</td>";
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
	$numStudents = getTableData("#__studentform", "COUNT(id)", "class<=10", 0);
	if ($numStudents==0) {
		echo "<div class=message>There are no reports to view because no students have been entered into the system.<br>";
		return;
	}

	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing School Reports</h2></td>";
	echo "</tr></table>";

	$graphs = array('View student profile','View grades from an assessment','View top students from an assessment','View a student\'s performance over time');
	$actions = array('Generate class progress reports','Promote students to next class');
	$user = JFactory::getUser();
	if (!$user->get('isRoot')) array_pop($actions);
	$reports = array_merge($graphs,$actions);

	if (isset($_REQUEST['reportType'])) {
		$reportTypeKey = $_REQUEST['reportType'];
	}
	else {
		$reportTypeKey = 0;
	}
	$reportType = $reports[$reportTypeKey];

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

	if (isset($_REQUEST['class'])) {
		$class = $_REQUEST['class'];
	}
	else $class = -1;

	# Filtering based on login permissions
	$allclasses = array('I','II','III','IV','V','VI','VII','VIII','IX','X');
	$myclasses = getUserClassPermissions();
	if ($myclasses==0) $myclasses = '1,2,3,4,5,6,7,8,9,10';
	$clss = explode(',',$myclasses);
	if ($class==-1 || !in_array($class,$clss)) $class = $myclasses[0];
	$classOptStr = '';
	foreach ($clss as $cls) {
		$classes[] = $allclasses[$cls-1];
		if ($class==$cls) $classOptStr .= "<option selected=selected value='$cls'>".$allclasses[$cls-1]."</option>";
		else $classOptStr .= "<option value='$cls'>".$allclasses[$cls-1]."</option>";
	}

	if (isset($_REQUEST['studentId'])) {
		$studentId = $_REQUEST['studentId'];
	}
	else $studentId = getTableData("#__studentform","id","class='1' ORDER BY name LIMIT 1",0);;

	// Display form for user selection
	echo "<table class=studentList>";
	echo "<tr style='border:0px'><td style='border:0px'>";
	$actionUrl = preg_replace("/[?].*/","",$_SERVER['REQUEST_URI']);
	echo "<form id=reportSelForm method=get onsubmit='return true;' action='$actionUrl'>";
	echo "<select id=reportTypeId style='width:320px;margin-right:5px;float:left' name=reportType>";
	echo "<optgroup label=Graphs>".getOptStr($graphs,true,0,$reportType)."</optgroup>";
	if (!$user->guest) echo "<optgroup label=Actions>".getOptStr($actions,true,count($graphs),$reportType)."</optgroup>";
	echo "</select>";

	echo "<select id=class style='margin-right:5px;display:none;float:left' name=class>".getOptStr($classes,true,1,$classes[$class-1])."</select>";

	echo "<input id=studentIdLoad type=hidden disabled=disabled value='$studentId' />";
	echo "<select id=studentId style='margin-right:5px;display:none;float:left' name=studentId></select>"; # leave options to JS
	$yrsArr = getYears();
	echo "<select id=reportYearId style='width:100px;margin-right:5px;display:none;float:left' name=year>".getOptStr($yrsArr,false,0,$year)."</select>";
	echo "<select id=reportExamTypeId style='margin-right:5px;display:none;float:left' name=examType>".getOptStr(getExamOptions('DESC',-1),false,0,$examType)."</select>";
	echo "<input type=submit id=reportsSubmit value='View Report' />";
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
		//case 1:
			//reportSponsorship($currtime,$pathPrefix);
			//break;
		case 1:
			reportGrades($currtime,$pathPrefix,$year,$examType);
			break;
		case 2:
			reportTopStudents($currtime,$pathPrefix,$year,$examType);
			break;
		case 3:
			reportStudentPerformance($currtime,$pathPrefix,$class,$studentId);
			break;
		case 4:
			generateClassReport($currtime,$pathPrefix,$class,$year);
			break;
		case 5:
			promoteStudents($currtime,$pathPrefix);
			break;
	}
}

function printPdfPageHeader($pdf, &$xoff, &$yoff, $pageWidth, $data, $firstPage=true, $examType='')
{
	require_once("schooler.config.php");
	if ($leftPdfLogo!='')
		$pdf->Image($leftPdfLogo,$pdf->GetX(),$pdf->GetY()-5,30);
	if ($rightPdfLogo!='')
		$pdf->Image($rightPdfLogo,$pageWidth-40,$pdf->GetY()-5,30);
	$pdf->SetFont('Helvetica','B',30); $yoff += 10;
	$pdf->Text($pageWidth/4, $yoff, $pdfTitle); $yoff += 10;
	$pdf->SetFont('Helvetica','B',20);
	$pdf->Text($pageWidth/6, $yoff, $pdfAddress); $yoff += 10;
	$pdf->SetFont('Helvetica','B',20);
	$pdf->Text($pageWidth/2-40, $yoff, "Progress Report ".$data['year']); $yoff += 5;

	$pdf->SetFont('Helvetica','B',12);
	$pdf->Text($xoff, $yoff, "ID: ".$data['studentUid']); $yoff += 5;
	$pdf->Text($xoff, $yoff, "Name: ".$data['name']); $yoff += 5;
	if ($firstPage) { $pdf->Text($xoff, $yoff, "Date of Birth: ".$data['dateOfBirth']); $yoff += 5; }
	$pdf->Text($xoff, $yoff, "Standard: ".getClassDisplayText($data['class'])); $yoff += 5;
	if (!$firstPage) { $pdf->Text($xoff, $yoff, "Assessment: $examType"); $yoff += 5; }
}

function saveToPdf($data, $path, $filename)
{
	require_once('libraries/fpdf/fpdf.php');

	$pdf = new FPDF('L');
	$pdf->AddPage();
	$pageNum = 1;
	$pageWidth = 297; $pageHeight = 210; // A4 in mm
	$pdf->SetDrawColor(100,100,100);
	$pdf->SetFillColor(220,220,220);

	$inconsistent = 0;
	if ($data['class']>=6 || $inconsistent) {
		$numSubjects = 7;
		$rows = array('Kannada','English','Hindi','Mathematics','General Science','Social Studies','Computer Science','Total','Physical Education','Attendance','Conduct','Date');
	}
	else {
		$numSubjects = 6; // Although some subjects are not applicable for lower classes, print blank cells
		$rows = array('Kannada','English','Hindi','Mathematics','General Science','Social Studies','Total','Physical Education','Attendance','Conduct','Date');
	}
	$examTypes = getExamOptions('ASC',$data['class']);
	$examTypesStr = implode(',',$examTypes);
	$examTitles = explode(',',preg_replace("/\s*(Exam)?\s*\(.*?\)/","",$examTypesStr));
	$cols = array_merge(array('SUBJECT'),$examTypes,array('Remarks'));

	$xoff =10; $yoff = 10;
	printPdfPageHeader($pdf, $xoff, $yoff, $pageWidth, $data);

	$headColWidth = 60; $headRowHeight = 15; $indent = 2;
	$pdf->Rect($xoff,$yoff,$headColWidth,$headRowHeight);
	$pdf->SetFont('Helvetica','B',14);
	$pdf->Text($xoff+$indent,$yoff+5,$cols[0]);

	$xoff += $headColWidth;
	$examTypeColWidth = 27; $subColWidth = $examTypeColWidth/3;
	for ($i=1; $i<count($cols)-1; $i++, $xoff+=$examTypeColWidth) {
		$pdf->Rect($xoff,$yoff,$examTypeColWidth,$headRowHeight);
		$pdf->SetFont('Helvetica','B',11);
		$examType = preg_replace("/ Exam /","",$cols[$i]);
		$pdf->Text($xoff+$indent,$yoff+4,preg_replace("/\s*\(.*/","",$examType));
		$pdf->Text($xoff+$indent,$yoff+8,preg_replace("/.*\(/","(",$examType));
		$pdf->SetFont('Helvetica','',8);
		$pdf->SetXY($xoff,$yoff+10);
		$pdf->Cell($subColWidth,5,'Grade',1,0,'C');
		$pdf->Cell($subColWidth,5,'%',1,0,'C');
		$pdf->Cell($subColWidth,5,'Marks',1,0,'C');
	}

	$lastColWidth = $pageWidth-$xoff-10;
	$pdf->Rect($xoff,$yoff,$lastColWidth,$headRowHeight);
	$pdf->SetFont('Helvetica','B',14);
	$pdf->Text($xoff+$indent,$yoff+5,$cols[count($cols)-1]);

	$showFootnote = false;
	$rowHeight = 8; $yoff += 7+$rowHeight;
	for ($i=0; $i<count($rows); $i++, $yoff+=$rowHeight) {
		$xoff = 10;
		if ($i==count($rows)-1 && $data['class']<6) $rowHgt = 2*$rowHeight;
		else $rowHgt = $rowHeight;
		if ($rows[$i]=='Total') { $fillrect = 'FD'; $fillcell = true; }
		else { $fillrect = 'D'; $fillcell = false; }
		$pdf->Rect($xoff,$yoff,$headColWidth,$rowHgt,$fillrect);
		$pdf->SetFont('Helvetica','B',14);
		$cell = $rows[$i];
		if ($cell=='Total') $cell = 'TOTAL';
		$pdf->Text($xoff+$indent,$yoff+5,$cell);
		$pdf->SetFont('Helvetica','',11);
		for ($j=1, $xoff+=$headColWidth; $j<count($cols); $j++, $xoff+=$examTypeColWidth) {
			if ($j==count($cols)-1) {
				if ($i%2!=0) continue;
				else if (!isset($data['Remarks'][$cols[1+$i/2]])) $cell = '';
				else $cell = $data['Remarks'][$cols[1+$i/2]];
			}
			else if (!isset($data[$rows[$i]][$cols[$j]])) {
				if ($i<=$numSubjects) $cell = array('grade'=>'','%'=>'','marks'=>'');
				else $cell = '';
			}
			else if ($rows[$i]=='Date' && preg_match('/(\d+ [A-Z][a-z][a-z])[a-z]*( \d\d\d\d)/',$data[$rows[$i]][$cols[$j]],$matches)) {
				// eg. 12 July 2014 -> 12 Jul 2014
				$cell = $matches[1].$matches[2];
			}
			else $cell = $data[$rows[$i]][$cols[$j]];

			if ($j==count($cols)-1) {
				if ($i%2==0) {
					$pdf->Rect($xoff,$yoff,$lastColWidth,$rowHeight*2);
					$pdf->Text($xoff+$indent,$yoff+5,$examTitles[$i/2].": ");
					$pdf->SetFont('Helvetica','',10);
					$cell .= ' ';
					$firstLine = preg_replace("/(.{1,18}) .*/","$1",$cell);
					$pdf->Text($xoff+$lastColWidth/3+$indent,$yoff+5,$firstLine);
					preg_match_all("/(.{1,32}) /",substr($cell,strlen($firstLine)+1),$matches);
					$k = 1;
					foreach ($matches[0] as $match) {
						$pdf->Text($xoff+$indent,$yoff+5+$k*5,$match);
						$k++; if ($k>=3) break;
					}
				}
			}
			else if ($i<=$numSubjects) {
				$pdf->SetXY($xoff,$yoff);
				$pdf->Cell($subColWidth,$rowHeight,$cell['grade'],1,0,'L',$fillcell);
				$pdf->Cell($subColWidth,$rowHeight,$cell['%'],1,0,'R',$fillcell);
				if ($rows[$i]=='Kannada' && getKannadaMaxMarks($data['class'],$cols[$j])==125) {
					$pdf->Cell($subColWidth,$rowHeight,'*'.$cell['marks'],1,0,'R',$fillcell);
					$showFootnote = true;
				}
				else {
					$pdf->Cell($subColWidth,$rowHeight,$cell['marks'],1,0,'R',$fillcell);
				}
			}
			else {
				$cell = preg_replace("/Needs to improve/","To improve",$cell);
				$pdf->Rect($xoff,$yoff,$examTypeColWidth,$rowHgt);
				$pdf->Text($xoff+$indent,$yoff+5,$cell);
			}
		}
	}
	if ($showFootnote) {
		$pdf->Text($pageWidth-50, $yoff+$rowHeight/2, "* Out of 125 marks");
	}

	$pdf->Text(10, $pageHeight-10, "GRADE");
	$pdf->Text($pageWidth/7, $pageHeight-10, "A+ >=90%");
	$pdf->Text(2*$pageWidth/7, $pageHeight-10, "A 75-89%");
	$pdf->Text(3*$pageWidth/7, $pageHeight-10, "B+ 65-74%");
	$pdf->Text(4*$pageWidth/7, $pageHeight-10, "B 50-64%");
	$pdf->Text(5*$pageWidth/7, $pageHeight-10, "C+ 35-49%");
	$pdf->Text(6*$pageWidth/7, $pageHeight-10, "C <35%");

	// Although part of page header, this is included last so that
	// comes on top of table border
	$pdf->Image(findPhoto($data['studentId']),$pageWidth-40,40,24);

	// Print skills if they are present
	foreach ($data as $key=>$val) {
		if ($key!='Skills') continue;
		foreach ($val as $k=>$v) {
			if (preg_match("/view-grades\?id=\d+&skillsId=(\d+)/",$v,$matches)) {
				$skillsId = $matches[1];
				$pdf->AddPage();
				$xoff =10; $yoff = 10;
				printPdfPageHeader($pdf, $xoff, $yoff, $pageWidth, $data, false, $k);

				$result = getTableData("#__skillsform",
							"kannadaReadingSkills,kannadaWritingSkills,kannadaSpeakingSkills,englishReadingSkills,englishWritingSkills,englishSpeakingSkills,hindiReadingSkills,hindiWritingSkills,hindiSpeakingSkills,mathSkills,scienceSkills,socialStudiesSkills,otherInterests,behaviour,#__skillsform.remarks",
							 "id=$skillsId",1);

				$headColWidth = 60; $headRowHeight = 5; $indent = 2;
				$pdf->Rect($xoff,$yoff,$headColWidth,$headRowHeight);
				$pdf->SetFont('Helvetica','B',12);
				$colWidth = ($pageWidth - $headColWidth - 20)/3;
				$rowHeight = 10;

				$pdf->SetXY($xoff+$headColWidth,$yoff);
				$pdf->Cell($colWidth,$headRowHeight,'Reading Skills',1,0,'C',true);
				$pdf->Cell($colWidth,$headRowHeight,'Writing Skills',1,0,'C',true);
				$pdf->Cell($colWidth,$headRowHeight,'Speaking Skills',1,0,'C',true);

				$RowHeading = array('Kannada','English','Hindi','Mathematics','Science','Social Studies','Other Interests','Behaviour','Remarks & Suggestions');
				for ($i=0; $i<count($RowHeading); $i++) {
					if ($i<3) {
						if ($i==0) $yoff += 0.5*$rowHeight;
						else $yoff += 1.7*$rowHeight;
						$pdf->SetXY($xoff,$yoff);
						$pdf->SetFont('Helvetica','B',14);
						$pdf->Cell($headColWidth,1.7*$rowHeight,$RowHeading[$i],1,0,'L');
						$pdf->SetFont('Helvetica','',12);

						for ($j=0; $j<3; $j++) {
							$cell = preg_replace('/\n/',' ',$result[3*$i+$j])." ";
							$pdf->Cell($colWidth,1.7*$rowHeight,'',1,0,'L');
							preg_match_all("/(.{1,37}) /",$cell,$matches);
							$k = 1;
							foreach ($matches[0] as $match) {
								$pdf->Text($xoff+$headColWidth+$j*$colWidth+$indent,$yoff+$k*5,$match);
								$k++; if ($k>=4) break;
							}
						}
					}
					else {
						if ($i==3) $yoff += 0.5*$rowHeight;
						else $yoff += $rowHeight;
						$pdf->SetXY($xoff,$yoff);
						$pdf->SetFont('Helvetica','B',14);
						$pdf->Cell($headColWidth,$rowHeight,$RowHeading[$i],1,0,'L');
						$pdf->SetFont('Helvetica','',12);
						$cell = preg_replace('/\n/',' ',$result[6+$i])." ";
						if (strlen($cell)>114) {
							$pdf->Cell($colWidth,$rowHeight,'',1,0,'L');
							preg_match_all("/(.{1,113}) /",$cell,$matches);
							$k = 1;
							foreach ($matches[0] as $match) {
								$pdf->Text($xoff+$headColWidth+$indent,$yoff+$k*5-1,$match);
								$k++; if ($k>=3) break;
							}
						}
						else {
							$pdf->SetFont('Helvetica','',12);
							$pdf->Cell($colWidth,$rowHeight,$cell,1,0,'L');
						}
					}
					if ($i==2) { // header row after languages
						$yoff += 2*$rowHeight;
						$pdf->Rect($xoff,$yoff,$headColWidth,$headRowHeight);
						$pdf->SetFont('Helvetica','B',12);
						$pdf->SetXY($xoff+$headColWidth,$yoff);
						$colWidth = ($pageWidth - $headColWidth - 20);
						$pdf->Cell($colWidth,$headRowHeight,'Observations',1,0,'C',true);
					}
				}
			}
		}
	}

	$absPath = JPATH_BASE.DS.$path;
	if (!is_dir($absPath)) mkdir($absPath);
	$pdf->Output($absPath.DS.$filename,'F');
}

function generateClassReport($currtime, $pathPrefix, $class, $year)
{
	deleteOldReports();

	// Fields obtained should be in line with saveGradesData
	$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
	$results = getTableData("#__studentform,#__gradesform",
							 "studentId,year,examType,DATE_FORMAT(#__gradesform.created,'%d %M %Y'),DATE_FORMAT(#__gradesform.modified,'%d %M %Y'),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,physicalEducation,conduct,attendance,remarks,#__gradesform.id,#__gradesform.class,name,dateOfBirth,studentUid",
							 "#__gradesform.class='$class' AND year='$year' AND #__studentform.id=studentId ORDER BY studentId, year DESC, FIELD(examType,$examOptStr)");

	if (count($results)==0) {
		echo "<div class=message style='margin-top:50px'>No grades have been recorded for class ".getClassDisplayText($class)." in year $year.</div>";
		return;
	}

	$skillsResults = getSkills($results);

	$savePath = "data.".time();
	$studentId = ''; $data = $gradedClass = $skipped = $files = array();
	for ($i=0; $i<count($results); $i++) {
		$res = $results[$i];
		if ($studentId!='' && $res[0]!=$studentId) { // start of another student, save processed one
			if (!in_array($data['name'],$skipped)) {
				saveToPdf($data, $savePath, $filename);
				array_push($files, $filename);
			}
			$data = $gradedClass = array();
		}
		saveGradesData($data, $res, $skillsResults);
		$studentId = $data['studentId'];
		$filename = $data['studentUid'].".".getClassDisplayText($class).".$year.".preg_replace("/ /","",$data['name']).".pdf";
		if (count($gradedClass) && !in_array($class,$gradedClass)) {
			array_push($skipped, $data['name']);
		}
		else {
			array_push($gradedClass, $class);
		}
	}
	if ($studentId!='') {
		if (!in_array($data['name'],$skipped)) {
			saveToPdf($data, $savePath, $filename);
			array_push($files, $filename);
		}
		zipAllFiles($savePath, "ClassReport.".getClassDisplayText($class).".$year.zip", $files);
	}

	// TODO: skipping here is useless since we have filtered by class
	// Inconsistent data will simply be missing in individual reports
	printSkippedRecords($skipped);

	return;
}

function generateStudentGradesReport($id, $yearReq='*')
{
	deleteOldReports();

	// Fields obtained should be in line with saveGradesData
	if ($yearReq=='*') { $yearFilter = ''; $msg = ""; }
	else { $yearFilter = "year='$yearReq' AND"; $msg = " in year $yearReq"; }
	$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
	$results = getTableData("#__studentform,#__gradesform",
		 					"studentId,year,examType,DATE_FORMAT(#__gradesform.created,'%d %M %Y'),DATE_FORMAT(#__gradesform.modified,'%d %M %Y'),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,physicalEducation,conduct,attendance,remarks,#__gradesform.id,#__gradesform.class,name,dateOfBirth,studentUid",
		 					"$yearFilter studentId=$id AND #__studentform.id=studentId ORDER BY year, FIELD(examType,$examOptStr)");
	if (count($results)==0) {
		echo "<div class=message style='margin-top:50px'>No grades have been recorded for this student$msg.</div>";
		return;
	}

	$skillsResults = getSkills($results);

	$savePath = "data.".time();
	$year = ''; $data = $gradedClass = $skipped = $files = array();
	for ($i=0; $i<count($results); $i++) {
		$res = $results[$i];
		if ($year!='' && $res[1]!=$year) { // start of another student, save processed one
			if (!in_array($data['year'],$skipped)) {
				saveToPdf($data, $savePath, $filename);
				array_push($files, $filename);
			}
			$data = $gradedClass = array();
		}
		saveGradesData($data, $res, $skillsResults);
		$year = $data['year'];
		$filename = $data['studentUid'].".".getClassDisplayText($data['class']).".$year.".preg_replace("/ /","",$data['name']).".pdf";
		if (count($gradedClass) && !in_array($data['class'],$gradedClass)) {
			array_push($skipped, $data['year']);
		}
		else {
			array_push($gradedClass, $data['class']);
		}
	}
	if ($year!='') {
		if (!in_array($data['year'],$skipped)) {
			saveToPdf($data, $savePath, $filename);
			array_push($files, $filename);
		}
		if ($yearReq=='*') {
			zipAllFiles($savePath, $data['studentUid'].".".$data['name'].".zip", $files);
		}
		else { // single PDF
			$path = JURI::root();
			if (count($skipped)==0) echo "<div class='message'>Requested report has been generated.<br>Please download the file: <a href='$path/$savePath/$filename'>$filename</a></div>";
			else echo "<div class='message'>Unable to generate report.<br>Please check if grades are correctly recorded.</div>";
		}
	}

	printSkippedRecords($skipped);
}

function generateSponsorReport($id)
{
	deleteOldReports();

	$sponsorInfo = getTableData("#__sponsorform","name,sponsoredStudents","id=$id",1);
	$years = getYears();
	$examOptStr = "'".implode("','",getExamOptions('DESC'))."'";
	$results = getTableData("#__studentform,#__gradesform",
		 					"studentId,year,examType,DATE_FORMAT(#__gradesform.created,'%d %M %Y'),DATE_FORMAT(#__gradesform.modified,'%d %M %Y'),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,physicalEducation,conduct,attendance,remarks,#__gradesform.id,#__gradesform.class,name,dateOfBirth,studentUid",
		 					"year='$years[0]' AND studentId IN ($sponsorInfo[1]) AND #__studentform.id=studentId ORDER BY studentId, FIELD(examType,$examOptStr)");
	if (count($results)==0) {
		echo "<div class=message style='margin-top:50px'>No grades have been recorded for students sponsored by $sponsorInfo[0] in year $years[0].</div>";
		return;
	}

	$skillsResults = getSkills($results);

	$savePath = "data.".time();
	$studentId = ''; $data = $gradedClass = $skipped = $files = array();
	for ($i=0; $i<count($results); $i++) {
		$res = $results[$i];
		if ($studentId!='' && $res[0]!=$studentId) { // start of another student, save processed one
			if (!in_array($data['name'],$skipped)) {
				saveToPdf($data, $savePath, $filename);
				array_push($files, $filename);
			}
			$data = $gradedClass = array();
		}
		saveGradesData($data, $res, $skillsResults);
		$studentId = $data['studentId'];
		$filename = $data['studentUid'].".".getClassDisplayText($data['class']).".$years[0].".preg_replace("/ /","",$data['name']).".pdf";
		if (count($gradedClass) && !in_array($data['class'],$gradedClass)) {
			array_push($skipped, $data['name']);
		}
		else {
			array_push($gradedClass, $data['class']);
		}
	}
	if ($studentId!='') {
		if (!in_array($data['name'],$skipped)) {
			saveToPdf($data, $savePath, $filename);
			array_push($files, $filename);
		}
		zipAllFiles($savePath, "SponsorReport.".preg_replace("/ /","",$sponsorInfo[0]).".$years[0].zip", $files);
	}

	printSkippedRecords($skipped);
}

function printSkippedRecords($skipped)
{
	if (count($skipped)==0) return;

	echo "<div class=message>Skipped reporting for the following since data was not consistent:</div>";
	echo "<ul>";
	foreach ($skipped as $skip) {
		echo "<li>$skip</li>";
	}
	echo "</ul>";
}

function deleteOldReports()
{
	// Delete old files: 10 minutes
	$datafiles = scandir(JPATH_BASE);
	foreach($datafiles as $file) {
		if(preg_match("/^data\./",$file) && is_dir($file)
			&& time() - filemtime($file) >= 10*60) {
				$innerfiles = scandir(JPATH_BASE.DS.$file);
				foreach($innerfiles as $inner)
					if (is_file(JPATH_BASE.DS.$file.DS.$inner))
						unlink(JPATH_BASE.DS.$file.DS.$inner);
				rmdir(JPATH_BASE.DS.$file);
		}
	}
}

function zipAllFiles($path, $zipname, $files)
{
	if (count($files)==0) {
		echo "<div class='message'>Unable to generate report.<br>Please check if grades are correctly recorded.</div>";
		return;
	}

	$absPath = JPATH_BASE.DS.$path;
	$zip = new ZipArchive;
	if ($zip->open($absPath.DS.$zipname, ZIPARCHIVE::OVERWRITE) === TRUE) {
		foreach ($files as $file) {
	    	$zip->addFile($absPath.DS.$file, $file);
		}
    	$zip->close();
		echo "<div class='message'>Requested report has been generated.<br>Please download the file: <a href='".JURI::root()."/$path/$zipname'>$zipname</a></div>";
   	}
	else {
		echo "<div class='error message'>There was an error in creating the ZIP file.<br>Please try again.</div>";
	}
}

function promoteStudents($currtime, $pathPrefix)
{
	$user = JFactory::getUser();
	if (!$user->guest) {
		executeQuery("UPDATE #__studentform SET class=class+1");
		echo "<div class=message>All students have been promoted to the next higher class.<br>";
		echo "Class X students were marked as <i>Graduates</i>.<br>";
		echo "For special cases such as students who have not passed, update via their individual pages.</div>";
	}
	else {
		echo "<div class='error message'>You do not have permissions to promote students to the next higher class.<div>";
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
	$basePath = "/var/www/html/schooler";
	$fh = fopen("$basePath/$filename", 'w') or die("Can't open file $basePath/$filename for saving data into CSV file.");
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
	$results = getTableData("#__studentform", "sex,COUNT(*)", "class<=10 GROUP BY sex");
	printToFile($csvFile, "sex,count", getCsvFormat($results, false));
	echo "<sexRatio src='$pathPrefix/$csvFile'></sexRatio>\n";

	echo "<div class=graphTitle><h3>Age Profile</h3></div>";
	$csvFile = "dataAgeHist-$currtime.csv";
	$results = getTableData("#__studentform", getAgeQuery().",SUM(CASE WHEN sex='Female' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' THEN 1 ELSE 0 END)", "class<=10 GROUP BY age ORDER BY age+0");
	printToFile($csvFile, "Age,Female,Male", getCsvFormat($results, true));
	echo "<ageHist src='$pathPrefix/$csvFile'></ageHist>\n";

	/*
	echo "<div class=graphTitle><h3>Group Profile</h3></div>";
	$csvFile = "dataGroupProfile-$currtime.csv";
	$results = getTableData("#__studentform", "`group`,SUM(CASE WHEN sex='Female' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' THEN 1 ELSE 0 END)", "class<=10 GROUP BY `group` ORDER BY `group`");
	printToFile($csvFile, "Group,Female,Male", getCsvFormat($results, true));
	echo "<groupProfile src='$pathPrefix/$csvFile'></groupProfile>\n";
	*/

	echo "<div class=graphTitle><h3>Class Profile</h3></div>";
	$csvFile = "dataClassProfile-$currtime.csv";
	$results = getTableData("#__studentform", "class,SUM(CASE WHEN sex='Female' THEN 1 ELSE 0 END),SUM(CASE WHEN sex='Male' THEN 1 ELSE 0 END)", "class<=10 GROUP BY class ORDER BY class+0");
	$arr = array();
	for($i=0; $i<count($results); $i++) {
		$arr[$i] = $results[$i];
		$arr[$i][0] = getClassDisplayText($arr[$i][0]);
	}
	printToFile($csvFile, "Class,Female,Male", getCsvFormat($arr, false));
	echo "<classProfile src='$pathPrefix/$csvFile'></classProfile>\n";

	echo "<script src='$pathPrefix/media/d3/studentProfile.js'></script>";

	return;
}

function reportSponsorship($currtime, $pathPrefix)
{
	$numStudents = getTableData("#__studentform","COUNT(*)","1",0);
	$sponsored = getTableData("#__sponsorform","sponsoredStudents");
	$allSponsoredStr = '';
	foreach ($sponsored as $spd) $allSponsoredStr .= ','.$spd[0];
	$allSponsoredStr = trim(preg_replace("/,+/",",",$allSponsoredStr),",");
	$allSponsored = explode(',',$allSponsoredStr);
	$sponsoredHist = array_count_values($allSponsored);
	$sponsoredCount = array_count_values($sponsoredHist);
	$sponsoredCount['0'] = $numStudents - array_sum($sponsoredCount);

	if (!preg_match("/[1-9]/",$allSponsoredStr)) {
		echo "<div class=message>No sponsors have been entered into the system.</div>";
		return;
	}

	echo "<h3>Sponsorship Summary</h3>";
	$csvFile = "dataSponsorship-$currtime.csv";
	$results = array();
	ksort($sponsoredCount);
	foreach ($sponsoredCount as $key => $value) {
		array_push($results, array("$key Sponsors",$value));
	}
	printToFile($csvFile, "group,count", getCsvFormat($results, false));
	echo "<sponsorship src='$pathPrefix/$csvFile'></sponsorship>\n";

	echo "<div class=graphTitle><h3>Age Profile of Sponsored Students/Graduates</h3></div>";
	$csvFile = "dataSponsoredAgeHist-$currtime.csv";
	$results = getTableData("#__studentform",
							getAgeQuery()
							.",SUM(CASE WHEN sex='Female' AND id IN ($allSponsoredStr) THEN 1 ELSE 0 END)"
							.",SUM(CASE WHEN sex='Male' AND id IN ($allSponsoredStr) THEN 1 ELSE 0 END)",
							"1 GROUP BY age ORDER BY age+0");
	printToFile($csvFile, "Age,Female,Male", getCsvFormat($results, true));
	echo "<sponsored src='$pathPrefix/$csvFile'></sponsored>\n";

	echo "<div class=graphTitle><h3>Age Profile of Students with No Sponsors</h3></div>";
	$csvFile = "dataUnsponsoredAgeHist-$currtime.csv";
	$results = getTableData("#__studentform",
							getAgeQuery()
							.",SUM(CASE WHEN sex='Female' AND id NOT IN ($allSponsoredStr) THEN 1 ELSE 0 END)"
							.",SUM(CASE WHEN sex='Male' AND id NOT IN ($allSponsoredStr) THEN 1 ELSE 0 END)",
							"class<=10 GROUP BY age ORDER BY age+0");
	printToFile($csvFile, "Age,Female,Male", getCsvFormat($results, true));
	echo "<unsponsored src='$pathPrefix/$csvFile'></unsponsored>\n";

	echo "<script src='$pathPrefix/media/d3/sponsorship.js'></script>";

	return;
}

function reportGrades($currtime, $pathPrefix, $year, $examType)
{
	echo "<h3>School Performance Based On Subject Grades</h3>";
	$csvFile = "dataSchoolPerf-$currtime.csv";
	$results = getTableData("#__studentform,#__gradesform", "#__gradesform.class,`group`,sex,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience", "#__studentform.id=studentId AND year='$year' AND examType LIKE '%$examType%'");
	$grades = array(); $allGrades = array('A+','A','B+','B','C+','C');
	foreach ($allGrades as $grade) $grades[$grade] = 0;
	$subjects = array(); $allSubjects = array('Kannada','English','Hindi','Math','Science','Social','Computer');
	foreach ($allSubjects as $subject) $subjects[$subject] = array('A/A+'=>0,'B/B+'=>0,'C/C+'=>0);
	$classes = array(); $allClasses = array('I','II','III','IV','V','VI','VII','VIII','IX','X');
	foreach ($allClasses as $class) $classes[$class] = array('A/A+'=>0,'B/B+'=>0,'C/C+'=>0);
	$groups = array(); $allGroups = array('Azad','Bhagath','Subhash','Vivek');
	foreach ($allGroups as $group) $groups[$group] = array('A/A+'=>0,'B/B+'=>0,'C/C+'=>0);
	foreach ($results as $result) {
		$maxMarks = getMaxMarks($result[0], $examType);
		$kannadaMaxMarks = getKannadaMaxMarks($result[0], $examType);
		for ($j=3; $j<10; $j++) {
			if ($result[$j]>0) { // grade is recorded for this subject
				if ($j==3)
					$percentage = floor(0.5+100*$result[$j]/$kannadaMaxMarks);
				else
					$percentage = floor(0.5+100*$result[$j]/$maxMarks);
				$grade = getGrade($percentage);
				$grades[$grade]++;
				if ($grade=='A' || $grade=='A+') $gradeIdx = 'A/A+';
				else if ($grade=='B' || $grade=='B+') $gradeIdx = 'B/B+';
				else $gradeIdx = 'C/C+';
				$class = getClassDisplayText($result[0]);
				$classes[$class][$gradeIdx]++;
				//$groups[$result[1]][$gradeIdx]++;
				switch ($j) {
					case 3: $subjects['Kannada'][$gradeIdx]++; break;
					case 4: $subjects['English'][$gradeIdx]++; break;
					case 5: $subjects['Hindi'][$gradeIdx]++; break;
					case 6: $subjects['Math'][$gradeIdx]++; break;
					case 7: $subjects['Science'][$gradeIdx]++; break;
					case 8: $subjects['Social'][$gradeIdx]++; break;
					case 9: $subjects['Computer'][$gradeIdx]++; break;
				}
			}
		}
	}

	$arr = array();
	foreach ($allGrades as $grade) array_push($arr, array($grade,$grades[$grade]));
	printToFile($csvFile, "grade,count", getCsvFormat($arr, false));
	echo "<schoolPerf src='$pathPrefix/$csvFile'></schoolPerf>\n";

	echo "<div class=graphTitle><h3>Grades by Subject</h3></div>";
	$csvFile = "dataGradesSubject-$currtime.csv";
	$arr = array();
	foreach ($allSubjects as $subject) array_push($arr, array($subject,$subjects[$subject]['A/A+'],$subjects[$subject]['B/B+'],$subjects[$subject]['C/C+']));
	printToFile($csvFile, "Subject,A/A+,B/B+,C/C+", getCsvFormat($arr, true));
	echo "<gradesSubject src='$pathPrefix/$csvFile'></gradesSubject>\n";

	echo "<div class=graphTitle><h3>Grades by Class</h3></div>";
	$csvFile = "dataGradesClass-$currtime.csv";
	$arr = array();
	foreach ($allClasses as $class) array_push($arr, array($class,$classes[$class]['A/A+'],$classes[$class]['B/B+'],$classes[$class]['C/C+']));
	printToFile($csvFile, "Class,A/A+,B/B+,C/C+", getCsvFormat($arr, true));
	echo "<gradesClass src='$pathPrefix/$csvFile'></gradesClass>\n";

	/*
	echo "<div class=graphTitle><h3>Grades by Group</h3></div>";
	$csvFile = "dataGradesGroup-$currtime.csv";
	$arr = array();
	foreach ($allGroups as $group) array_push($arr, array($group,$groups[$group]['A/A+'],$groups[$group]['B/B+'],$groups[$group]['C/C+']));
	printToFile($csvFile, "Group,A/A+,B/B+,C/C+", getCsvFormat($arr, true));
	echo "<gradesGroup src='$pathPrefix/$csvFile'></gradesGroup>\n";
	*/

	echo "<script src='$pathPrefix/media/d3/grades.js'></script>";

	return;
}

function reportTopStudents($currtime, $pathPrefix, $year, $examType)
{
	/*
	echo "<h3>Class Toppers by Group</h3>";
	$csvFile = "dataTopStudents-$currtime.csv";
	echo "<topStudents src='$pathPrefix/$csvFile'></topStudents>\n";
	*/

	//SELECT ek5d2_gradesform.class,name,`group`,sex,(kannadaMarks+englishMarks+hindiMarks+mathMarks+generalScienceMarks+socialStudiesMarks+computerScience) AS total,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,ek5d2_gradesform.id,studentId FROM ek5d2_studentform,ek5d2_gradesform  WHERE ek5d2_studentform.id=studentId AND year='2013-14' AND examType LIKE '%Final%' ORDER BY ek5d2_gradesform.class+0, total DESC;

	$results = getTableData("#__studentform,#__gradesform", "#__gradesform.class,name,`group`,sex,(kannadaMarks+englishMarks+hindiMarks+mathMarks+generalScienceMarks+socialStudiesMarks+computerScience) AS total,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,#__gradesform.id,studentId", "#__studentform.id=studentId AND year='$year' AND examType LIKE '%$examType%' ORDER BY #__gradesform.class+0, total DESC");
	$prevClass = -1; $rank = $males = $females = 0; $groupmap = array();
	foreach ($results as $result) {
		if ($prevClass!=$result[0]) {
			if ($prevClass!=-1) {
				echo "</table>";
				$rank = 0;
			}
			echo "<div class=graphTitle><h3>Class ".getClassDisplayText($result[0])." Toppers</h3></div>";
			echo "<table class=studentView>";
			echo "<tr><th>Rank</th><th>Photo</th><th>Student Name</th><th>Sex</th><th>Percentage</th><th>Details</th></tr>";
		}
		$rank++;
		if ($rank<=5) { // only 5 toppers shown per class
			// TODO Assumption that toppers have taken all applicable subjects
			if (!isset($groupmap[$result[2]])) {
				$groupmap[$result[2]]['Male']=0;
				$groupmap[$result[2]]['Female']=0;
			}
			$groupmap[$result[2]][$result[3]]++;
			$maxMarks = getMaxMarks($result[0], $examType);
			$kannadaMaxMarks = getKannadaMaxMarks($result[0], $examType);
			$totalBaseMarks = 0;
			for ($j=5; $j<12; $j++) {
				if ($j==5) $max = $kannadaMaxMarks;
				else $max = $maxMarks;
				if ($result[$j]>0) $totalBaseMarks += $max;
			}
			$percentage = floor(0.5+(100*$result[4])/$totalBaseMarks);
			$studentLink = preg_replace("/\/reports[?]?.*$/","/students/view-students?id=$result[13]",$_SERVER['REQUEST_URI'],1);
			$itemLink = preg_replace("/\/reports[?]?.*$/","/grades/view-grades?id=$result[12]",$_SERVER['REQUEST_URI'],1);
			echo "<tr><td style='font-size:2em'>$rank</td><td>".getPhotoCode($result[13],"style='width:64px'")."</td>";
			echo "<td><a href='$studentLink'>$result[1]</a></td><td>$result[3]</td><td>$percentage %</td>";
			echo "<td><a href='$itemLink'>Details</a></td></tr>";
		}
		$prevClass = $result[0];
	}
	echo "</table>";

	return; // skip rest of the code since group info is not shown

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
	$results = getTableData("#__studentform,#__gradesform","name,year,examType,kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,#__gradesform.class","studentId='$studentId' AND #__studentform.id=studentId ORDER BY year DESC, FIELD(examType,$examOptStr) LIMIT 1", 1);

	if (count($results)==0) {
		echo "<div class=message>No grades have been recorded for this combination of student, year and assessment type.</div>";
		return;
	}

	$classAvg = getTableData("#__gradesform","kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience","class='$results[10]' AND year='".$results[1]."' AND examType='".$results[2]."'");
	$maxMarks = getMaxMarks($class, $results[2]);
	$kannadaMaxMarks = getKannadaMaxMarks($results[10], $results[2]);
	$allSubjects = array('Kannada','English','Hindi','Math','Science','Social','Computer');
	$classGrades = array();
	foreach ($classAvg as $avg) {
		for ($j=0; $j<count($avg); $j++) {
			if ($avg[$j]>0) {
				if (!isset($classGrades[$allSubjects[$j]]['Total'])) $classGrades[$allSubjects[$j]]['Total'] = 0;
				if (!isset($classGrades[$allSubjects[$j]]['Count'])) $classGrades[$allSubjects[$j]]['Count'] = 0;
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
	echo "Class ".getClassDisplayText($results[10])." / $results[1] / $results[2]<br>";
	$arr = array();
	for ($i=0; $i<count($allSubjects) && $results[10]>=6 || $i<count($allSubjects)-1 && $results[10]<6; $i++) {
		if (array_key_exists($allSubjects[$i],$classGrades)) {
			if ($i==0) $max = $kannadaMaxMarks;
			else $max = $maxMarks;
			$studentPercent = floor(0.5+100*$results[$i+3]/$max);
			$classPercent = floor(0.5+100*$classGrades[$allSubjects[$i]]['Avg']/$max);
			array_push($arr, array($allSubjects[$i],$studentPercent,$classPercent));
		}
	}
	$csvFile = "dataStudentRecentPerf-$currtime.csv";
	printToFile($csvFile, "Subject,This Student,Class Average", getCsvFormat($arr, false));
	echo "<studentRecentPerf src='$pathPrefix/$csvFile'></studentRecentPerf>\n";

	echo "<div class=graphTitle><h3>Student's Performance Over Time [<a href='index.php/grades/view-grades?studentId=$studentId'>Details</a>]</h3></div>";
	// Limit to recent 6 tests, consider only those where at least one subject has recorded marks
	// TODO For a particular subject, all grades are missing
	$results = getTableData("#__gradesform","CONCAT(year,'/',examType),kannadaMarks,englishMarks,hindiMarks,mathMarks,generalScienceMarks,socialStudiesMarks,computerScience,#__gradesform.class","studentId='$studentId' AND (kannadaMarks+englishMarks+hindiMarks+mathMarks+generalScienceMarks+socialStudiesMarks+computerScience)>0 ORDER BY year DESC, FIELD(examType,$examOptStr) LIMIT 6");
	$arr = array();
	$compSciPresent = 0;
	for ($i=count($results)-1; $i>=0; $i--) {
		if ($results[$i][7]) $compSciPresent = 1;
	}
	for ($i=count($results)-1, $j=0; $i>=0; $i--, $j++) {
		$maxMarks = preg_replace("/.*\((\d+) marks.*/","$1",$results[$i][0]);
		$kannadaMaxMarks = getKannadaMaxMarks($results[$i][8], $results[$i][0]);
		$arr[$j][0] = preg_replace("/ \(.*/","",$results[$i][0]);
		$arr[$j][0] = preg_replace("/Test (\d)/","Test$1",$arr[$j][0]);
		$arr[$j][0] = preg_replace("/ Exam/","",$arr[$j][0]);
		for ($k=$l=1; $compSciPresent && $k<count($results[$i]) || $compSciPresent==0 && $k<count($results[$i])-1; $k++) {
			if ($results[$i][$k]>0) {
				if ($k==1) $max = $kannadaMaxMarks;
				else $max = $maxMarks;
				$arr[$j][$l] = floor(0.5+100*$results[$i][$k]/$max);
				$l++;
			}
		}
	}
	$csvFile = "dataStudentTimePerf-$currtime.csv";

	$subjects = getSubjects($class);
	if ($compSciPresent==0) array_pop($subjects);
	printToFile($csvFile, "quarter,".implode(",",$subjects), getCsvFormat($arr, false));
	echo "<studentTimePerf src='$pathPrefix/$csvFile'></studentTimePerf>\n";

	echo "<script src='$pathPrefix/media/d3/studentPerformance.js'></script>";

	return;
}

?>
