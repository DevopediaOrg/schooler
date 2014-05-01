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
	//$this->Toolbar->setTitle(l_('CF_CREATE_TABLE'));
	$this->Toolbar->addButton('save', r_('index.php?ext=chronoforms&act=create_table'), l_('CF_SAVE'), $this->Assets->image('save', 'toolbar/'));
	$this->Toolbar->addButton('cancel', r_('index.php?ext=chronoforms'), l_('CF_CANCEL'), $this->Assets->image('cancel', 'toolbar/'), 'link');
?>
<?php
	ob_start();
?>
<script>
	jQuery(document).ready(function($){
		$('.enabled_check').on('click', function(){
			if($(this).prop('checked') == true){
				$(this).closest('tr').addClass('success');
				$(this).closest('tr').removeClass('danger');
			}else{
				$(this).closest('tr').addClass('danger');
				$(this).closest('tr').removeClass('success');
			}
		});
	});
</script>
<?php
	$wizard_jscode = ob_get_clean();
	$doc->addHeaderTag($wizard_jscode);
?>
<div class="row" style="margin-top:20px;">
	<div class="col-md-6">
		<h3><?php echo l_('CF_CREATE_TABLE'); ?></h3>
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
			<form action="<?php echo r_('index.php?ext=chronoforms&act=create_table'); ?>" method="post" name="admin_form" id="admin_form">
				<?php echo $this->Html->formSecStart(); ?>
				<?php echo $this->Html->formLine('table_name', array('type' => 'text', 'label' => 'Table Name', 'value' => $table_name, 'class' => 'XXL', 'sublabel' => 'The name of the table to be created, it should not contain any spaces.')); ?>
				<?php echo $this->Html->formSecEnd(); ?>
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th><?php echo l_('Field title'); ?></th>
							<th><?php echo l_('Enable'); ?></th>
							<th><?php echo l_('Type'); ?></th>
							<th><?php echo l_('Length'); ?></th>
							<th><?php echo l_('Primary'); ?></th>
							<th><?php echo l_('Default'); ?></th>
							<th><?php echo l_('Extra'); ?></th>
							<th><?php echo l_('Null'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$count = count($names);
						for($i = 0; $i <= ($count+20); $i++):
						?>
						<tr class="<?php echo isset($names[$i]) ? 'success' : 'danger'; ?>">
							<td><?php echo $this->Html->input('columns['.$i.'][name]', array('type' => 'text', 'sublabel' => 'Title', 'value' => isset($names[$i]) ? str_replace('[]', '', $names[$i]) : '')); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][enabled]', array('type' => 'checkbox', 'sublabel' => 'Enabled', 'class' => 'enabled_check', 'value' => 1, 'checked' => isset($names[$i]) ? 1 : 0)); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][type]', array('type' => 'text', 'sublabel' => 'Type', 'value' => 'VARCHAR')); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][length]', array('type' => 'text', 'sublabel' => 'Length', 'value' => '255', 'class' => 'SS')); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][pkey]', array('type' => 'checkbox', 'sublabel' => 'PKey', 'value' => 1)); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][default]', array('type' => 'text', 'sublabel' => 'Default', 'value' => '')); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][extra]', array('type' => 'text', 'sublabel' => 'Extra', 'value' => '')); ?></td>
							<td><?php echo $this->Html->input('columns['.$i.'][null]', array('type' => 'checkbox', 'sublabel' => 'Null', 'value' => 1)); ?></td>
						</tr>
						<?php endfor; ?>
					</tbody>
				</table>
				<?php
					/*$count = count($names);
					for($i = 0; $i <= ($count+20); $i++){
						echo $this->Html->formLine('columns['.$i.']', array('type' => 'multi', 'layout' => 'wide', 'inputs' => array(
							array('name' => 'columns['.$i.'][name]', 'type' => 'text', 'sublabel' => 'Title', 'value' => isset($names[$i]) ? str_replace('[]', '', $names[$i]) : ''),
							array('name' => 'columns['.$i.'][enabled]', 'type' => 'checkbox', 'sublabel' => 'Enabled', 'value' => 1, 'checked' => isset($names[$i]) ? 1 : 0),
							array('name' => 'columns['.$i.'][type]', 'type' => 'text', 'sublabel' => 'Type', 'value' => 'VARCHAR'),
							array('name' => 'columns['.$i.'][length]', 'type' => 'text', 'sublabel' => 'Length', 'value' => '255'),
							array('name' => 'columns['.$i.'][pkey]', 'type' => 'checkbox', 'sublabel' => 'PKey', 'value' => 1),
							array('name' => 'columns['.$i.'][default]', 'type' => 'text', 'sublabel' => 'Default', 'value' => ''),
							array('name' => 'columns['.$i.'][extra]', 'type' => 'text', 'sublabel' => 'Extra', 'value' => ''),
							array('name' => 'columns['.$i.'][null]', 'type' => 'checkbox', 'sublabel' => 'Null', 'value' => 1),
						)));
					}*/
				?>
			</form>
		</div>
	</div>
</div>
</div>
</div>