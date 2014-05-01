<?php

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

/* Source: http://davidwalsh.name/backup-mysql-database-php
 backup the db OR just a table */
function backup_tables($host,$user,$pass,$name,$file,$tables = '*')
{

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

?>