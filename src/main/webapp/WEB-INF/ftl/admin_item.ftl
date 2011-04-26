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

<a href=" <@spring.url '/admin' /> ">
	На главную
</a>

<h2>SpringCart - Товар</h2>

<h3>Товар детально</h3>
<a href="<@spring.url '/admin/shop/${item.division.id}' />">
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
		<tr><td/>
			<td><a href="#" class="item-edit-1" />Редактировать</a></td>
		</tr>
		<tr><td/>
			<td><a href="<@spring.url '/admin/item/delete/${item.id}' />">Удалить</a></td>
		</tr>
	</table>
</div>

<div class="item-edit-form">
		<form method="POST" action="<@spring.url '/admin/item/store' />" enctype="multipart/form-data">
			<table>
				<tr><td>Артикул</td>
					<td><@spring.formInput "item.id", 'readonly="true"'/></td>
				</tr>
				<tr>
					<td>Наименование</td>
					<td><@spring.formInput "item.title"/></td>
				</tr>
				<tr>
					<td>Категория</td>
					<td><@spring.formSingleSelect "item.division.id", categoryMap/></td>
				</tr>
				<tr>
					<td>Цена</td>
					<td><@spring.formInput "item.price"/></td>
				</tr>
				<tr>
					<td>Изображение</td>
					<td><@spring.formInput "item.image", "", "file"/></td>
				</tr>
				<tr><td/>
					<td><a href="#" class="item-edit-2" />Отмена</a></td>
				</tr>
				<tr><td/>
					<td><input type="submit" value="Сохранить" /></td>
				</tr>				
			</table>
		</form>
</div>

</body>
</html>