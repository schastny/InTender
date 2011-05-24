[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.admin.title"/] - [#if division??]${division.title}[/#if]</title>
<link rel="shortcut icon" href="[@spring.url '/resources/img/favicon.ico'/]" type="image/x-icon" /> 

<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>

<!-- jquery.wysiwyg.js -->
	<link rel="stylesheet" href="[@spring.url '/resources/css/jquery.wysiwyg.css'/]" type="text/css" media="all" />
	
	<script type="text/javascript" src="[@spring.url '/resources/js/jquery.wysiwyg.js'/]"></script>
	<script type="text/javascript" src="[@spring.url '/resources/js/controls/wysiwyg.image.js'/]"></script>
	<script type="text/javascript" src="[@spring.url '/resources/js/controls/wysiwyg.link.js'/]"></script>
	<script type="text/javascript" src="[@spring.url '/resources/js/controls/wysiwyg.table.js'/]"></script>

	<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			$('#description').wysiwyg();
		});
	})(jQuery);
	</script>
<!-- jquery.wysiwyg.js -->

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
    [#include "/tiles/main_login_form.ftl"]
  </div>
  [#include "/tiles/admin_top_menu.ftl"]
  <div id="mastcontent" class="twocols">
    <div class="left sidebar">
		[#include "/tiles/admin_division_menu.ftl"]
    </div>
    <div class="right content">
      <div class="twocols">
          <h3>[#if division??]${division.title}[/#if]</h3>
          <div class="products">
              <div class="right">
              	[#if tenderList?size > 0]
              	<h4>[@spring.message "label.allTenders"/]</h4>
	              	<ul>
	                	[#list tenderList as tender]
							<li>
								<span class="bold">
									${tender.publishDate?string("dd.MM.yyyy")} 
								</span>
								<a href=" [@spring.url '/admin/${tender.division.id}/${tender.id}'/] ">
									${tender.title}
								</a>
							</li>
						[/#list]
	                </ul>
                [/#if]
              </div>
              <div class="right">
              	<div class="tender-edit-table"> <!-- edit-division-table -->
                <h4>[@spring.message "label.generalInformation"/]
				<a class="tender-edit-1" href="#" title="Edit division">
					<img src="[@spring.url '/resources/img/btn-edit.png'/]" alt="Edit division">
				</a> 
				</h4>
				<table>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.divisionName"/]:</span></td>
						<td>${division.title}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.divisionFullName"/]:</span></td>
						<td>${division.fullTitle}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.divisionAddress"/]:</span></td>
						<td>${division.address}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.divisionContacts"/]:</span></td>
						<td>${division.contacts}</td>
					</tr>					
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.divisionDescription"/]:</span></td>
						<td>${division.description}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.divisionManagerEmail"/]:</span></td>
						<td>${division.managerEmail}</td>
					</tr>
					[@security.authorize ifAnyGranted="ROLE_ADMIN"]
					<tr><td/>
						<td><a class="button" href="[@spring.url '/admin/division/delete/${division.id}' /]" onclick="return confirm('[@spring.message "label.division.confirmDelete"/]')">
							[@spring.message "label.delete"/]</a>
						</td>
					</tr>
					[/@security.authorize]					
				</table> 
				</div> <!-- edit-division-table -->
				<div class="tender-edit-form"> <!-- edit-division-form -->
	                <h4>[@spring.message "label.generalInformation"/]
					<a class="tender-edit-2" href="#" title="Cancel editing">
						<img src="[@spring.url '/resources/img/btn-edit-cancel.png'/]" alt="Cancel editing">
					</a> 
					</h4>
						<form method="POST" action="[@spring.url '/admin/division/store' /]">
                			<div style="display:none;">[@spring.formInput "division.id"/]</div>						
							<table>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.divisionName"/]:</span></td>
									<td>[@spring.formInput "division.title", "style='width:500px'"/]</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.divisionFullName"/]:</span></td>
									<td>[@spring.formInput "division.fullTitle", "style='width:500px'"/]</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.divisionAddress"/]:</span></td>
									<td>[@spring.formInput "division.address", "style='width:500px'"/]</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.divisionContacts"/]:</span></td>
									<td>[@spring.formInput "division.contacts", "style='width:500px'"/]</td>
								</tr>					
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.divisionDescription"/]:</span></td>
									<td>
										[@spring.formTextarea "division.description", 'rows="5" cols="60"'/]
									</td>
								</tr>								
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.divisionManagerEmail"/]:</span></td>
									<td>[@spring.formInput "division.managerEmail", "style='width:500px'"/]</td>
								</tr>									
								<tr><td/>
									<td><input type="submit" value="[@spring.message "label.store"/]" /></td>
								</tr>
							</table>
						</form>
				</div> <!-- edit-division-form -->
              </div> <!-- right -->
              <div class="right">
                <h4><a href="#" class="tender-new">[@spring.message "label.tender.createNew"/]</a></h4>
				<div class="tender-new-form">
					<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
					<div style="display:none;">[@spring.formInput "tender.division.id"/]</div>
					<div style="display:none;">[@spring.formInput "tender.attachedDocName"/]</div>						
						<table class="form">
							<tr>
								<td class="first"><span class="bold">[@spring.message "label.tender.title"/]:</span></td>
								<td>[@spring.formInput "tender.title"/]</td>
							</tr>
							<tr>
								<td class="first"><span class="bold">[@spring.message "label.tender.date"/]:</span></td>
								<td>
									<input 
										value="${tender.publishDate?string("dd.MM.yyyy")}" 
										name="publishDate" 
										id="publishDate" />									
								</td>
							</tr>
							<tr>
								<td class="first"><span class="bold">[@spring.message "label.tender.docs"/]:</span></td>
								<td>[@spring.formInput "tender.attachedDoc", "", "file"/]</td>
							</tr>
							<tr>
								<td/>
								<td><input type="submit" value="Добавить" /></td>
							</tr>
						</table>
					</form>
				</div> <!-- tender-new-form -->
              </div>              
          </div>
      </div>
    </div>
  </div>
	<div id="mastfooter">
		[#include "/tiles/footer.ftl"]
	</div>
</div>
</body>

</html>