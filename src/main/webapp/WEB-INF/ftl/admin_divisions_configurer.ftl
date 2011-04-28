[#ftl]
[#import "spring.ftl" as spring]
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>[@spring.message "label.title"/] - Divisions manager</title>

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/json.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />

<script type='text/javascript'>	
	$(document).ready(function() {
	   
		$('#newDivision').submit(function() {
			var newDivision = $(this).serializeObject();
			$.postJSON("[@spring.url '/admin/divisions/store' /]", newDivision, function(data) {
				$('#divList > tbody:last').append('<tr><td>'+data.id+'</td><td><a href="#">'+data.title+'</a></td><td><a href=" [@spring.url '/admin/divisions/delete/'/]'+data.id+' ">Удалить</a></td></tr>');
			});
			return false;				
		});
					
	});		
</script>

</head>
<body>

<a href="[@spring.url '/logout'/]">[@spring.message "label.logout"/]</a>

<h2>[@spring.message "label.title"/]</h2>

<a href="#" class="division-new">New division</a>
<div class="division-new-form">
	<form id="newDivision" method="POST" action="[@spring.url '/#' /]" >
			Division name
			[@spring.formInput "division.title"/]
			<input type="submit" value="Create" />
	</form>
</div>

<h3>Divisions</h3>
	[#if divisionList??]
		<table id="divList">
			<tr>
				<th>ID</th>
				<th>Division name</th>
				<th>&nbsp;</th>
			</tr>
			[#list divisionList as division]
				<tr>
					<td>${division.id}</td>
					<td>
						<a href="#">
							${division.title}
						</a>
					</td>
					<td>
						<a id="divDelete" href=" [@spring.url '/admin/divisions/delete/${division.id}'/] ">
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