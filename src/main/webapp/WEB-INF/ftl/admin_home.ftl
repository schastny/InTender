[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/]</title>

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

</head>
<body>

<a href="[@spring.url '/logout'/]">[@spring.message "label.logout"/]</a>

<h2>[@spring.message "label.title"/] :: Admin panel</h2>

<a href="#" class="item-new">Добавить товар</a>
<div class="item-new-form">
	[#include "/tiles/adminNewItemForm.ftl"]
</div>

<h3>[@spring.message "label.tenders"/]</h3>
[#include "/tiles/adminItemsTable.ftl"]

<a href="[@spring.url '/admin/divisions'/]">Manage divisions</a>

</body>
</html>