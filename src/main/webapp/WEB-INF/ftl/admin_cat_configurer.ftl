<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>SpringCart - управление категориями</title>

<#import "/spring.ftl" as spring />

<script type='text/javascript' src="<@spring.url '/resources/js/jquery.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/json.min.js'/>" ></script>
<script type='text/javascript' src="<@spring.url '/resources/js/slider.js'/>" ></script>
<link rel="stylesheet" href="<@spring.url '/resources/css/main.css'/>" type="text/css" media="all" />

<script type='text/javascript'>	
	$(document).ready(function() {
	   
		$('#newCategory').submit(function() {
			var newCategory = $(this).serializeObject();
			$.postJSON("<@spring.url '/admin/category/store' />", newCategory, function(data) {
				$('#catList > tbody:last').append('<tr><td>'+data.id+'</td><td><a href="#">'+data.title+'</a></td><td><a href=" <@spring.url '/admin/category/delete/'/>'+data.id+' ">Удалить</a></td></tr>');
			});
			return false;				
		});
					
	});		
</script>

</head>
<body>

<a href="<@spring.url '/logout'/>">Выйти из приложения</a>

<h2>SpringCart</h2>

<a href="#" class="item-new">Новая категория</a>
<div class="item-new-form">
	<form id="newCategory" method="POST" action="<@spring.url '/#' />" >
			Название категории
			<@spring.formInput "category.title"/>
			<input type="submit" value="Добавить" />
	</form>
</div>

<h3>Категории</h3>
	<#if categoryList??>
		<table id="catList">
			<tr>
				<th>ID</th>
				<th>Название категории</th>
				<th>&nbsp;</th>
			</tr>
			<#list categoryList as category>
				<tr>
					<td>${category.id}</td>
					<td>
						<a href="#">
							${category.title}
						</a>
					</td>
					<td>
						<a id="catDelete" href=" <@spring.url '/admin/category/delete/${category.id}'/> ">
							Удалить
						</a>
					</td>
				</tr>
			</#list>
		</table>
	</#if>
	
<a href="<@spring.url '/admin'/>">На главную админку</a>	

</body>
</html>