<?php
/* @copyright:ChronoEngine.com @license:GPLv2 */defined('_JEXEC') or die('Restricted access');
defined("GCORE_SITE") or die;
?>
<div class="chrono-page-container">
<div class="container" style="width:100%;">
<?php
	$doc = \GCore\Libs\Document::getInstance();
	$doc->_('datatable');
	$doc->_('jquery');
	//$doc->_('jquery-ui');
	$doc->_('bootstrap');

	//$this->Toolbar->setTitle(l_('CF_LIST_DATA_TITLE'));
	$this->Toolbar->addButton('remove', r_('index.php?ext=chronoforms&act=delete_data&table='.$this->data['table']), l_('CF_DELETE'), $this->Assets->image('remove', 'toolbar/'), 'submit_selectors');
	$this->Toolbar->addButton('backup', r_('index.php?ext=chronoforms&act=backup_data&table='.$this->data['table']), l_('CF_BACKUP_TABLE'), \GCore\C::get('GCORE_ADMIN_URL').'extensions/chronoforms/assets/images/backup.png', 'link');
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms'), l_('CF_CANCEL'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<div class="row">
	<form action="<?php echo r_('index.php?ext=chronoforms&act=list_data&table='.$this->data['table']); ?>" method="post" name="admin_form" id="admin_form">
		<?php
			echo $this->DataTable->headerPanel($this->DataTable->_l('<h4>'.l_('CF_LIST_DATA_TITLE').'</h4>').$this->DataTable->_r($this->Toolbar->renderBar()));
			$this->DataTable->create();
			
			$columns = array('created' => l_('CF_CREATED'), 'id' => l_('CF_ID'));
			if(!empty($form['Form']['extras']['db_fields_list'][$this->data['table']])){
				$columns = \GCore\Libs\Str::list_to_array($form['Form']['extras']['db_fields_list'][$this->data['table']]);
			}
			$listing_header = array();
			foreach($columns as $column => $title){
				$listing_header['ListData.'.$column] = $this->Sorter->link($title, 'ListData.'.$column);
			}
			$this->DataTable->header(
				array_merge(array('CHECK' => $this->Toolbar->selectAll()), $listing_header)
			);
			
			$listing_row = array();
			$count = 0;
			foreach($columns as $column => $title){
				$listing_row['ListData.'.$column] = array('style' => array('width' => '15%'));
				if(empty($count)){
					$listing_row['ListData.'.$column]['link'] = r_('index.php?ext=chronoforms&act=show_data&table='.$this->data['table'].'&id={ListData.id}'.'&form_id='.$this->data['form_id']);
				}
				$count++;
			}
			$this->DataTable->cells($rows, array_merge(array(
				'CHECK' => array(
					'style' => array('width' => '5%'),
					'html' => $this->Toolbar->selector('{ListData.id}')
				)), $listing_row)
			);
			echo $this->DataTable->build();
			echo $this->DataTable->footerPanel($this->DataTable->_l($this->Paginator->getInfo()).$this->DataTable->_r($this->Paginator->getNav()));
			echo $this->DataTable->footerPanel($this->DataTable->_r($this->Paginator->getList()));
		?>
	</form>
</div>
</div>
</div>