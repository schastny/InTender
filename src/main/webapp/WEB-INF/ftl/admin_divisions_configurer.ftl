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
				$('#divList').append('<li><a href="#">'+data.title+'</a></li>');
			});
			return false;				
		});
					
	});		
</script>

</head>
<body>

<a href="[@spring.url '/admin'/]">[@spring.message "label.homeAdmin"/]</a>

<h2>[@spring.message "label.title"/] :: Manage divisions</h2>

<a href="#" class="division-new">New division</a>
<div class="division-new-form">
	<form id="newDivision" method="POST" action="[@spring.url '/#' /]" >
		<table>
			<tr>
				<td>Division name</td>
				<td>[@spring.formInput "division.title"/]</td>
			</tr>
			<tr>
				<td>Description</td>
				<td>[@spring.formInput "division.description"/]</td>
			</tr>
			<tr>
				<td/>
				<td><input type="submit" value="Create" /></td>
			</tr>
		</table>
	</form>
</div>

[#if divisionList??]
	<ul id="divList">
	[#list divisionList as division]
		<li>
			<a href="#">
				${division.title}
			</a>
		</li>
	[/#list]
	</ul>
[/#if]
	
</body>
</html>