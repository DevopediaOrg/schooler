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
    return getQueryResult($db,$resultType);
}

function getTableData($tablename, $fields='*', $match=1, $resultType=2)
{
	$db = JFactory::getDBO();
    $query = "SELECT $fields FROM $tablename WHERE $match";
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
	if (isset($_REQUEST['id'])) { // editing a record
		$id = $_REQUEST['id'];
	}
	else { // adding a new record
		$id = getTableData("#__$formname", "id", "1 ORDER BY created DESC LIMIT 1", 0);
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
	$urlpath = 'components'.DS.'com_chronoforms5'.DS.'chronoforms'.DS.'uploads'.DS.'studentForm';
	$photos = scandir(JPATH_BASE.DS.$urlpath);
	return $photos;
}

function findPhoto($id)
{ // we need to search the folder to know the extension: use latest if multiple extensions exist
	$urlpath = 'components'.DS.'com_chronoforms5'.DS.'chronoforms'.DS.'uploads'.DS.'studentForm';
	$photos = readPhotoDir();
	$currPhotos = array(); // only for debugging
	$latestModTime = 0; $latestPhoto = '';
	foreach ($photos as $photo) {
		if (preg_match("/^Photo-$id\./",$photo)) {
			$modTime = filemtime(JPATH_BASE.DS.$urlpath.DS.$photo);
			if ($modTime > $latestModTime) {
				$latestModTime = $modTime;
				$latestPhoto = $urlpath.DS.$photo;
			}
			array_push($currPhotos, $photo); // only for debugging
		}
	}
	// return implode("/",$currPhotos); // only for debugging
	
	if ($latestPhoto=='') { // if not found, use default.
		$sex = getTableData("#__studentform", "sex", "id=$id", 0);
		if ($sex=='Male') {
			$latestPhoto = $urlpath.DS."boy.jpg";
		}
		else {
			$latestPhoto = $urlpath.DS."girl.jpg";
		}
	}
	
	return $latestPhoto;
}

function msgPostFormSubmit($linkType)
{ // To be called only after the form is saved in DB
	if ($linkType=='grades') {
		$aliasname = 'view-grades';
		$formname = 'gradesform';
	}
	else {
		$aliasname = 'view-list';
		$formname = 'studentform';
	}
	
	$id = getRecordId($formname);
	$itemLink = preg_replace("/(view-list|view-grades|add-student|add-grades)[?]?.*$/","$aliasname?id=$id",$_SERVER['REQUEST_URI'],1);
	
	echo "<div style='font-size:1.5em;line-height:1.5em'>Details have been saved.<br>";
	echo "You may wish to <a href='$itemLink'>review them</a>.</div>";
}

function getPhotoCode($id)
{
	$photo = preg_replace("/index\.php.*/","",$_SERVER['REQUEST_URI']).findPhoto($id);
	return "<img class=studentPhoto src='$photo' alt='Photo'/>";
}

function showStudent($id)
{
	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Viewing Student Details</h2></td>";
	$user = JFactory::getUser();
	if (!$user->guest) echo "<td style='text-align:right'><b><a href='".
	                        preg_replace("/view-list/","add-student",$_SERVER['REQUEST_URI']).
	                        "'>Edit</a></b></td>";
	else "<td>&nbsp;</td>";
	echo "</tr></table>";

	$result = getTableData("#__studentform",
							 "name,dateOfBirth,age,sex,admissionNumber,studentUid,class,`group`,parent,guardian,sponsor",
							 "id='$id'",
							 1);

	$headings = array('Name','Date of Birth','Age','Sex','Admission No.','Student ID','Class','Group','Parent','Guardian','Sponsor');
	echo "<table class=studentView>";
	for ($i=0; $i<count($headings); $i++) {
		if ($i==0) { // first cell is for photo
			echo "<tr><td style='border:0px; vertical-align:top; width:256px' rowspan='"
				.count($headings)."'>".getPhotoCode($id)."</td><th>"
				.$headings[$i]."</th><td>$result[$i]</td></tr>";	
		}
		else {
			echo "<tr><th>".$headings[$i]."</th><td>$result[$i]</td></tr>";	
		}
	}
	echo "</table>";
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

function showStudentList()
{
	if (isset($_REQUEST['id'])) {
		showStudent($_REQUEST['id']);
		return;
	}


	echo "<table class=studentPageTitle><tr>";
	echo "<td><h2>Listing All Students</h2></td>";
	echo "</tr></table>";
	
	$allPhotoStr = '/'.implode('/',readPhotoDir()).'/';
	$itemLink = preg_replace("/view-list\??.*/","view-list",$_SERVER['REQUEST_URI']);
	$columnHeadings = array('Photo','Student ID','Admission No.','Name','Class','Group','Sex','Parent','Guardian','Sponsor');
	$students = getTableData("#__studentform",
							 "id,studentUid,admissionNumber,name,class,`group`,sex,parent,guardian,sponsor",
							 "1 ORDER BY name ASC"
				);
	echo "<table class=studentList>";
	echo "<tr>";
	foreach ($columnHeadings as $colHead) {
		echo "<th>$colHead</th>";	
	}
	echo "</tr>";
	foreach ($students as $student) {
		$id = $student[0];
		echo "<tr>";
		if (preg_match("/\/Photo-$id\.(png|gif|jpg|jpeg)\//",$allPhotoStr)) {
			$imgHtml = preg_replace("/<img /","<img style='width:64px' ",getPhotoCode($id));
			echo "<td>$imgHtml</td>";
		}
		else echo "<td>&nbsp;</td>";
		for ($i=1; $i<count($student); $i++) { // ignore id
			if ($i==3) { // have link for name
				echo "<td><a href='$itemLink?id=$id'>".$student[$i]."</td>"; 
			}
			else echo "<td>".$student[$i]."</td>";	
		}
		echo "</tr>";
	}
	echo "</table>";
}


?>
