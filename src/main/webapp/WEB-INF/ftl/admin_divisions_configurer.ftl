[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - Divisions manager</title>

[#import "/spring.ftl" as spring /]

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/json.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

<script type='text/javascript'>	
	$(document).ready(function() {
	   
		$('#newCategory').submit(function() {
			var newCategory = $(this).serializeObject();
			$.postJSON("[@spring.url '/admin/category/store' /]", newCategory, function(data) {
				$('#catList > tbody:last').append('<tr><td>'+data.id+'</td><td><a href="#">'+data.title+'</a></td><td><a href=" [@spring.url '/admin/category/delete/'/]'+data.id+' ">Удалить</a></td></tr>');
			});
			return false;				
		});
					
	});		
</script>

</head>
<body>

<a href="[@spring.url '/logout'/]">[@spring.message "label.logout"/]</a>

<h2>[@spring.message "label.title"/]</h2>

<a href="#" class="item-new">New division</a>
<div class="item-new-form">
	<form id="newCategory" method="POST" action="[@spring.url '/#' /]" >
			Division name
			[@spring.formInput "category.title"/]
			<input type="submit" value="Create" />
	</form>
</div>

<h3>Divisions</h3>
	[#if categoryList??]
		<table id="catList">
			<tr>
				<th>ID</th>
				<th>Division name</th>
				<th>&nbsp;</th>
			</tr>
			[#list categoryList as category]
				<tr>
					<td>${category.id}</td>
					<td>
						<a href="#">
							${category.title}
						</a>
					</td>
					<td>
						<a id="catDelete" href=" [@spring.url '/admin/category/delete/${category.id}'/] ">
							Удалить
						</a>
					</td>
				</tr>
			[/#list]
		</table>
	[/#if]
	
<a href="[@spring.url '/admin'/]">На главную админку</a>	

</body>
</html>