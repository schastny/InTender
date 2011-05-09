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
		[#include "/tiles/admin_division_menu.ftl"]
    </div>
    <div class="right content">
      <div class="twocols">
          <h3>[#if division??]${division.title}[/#if]</h3>
          <div class="products">
              <div class="right">
              	[#if tenderList?size > 0]
              	<h4>Tenders</h4>
	              	<ul>
	                	[#list tenderList as tender]
							<li>
								<span class="bold">
									${tender.price} 
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
                <h4>General information</h4>
				<table>
					<tr>
						<td class="first"><span class="bold">Full name:</span></td>
						<td>${division.fullTitle}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">Address:</span></td>
						<td>${division.address}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">Contacts:</span></td>
						<td>${division.contacts}</td>
					</tr>					
					<tr>
						<td class="first"><span class="bold">Description:</span></td>
						<td>${division.description}</td>
					</tr>
				</table> 
              </div>
              <div class="right">
                <h4><a href="#" class="tender-new">New tender for this Division</a></h4>
				<div class="tender-new-form">
					<form method="POST" action="[@spring.url '/admin/tender/store' /]" enctype="multipart/form-data">
					<div style="display:none;">[@spring.formInput "tender.division.id"/]</div>						
						<table class="form">
							<tr>
								<td class="first"><span class="bold">[@spring.message "label.tenderTitle"/]:</span></td>
								<td>[@spring.formInput "tender.title"/]</td>
							</tr>
							<tr>
								<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
								<td>[@spring.formInput "tender.price"/]</td>
							</tr>
							<tr>
								<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
								<td>[@spring.formInput "tender.image", "", "file"/]</td>
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