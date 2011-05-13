[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.title"/] -  Save error</title>
<link rel="shortcut icon" href="[@spring.url '/resources/img/favicon.ico'/]" type="image/x-icon" /> 

<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>

<!-- Datepicker -->
<script type='text/javascript' src="[@spring.url '/resources/js/jquery.ui.datepicker.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/jquery.ui.core.min.js'/]" ></script>
<link rel="stylesheet" href="[@spring.url '/resources/css/jquery-ui.custom.css'/]" type="text/css" media="all" />
<script>
	$(function() {
		$( "#publishDate" ).datepicker({ dateFormat: 'dd.mm.yy' });
	});
</script>
<!-- Datepicker -->

</head>
<body>
<div id="wrap">
	<div id="masthead">  
		<h1 class="left admin"><a href="[@spring.url '/admin'/]"><span>InTender Logo</span></a></h1>
	</div>
	
	<div id="error">
		<h3>Ошибка сохранения</h3>
		<div class="products">
			<div class="right">
						<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
                			<h4>
                				[@spring.formInput "tender.title"/]
                				[@spring.showErrors "<br/>"/]
                			</h4>	
                			<div style="display:none;">[@spring.formInput "tender.id"/]</div>						
                			<div style="display:none;">[@spring.formInput "tender.division.id"/]</div>						
                			<div style="display:none;">[@spring.formInput "tender.attachedDocName"/]</div>						
							<table>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
									<td>
										<input 
											value=" [#if tender.publishDate??]${tender.publishDate?string("dd.MM.yyyy")}[/#if]" 
											name="publishDate" 
											id="publishDate" />
										[@spring.showErrors "<br/>"/]
									</td>
								</tr>
								<tr height="80px">
									<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
									<td>
										[@spring.formInput "tender.attachedDoc", "", "file"/]
										[@spring.showErrors "<br/>"/]
									</td>
								</tr>
								<tr><td/>
									<td><input type="submit" value="[@spring.message "label.store"/]" /></td>
								</tr>
							</table>
						</form>
			</div> <!-- right -->	
		</div> <!-- products -->	
	</div>	<!-- error --> 
</div>
</body>

</html>