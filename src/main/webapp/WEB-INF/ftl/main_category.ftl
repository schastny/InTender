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

<h2>[@spring.message "label.title"/] - Division</h2>

<h3>Товары</h3>
[#include "/tiles/tendersTable.ftl"]

</body>
</html>