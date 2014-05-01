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

	$doc->_('forms');
	//$this->Toolbar->setTitle(l_('CF_SHOW_DATA_TITLE'));
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms&act=list_data&table='.$this->data['table'].'&form_id='.$this->data['form_id']), l_('CF_CANCEL'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<div class="row" style="margin-top:20px;">
	<div class="col-md-6">
		<h3><?php echo l_('CF_SHOW_DATA_TITLE'); ?></h3>
	</div>
	<div class="col-md-6 pull-right text-right">
		<?php
			echo $this->Toolbar->renderBar();
		?>
	</div>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-body">
			<form action="<?php echo r_('index.php?ext=chronoforms&act=list_data&table='.$this->data['table']); ?>" method="post" name="admin_form" id="admin_form">
				<table class="table">
				<?php
					/*foreach($fields as $field){
						echo "<tr>";
						echo "<td>".$field."</td>";
						echo "<td>".$row['ListData'][$field]."</td>";
						echo "</tr>";
					}*/
					echo \GCore\Helpers\Html::formStart();
					echo \GCore\Helpers\Html::formSecStart();
					foreach($fields as $field){
						echo \GCore\Helpers\Html::formLine($field, array('type' => 'custom', 'label' => $field, 'code' => $row['ListData'][$field]));
					}
					echo \GCore\Helpers\Html::formSecEnd();
					echo \GCore\Helpers\Html::formEnd();
				?>
				</table>
			</form>
		</div>
	</div>
</div>
</div>
</div>