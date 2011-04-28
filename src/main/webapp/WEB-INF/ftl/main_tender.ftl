[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - tenders for products and services for the business</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

</head>
<body>

<a href="[@spring.url '/index'/]">[@spring.message "label.home"/]</a>

<h2>[@spring.message "label.title"/] - Tender Detailed</h2>

<div class="item-edit-table">
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
	</table>
</div>

<a href="[@spring.url '/tenders/${tender.division.id}' /]">
	More tenders of this Division
</a>

</body>
</html>