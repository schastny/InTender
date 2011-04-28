[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - Division</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

</head>
<body>

<a href="[@spring.url '/admin'/]">[@spring.message "label.homeAdmin"/]</a>

<h2>[@spring.message "label.title"/] :: Division</h2>

<a href="#" class="tender-new">New tender for this Division</a>
<div class="tender-new-form">
	[#include "/tiles/adminNewTenderForm.ftl"]
</div>

<h3>Товары</h3>
[#include "/tiles/adminTendersTable.ftl"]

</body>
</html>