<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SpringCart - Category</title>

<#import "/spring.ftl" as spring />

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

</head>
<body>

<a href=" <@spring.url '/index' /> ">
	На главную
</a>

<h2>SpringCart - категория</h2>

<h3>Товары</h3>
<#include "/tiles/itemsTable.ftl">

</body>
</html>