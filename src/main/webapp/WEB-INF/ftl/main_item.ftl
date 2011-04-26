<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SpringCart - Item</title>

<#import "/spring.ftl" as spring />

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

</head>
<body>

<a href=" <@spring.url '/index' /> ">
	На главную
</a>

<h2>SpringCart - Товар</h2>

<h3>Товар детально</h3>
<a href="<@spring.url '/shop/${item.division.id}' />">
	Товары в категории
</a>

<div class="item-edit-table">
	<table>
		<tr><td>Артикул</td>
			<td>${item.id}</td>
		</tr>
		<tr><td>Наименование</td>
			<td>${item.title}</td>
		</tr>
		<tr><td>Категория</td>
			<td>${item.division.title}</td>
		</tr>		
		<tr><td>Цена</td>
			<td>${item.price}</td>
		</tr>
		<tr><td></td>
			<td><img src="<@spring.url '/image/${item.id}'/>" /></td>
		</tr>
	</table>
</div>

</body>
</html>