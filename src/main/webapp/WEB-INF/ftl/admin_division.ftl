[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - Divisions</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

</head>
<body>

<a href=" [@spring.url '/admin' /] ">
	На главную админки
</a>

<h2>SpringCart - категория</h2>

<a href="#" class="tender-new">Добавить товар в категорию</a>
<div class="tender-new-form">
	[#include "/tiles/adminNewTenderForm.ftl"]
</div>

<h3>Товары</h3>
[#include "/tiles/adminTendersTable.ftl"]

</body>
</html>