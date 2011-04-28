[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - Tender</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

</head>
<body>

<a href="[@spring.url '/admin'/]">[@spring.message "label.homeAdmin"/]</a>

<h2>[@spring.message "label.title"/] :: Edit tender</h2>

<div class="tender-edit-table">
	<table>
		<tr><td>[@spring.message "label.tenderId"/]</td>
			<td>${tender.id}</td>
		</tr>
		<tr><td>[@spring.message "label.tenderTitle"/]</td>
			<td>${tender.title}</td>
		</tr>
		<tr><td>[@spring.message "label.tenderDivision"/]</td>
			<td>${tender.division.title}</td>
		</tr>		
		<tr><td>[@spring.message "label.tenderDate"/]</td>
			<td>${tender.price}</td>
		</tr>
		<tr><td>[@spring.message "label.tenderDocs"/]</td>
			<td><img src="[@spring.url '/image/${tender.id}'/]" /></td>
		</tr>
		<tr><td/>
			<td><a href="#" class="tender-edit-1" />[@spring.message "label.edit"/]</a></td>
		</tr>
		<tr><td/>
			<td><a href="[@spring.url '/admin/tender/delete/${tender.id}' /]">[@spring.message "label.delete"/]</a></td>
		</tr>
	</table>
</div>

<div class="tender-edit-form">
		<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
			<table>
				<tr><td>[@spring.message "label.tenderId"/]</td>
					<td>[@spring.formInput "tender.id", 'readonly="true"'/]</td>
				</tr>
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
					<td>[@spring.message "label.tenderDocs"/]</td>
					<td>[@spring.formInput "tender.image", "", "file"/]</td>
				</tr>
				<tr><td/>
					<td><a href="#" class="tender-edit-2" />Отмена</a></td>
				</tr>
				<tr><td/>
					<td><input type="submit" value="[@spring.message "label.store"/]" /></td>
				</tr>				
			</table>
		</form>
</div>

<a href="[@spring.url '/admin/${tender.division.id}' /]">
	More tenders of this Division
</a>

</body>
</html>