[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.title"/] - Edit Tender</title>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<script type='text/javascript' src="[@spring.url '/resources/js/slider.js'/]" ></script>

</head>
<body>
<div id="wrap">
  <div id="masthead">
    <h1 class="left admin"><a href="[@spring.url '/admin'/]"><span>InTender Logo</span></a></h1>
    [#include "/tiles/main_login_form.ftl"]
  </div>
  <div id="mastmenu">
    <div class="inner">
      <ul>
        <li><a href="listing.html">Users</a></li>
        <li><a href="[@spring.url '/admin/divisions'/]">Manage Divisions</a></li>
        <li><a href="listing.html">Tenders</a></li>
      </ul>
    </div>
  </div>
  <div id="mastcontent" class="twocols">
	<div class="left sidebar">
		[#include "/tiles/admin_main_division_menu.ftl"]
	</div>
    <div class="right content">
      <div class="twocols">

      [#if tender??]
          <h3>Editing Tenders in ${tender.division.title}</h3>
          <div class="products">
              <div class="right">
                <div class="tender-edit-table">
                <h4>${tender.title}</h4>
                <table>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderId"/]:</span></td>
						<td>${tender.id}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
						<td>${tender.price}</td>
					</tr>
					<tr height="80px">
						<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
						<td>
		                  	<a href="[@spring.url '/image/${tender.id}.doc'/]"><img src="[@spring.url '/resources/img/save_doc.gif'/]"></a>
		                  	<a href="[@spring.url '/image/${tender.id}.pdf'/]"><img src="[@spring.url '/resources/img/save_pdf.gif'/]"></a>						
						</td>
					</tr>
					<tr><td/>
						<td><a href="#" class="tender-edit-1 button" />[@spring.message "label.edit"/]</a></td>
					</tr>
					<tr><td/>
						<td><a class="button" href="[@spring.url '/admin/tender/delete/${tender.id}' /]">[@spring.message "label.delete"/]</a></td>
					</tr>
				</table>
				</div> <!-- tender-edit-table -->
				<div class="tender-edit-form">
						<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
                			<h4>[@spring.formInput "tender.title"/]</h4>	
                			<div style="display:none;">[@spring.formSingleSelect "tender.division.id", divisionMap/]</div>						
                			<div style="display:none;">[@spring.formInput "tender.id"/]</div>						
							<table>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.tenderId"/]:</span></td>
									<td>${tender.id}</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
									<td>[@spring.formInput "tender.price"/]</td>
								</tr>
								<tr height="80px">
									<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
									<td>[@spring.formInput "tender.image", "", "file"/]</td>
								</tr>
								<tr><td/>
									<td><a href="#" class="tender-edit-2 button" />Отмена</a></td>
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
    <div class="inner">
      <div class="content">
        <h1 class="left"><a href="[@spring.url '/index'/]"><span>InTender Logo</span></a></h1>
        <div class="right">
          <ul class="main">
            <li><a href="#">Home</a></li>
            <li>-<a href="#">About InTender</a></li>
            <li>-<a href="#">Contacts</a></li>
          </ul>
          <ul class="secondary">
            <li><a href="#">Privacy</a></li>
            <li>-<a href="#">Terms and Conditions</a></li>
            <li>&copy;2011 InTender</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
</body>

</html>