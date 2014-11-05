<?php
//=======================================================
// PDF Report Generation
//-------------------------------------------------------
// Logo that appears at the top left of PDF report
// Set as blank if logo is not required
$leftPdfLogo = 'images/schoolerLogo.png';

// Logo that appears at the top right of PDF report
// Set as blank if logo is not required
$rightPdfLogo = 'images/readingBoy.jpg';

// Title (of organization) to show on top of PDF report
// You can use spaces to center the title on the page
$pdfTitle = '';
		
// Address (of organization) to show on top of PDF report
// You can use spaces to center the address on the page
$pdfAddress = '';


//=======================================================
// MySQL Data Backup
//-------------------------------------------------------
// CAUTION: Currently commented out in templates/yoo_master2/warp.php
// This should be a remote FTP server
// No backup will be done if this is blank
$backupServer = '';

// FTP user name and password to login to FTP server
$ftpUser = '';
$ftpPwd = '';
