[#ftl]
[#if tenderList??]
	<table>
		<tr>
			<th>Артикул</th>
			<th>Наименование</th>
			<th>Категория</th>
			<th>Цена</th>
			<th>Изображение</th>
			<th>&nbsp;</th>
		</tr>
		[#list tenderList as tender]
			<tr>
				<td>${tender.id}</td>
				<td>
					<a href=" [@spring.url '/admin/shop/${tender.division.id}/${tender.id}'/] ">
						${tender.title}
					</a>
				</td>
				<td>${tender.division.title}</td>
				<td>${tender.price}</td>
				<td><img src="[@spring.url '/image/${tender.id}'/]" width="100px"/></td>
				<td>
					<a href=" [@spring.url '/admin/tender/delete/${tender.id}'/] ">
						Удалить
					</a>
				</td>
			</tr>
		[/#list]
	</table>
[/#if]