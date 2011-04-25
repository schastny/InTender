<#if itemList??>
	<table>
		<tr>
			<th>Артикул</th>
			<th>Наименование</th>
			<th>Категория</th>
			<th>Цена</th>
			<th>Изображение</th>
			<th>&nbsp;</th>
		</tr>
		<#list itemList as item>
			<tr>
				<td>${item.id}</td>
				<td>
					<a href=" <@spring.url '/admin/shop/${item.category.id}/${item.id}'/> ">
						${item.title}
					</a>
				</td>
				<td>${item.category.title}</td>
				<td>${item.price}</td>
				<td><img src="<@spring.url '/image/${item.id}'/>" width="100px"/></td>
				<td>
					<a href=" <@spring.url '/admin/item/delete/${item.id}'/> ">
						Удалить
					</a>
				</td>
			</tr>
		</#list>
	</table>
</#if>