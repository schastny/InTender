[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.title"/] - [#if division??]${division.title}[/#if]</title>
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
								<a href=" [@spring.url '/tenders/${tender.division.id}/${tender.id}'/] ">
									${tender.title}
								</a>
							</li>
						[/#list]
	                </ul>
                [/#if]
              </div>
              <div class="right">
                <h4>[@spring.message "label.generalInformation"/]</h4>
				<table>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.division.fullName"/]:</span></td>
						<td>${division.fullTitle}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.division.address"/]:</span></td>
						<td>${division.address}</td>
					</tr>
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.division.contacts"/]:</span></td>
						<td>${division.contacts}</td>
					</tr>					
					<tr>
						<td class="first"><span class="bold">[@spring.message "label.division.description"/]:</span></td>
						<td>${division.description}</td>
					</tr>
				</table> 
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