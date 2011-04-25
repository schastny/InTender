<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SpringCart - Category</title>

<#import "/spring.ftl" as spring />

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

</head>
<body>

<a href=" <@spring.url '/admin' /> ">
	На главную админки
</a>

<h2>SpringCart - категория</h2>

<a href="#" class="item-new">Добавить товар в категорию</a>
<div class="item-new-form">
	<#include "/tiles/adminNewItemForm.ftl">
</div>

<h3>Товары</h3>
<#include "/tiles/adminItemsTable.ftl">

</body>
</html>