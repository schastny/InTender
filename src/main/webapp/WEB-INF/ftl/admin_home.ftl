[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="[@spring.url '/resources/img/favicon.ico'/]" type="image/x-icon" /> 

<title>[@spring.message "label.title"/] - Admin Panel</title>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />
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
          <h3>[@spring.message "label.recentTenders"/]</h3>
          <ul class="products">
          [#if tendersByDivision??]
			[#list tendersByDivision as aDivision]
				<li>
					<div class="right">
		              	<div class="division">
		              		<h4>
		              			<a href="[@spring.url '/admin/${aDivision.division.id}'/]">
		              				${aDivision.division.title}
		              			</a>
		              		</h4>
		              	</div>
			            [#if aDivision.tenders??]
				            <ul>
							  [#list aDivision.tenders as tender]
				                  <li>							
						            <a href=" [@spring.url '/admin/${tender.division.id}/${tender.id}'/] ">
										${tender.title}
									</a>  
								  </li>
							  [/#list]	
							</ul>
						[/#if]	              	
					</div>
				</li>
			[/#list]
          [/#if]
          </ul>
          	[#if tenderList??]
				<ul>
					[#list tenderList as tender]
						<li>
							${tender.division.title} 
							<a href=" [@spring.url '/tenders/${tender.division.id}/${tender.id}'/] ">
								${tender.title}
							</a>
						</li>
					[/#list]
				</ul>
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