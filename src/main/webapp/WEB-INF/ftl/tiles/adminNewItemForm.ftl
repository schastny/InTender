<form method="POST" action="<@spring.url '/admin/item/store' />" enctype="multipart/form-data">
	<table>
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
			<td>Изображение (jpg, png, gif)</td>
			<td><@spring.formInput "item.image", "", "file"/></td>
		</tr>
		<tr>
			<td/>
			<td><input type="submit" value="Добавить" /></td>
		</tr>
	</table>
</form>