[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.title"/] -  ${tender.division.title} - ${tender.title}</title>
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
    [#include "/tiles/main_login_form.ftl"]
  </div>
  [#include "/tiles/admin_top_menu.ftl"]
  <div id="mastcontent" class="twocols">
	<div class="left sidebar">
		[#include "/tiles/admin_division_menu.ftl"]
	</div>
    <div class="right content">
      <div class="twocols">

      [#if tender??]
          <h3>Editing Tenders in ${tender.division.title}</h3>
          <div class="products">
              <div class="right">
                <div class="tender-edit-table">
                <h4>
                	${tender.title}
					<a class="tender-edit-1" href="#" title="Edit tender">
						<img src="[@spring.url '/resources/img/btn-edit.png'/]" alt="Edit tender">
					</a>                
                </h4>
                <table>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderId"/]:</span></td>
						<td>${tender.id}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
						<td>${tender.publishDate?string("dd.MM.yyyy")}</td>
					</tr>
					<tr height="60px">
						<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
						<td>
		                  	<a href="/uploads/${tender.attachedDocName}.doc"><img src="[@spring.url '/resources/img/save_doc.gif'/]"></a>
		                  	<a href="/uploads/${tender.attachedDocName}.pdf"><img src="[@spring.url '/resources/img/save_pdf.gif'/]"></a>						
						</td>
					</tr>
					[@security.authorize ifAnyGranted="ROLE_ADMIN"]
					<tr><td/>
						<td><a class="button" href="[@spring.url '/admin/tender/delete/${tender.id}' /]" onclick="return confirm('Are you sure you want to delete this Tender?')">[@spring.message "label.delete"/]</a></td>
					</tr>
					[/@security.authorize]					
				</table>
				</div> <!-- tender-edit-table -->
				<div class="tender-edit-form">
						<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
                			<h4>[@spring.formInput "tender.title"/]
                				<a class="tender-edit-2" href="#" title="Cancel editing">
									<img src="[@spring.url '/resources/img/btn-edit-cancel.png'/]" alt="Cancel editing">
								</a>                			
                			</h4>	
                			<div style="display:none;">[@spring.formInput "tender.id"/]</div>						
                			<div style="display:none;">[@spring.formInput "tender.division.id"/]</div>						
                			<div style="display:none;">[@spring.formInput "tender.attachedDocName"/]</div>						
							<table>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.tenderId"/]:</span></td>
									<td>${tender.id}</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
									<td>
										<input 
											value="${tender.publishDate?string("dd.MM.yyyy")}" 
											name="publishDate" 
											id="publishDate" />
									</td>
								</tr>
								<tr height="80px">
									<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
									<td>[@spring.formInput "tender.attachedDoc", "", "file"/]</td>
								</tr>
								<tr><td/>
									<td><input type="submit" value="[@spring.message "label.store"/]" /></td>
								</tr>
							</table>
						</form>
				</div> <!-- tender-edit-form -->				
              </div> <!-- right -->
          </div>
      [/#if]          

       
      </div>
    </div>
  </div>
	<div id="mastfooter">
		[#include "/tiles/footer.ftl"]
	</div>
</div>
</body>

</html>