[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - Save error</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

</head>
<body>

<a href=" [@spring.url '/admin' /] ">
	На главную админ панели
</a>

<h2>Ошибка сохранения товара</h2>

<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
	<table>
		<tr>
			<td>Наименование</td>
			<td>[@spring.formInput "tender.title"/]
			[@spring.showErrors "<br/>"/]</td>
		</tr>
		<tr>
			<td>Категория</td>
			<td>[@spring.formInput "tender.division.id"/]
			[@spring.showErrors "<br/>"/]</td>
		</tr>
		<tr>
			<td>Цена</td>
			<td>[@spring.formInput "tender.price"/]
			[@spring.showErrors "<br/>"/]</td>
		</tr>
		<tr>
			<td>Изображение (jpg, png)</td>
			<td>[@spring.formInput "tender.image", "", "file"/]</td>
			[@spring.showErrors "<br/>"/]</td>
		</tr>		
		<tr>
			<td/>
			<td><input type="submit" value="Добавить" /></td>
		</tr>
	</table>
</form>

</body>
</html>