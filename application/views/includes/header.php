<!DOCTYPE HTML>

<html>
<head>
	<title>مكتبة كتب</title>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<!--[if lte IE 8]>
	<script src="<?php echo base_url();?>assets/js/ie/html5shiv.js"></script><![endif]-->

	<!--[if lte IE 9]>
	<link rel="stylesheet" href="<?php echo base_url();?>assets/css/ie9.css"/><![endif]-->
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="<?php echo base_url();?>assets/css/ie8.css"/><![endif]-->

	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/jquery-ui.css">
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/main.css">

	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.min.css">


	<script src="<?php echo base_url(); ?>assets/js/jquery.min.js"></script>
	<script src="<?php echo base_url(); ?>assets/js/jquery-ui.js"></script>

	<script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
	<script src="<?php echo base_url(); ?>assets/js/datepicker-ar.js"></script>


</head>


<body dir="rtl">


<div class="container-fluid">


<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<img src="<?php echo base_url();?>assets/imgs/logo.png" width="30" height="30" alt="">

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="delivery_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					الأوردرات
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="nav-link" href="<?php echo base_url()?>">كل الأوردرات</a>
					<a class="nav-link" href="<?php echo base_url()?>order/kotob_orders">أوردرات المكتبة</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="delivery_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					ادارة التوصيل
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="nav-link" href="<?php echo base_url()?>delivery">التوصيل</a>
					<a class="nav-link" href="<?php echo base_url()?>areas">المناطق</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="employees_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					ادارة الموظفين
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
<!--					 <a class="nav-link" href="--><?php //echo base_url()?><!--employees">الموظفين</a>-->
					<a class="nav-link" href="<?php echo base_url()?>attendance">الحضور والانصراف</a>
				</div>
			</li>


		</ul>
	</div>
</nav>






