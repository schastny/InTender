[#ftl]
[#if tenderList??]
	<table>
		<tr>
			<th>[@spring.message "label.tenderId"/]</th>
			<th>[@spring.message "label.tenderTitle"/]</th>
			<th>[@spring.message "label.tenderDivision"/]</th>
			<th>[@spring.message "label.tenderDate"/]</th>
			<th>[@spring.message "label.tenderDocs"/]</th>
			<th>&nbsp;</th>
		</tr>
		[#list tenderList as tender]
			<tr>
				<td>${tender.id}</td>
				<td>
					<a href=" [@spring.url '/admin/${tender.division.id}/${tender.id}'/] ">
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