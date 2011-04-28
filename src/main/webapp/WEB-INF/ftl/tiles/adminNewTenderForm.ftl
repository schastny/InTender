[#ftl]
<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
	<table>
		<tr>
			<td>[@spring.message "label.tenderTitle"/]</td>
			<td>[@spring.formInput "tender.title"/]</td>
		</tr>
		<tr>
			<td>[@spring.message "label.tenderDivision"/]</td>
			<td>[@spring.formSingleSelect "tender.division.id", divisionMap/]</td>
		</tr>
		<tr>
			<td>[@spring.message "label.tenderDate"/]</td>
			<td>[@spring.formInput "tender.price"/]</td>
		</tr>
		<tr>
			<td>[@spring.message "label.tenderDocs"/] (jpg, png, gif)</td>
			<td>[@spring.formInput "tender.image", "", "file"/]</td>
		</tr>
		<tr>
			<td/>
			<td><input type="submit" value="Добавить" /></td>
		</tr>
	</table>
</form>