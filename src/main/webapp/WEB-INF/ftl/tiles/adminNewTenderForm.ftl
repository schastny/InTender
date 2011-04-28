<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
	<table>
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
			<td>Изображение (jpg, png, gif)</td>
			<td>[@spring.formInput "tender.image", "", "file"/]></td>
		</tr>
		<tr>
			<td/>
			<td><input type="submit" value="Добавить" /></td>
		</tr>
	</table>
</form>