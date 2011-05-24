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
</head>
<body>
<div id="wrap">
  <div id="masthead">
    <h1 class="left"><a href="[@spring.url '/index'/]"><span>InTender Logo</span></a></h1>
	[#include "/tiles/main_login_form.ftl"]
  </div>
  [#include "/tiles/main_top_menu.ftl"]
  <div id="mastcontent" class="twocols">
    <div class="left sidebar">
		[#include "/tiles/main_division_menu.ftl"]	
    </div>
    <div class="right content">
      <div class="twocols">
      [#if tender??]
          <h3>${tender.division.title}</h3>
          <div class="products">
              <div class="right">
                <h4>${tender.title}</h4>
                <table>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderId"/]:</span></td>
						<td>${tender.id}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
						<td>${tender.publishDate?string("dd.MM.yyyy")}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
						<td>
		                  	<a href="/uploads/${tender.attachedDocName}.docx"><img src="[@spring.url '/resources/img/save_doc.gif'/]"></a>
		                  	<a href="/uploads/${tender.attachedDocName}.pdf"><img src="[@spring.url '/resources/img/save_pdf.gif'/]"></a>						
						</td>
					</tr>
				</table>
              </div>
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