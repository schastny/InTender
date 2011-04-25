<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>SpringCart</title>

<#import "/spring.ftl" as spring />

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

</head>
<body>

<a href="<@spring.url '/logout'/>">Выйти из приложения</a>

<h2>SpringCart</h2>

<h3>Товары</h3>
<#include "/tiles/itemsTable.ftl">

<a href="<@spring.url '/admin'/>">Админ раздел</a>

</body>
</html>