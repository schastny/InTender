<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>SpringCart</title>

<#import "/spring.ftl" as spring />

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

</head>
<body>

<a href="<@spring.url '/logout'/>">Выйти из приложения</a>

<h2>SpringCart :: Admin panel</h2>

<a href="#" class="item-new">Добавить товар</a>
<div class="item-new-form">
	<#include "/tiles/adminNewItemForm.ftl">
</div>

<h3>Товары</h3>
<#include "/tiles/adminItemsTable.ftl">

<a href="<@spring.url '/admin/category'/>">Управление категориями</a>

</body>
</html>