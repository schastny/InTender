[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>SpringCart - Tender</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

</head>
<body>

<a href=" [@spring.url '/admin' /] ">
	На главную
</a>

<h2>SpringCart - Товар</h2>

<h3>Товар детально</h3>
<a href="[@spring.url '/admin/shop/${tender.division.id}' /]">
	Товары в категории
</a>

<div class="tender-edit-table">
	<table>
		<tr><td>Артикул</td>
			<td>${tender.id}</td>
		</tr>
		<tr><td>Наименование</td>
			<td>${tender.title}</td>
		</tr>
		<tr><td>Категория</td>
			<td>${tender.division.title}</td>
		</tr>		
		<tr><td>Цена</td>
			<td>${tender.price}</td>
		</tr>
		<tr><td></td>
			<td><img src="[@spring.url '/image/${tender.id}'/]" /></td>
		</tr>
		<tr><td/>
			<td><a href="#" class="tender-edit-1" />Редактировать</a></td>
		</tr>
		<tr><td/>
			<td><a href="[@spring.url '/admin/tender/delete/${tender.id}' /]">Удалить</a></td>
		</tr>
	</table>
</div>

<div class="tender-edit-form">
		<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
			<table>
				<tr><td>Артикул</td>
					<td>[@spring.formInput "tender.id", 'readonly="true"'/]</td>
				</tr>
				<tr>
					<td>Наименование</td>
					<td>[@spring.formInput "tender.title"/]</td>
				</tr>
				<tr>
					<td>Категория</td>
					<td>[@spring.formSingleSelect "tender.division.id", divisionMap/]</td>
				</tr>
				<tr>
					<td>Цена</td>
					<td>[@spring.formInput "tender.price"/]</td>
				</tr>
				<tr>
					<td>Изображение</td>
					<td>[@spring.formInput "tender.image", "", "file"/]</td>
				</tr>
				<tr><td/>
					<td><a href="#" class="tender-edit-2" />Отмена</a></td>
				</tr>
				<tr><td/>
					<td><input type="submit" value="Сохранить" /></td>
				</tr>				
			</table>
		</form>
</div>

</body>
</html>