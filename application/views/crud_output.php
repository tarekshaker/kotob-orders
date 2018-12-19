<?php
foreach ($crud_output->css_files as $file): ?>
	<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>"/>
<?php endforeach; ?>
<?php foreach ($crud_output->js_files as $file): ?>
	<script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>


		<h1 style="text-align: center;"><?php echo $page_title; ?></h1>


		<div id="crud_output" style="font-size: 12px;">
			<?php echo $crud_output->output; ?>
		</div>


</div>
