[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.title"/] - tenders for products and services for the business</title>
<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />
</head>
<body>
<div id="wrap">
  <div id="masthead">
    <h1 class="left"><a href="[@spring.url '/index'/]"><span>InTender Logo</span></a></h1>
    [#include "/tiles/login_form.ftl"]
  </div>
  <div id="mastmenu">
    <div class="inner">
      <ul>
        <li><a href="listing.html">Home</a></li>
        <li><a href="listing.html">About InTender</a></li>
        <li><a href="listing.html">Contacts</a></li>
      </ul>
    </div>
  </div>
  <div id="mastcontent" class="twocols">
    <div class="left sidebar">
      <div class="secmenu">
        <ul id="prod_nav">
          <li class="first-of-type"><span>Divisions</span></li>
          <li class="top"><a href="listing.html">Городская больница №1</a></li>
          <li class="top"><a href="listing.html">Городская больница №7</a></li>
          <li class="top"><a href="listing.html">Центр охраны здоровья матери и ребёнка (город Севастополь)</a></li>
          <li class="top"><a href="listing.html">Управление здравоохранения</a></li>
        </ul>
      </div>
    </div>
    <div class="right content">
      <div class="twocols">
          <h3>Recent Tenders</h3>
          <ul class="products">
            <li>
              <div class="right">
              	<div class="division"><h4><a href="item.html">Центр охраны здоровья матери и ребёнка (город Севастополь)</a></h4></div>
              	<ul>
                  <li><a href="#">Закупка топлива</a></li>
                  <li><a href="#">Ремонт лифта</a></li>
                  <li><a href="#">Капитальный ремонт поликлиники</a></li>
                  <li><a href="#">Капитальный ремонт хирургии</a></li>
                </ul>
              </div>
            </li>            
            <li>
              <div class="right">
                <div class="division"><h4><a href="item.html">Городская больница №7</a></h4></div>
              	<ul>
                  <li><a href="#">Закупка топлива</a></li>
                  <li><a href="#">Ремонт лифта</a></li>
                  <li><a href="#">Капитальный ремонт поликлиники</a></li>
                  <li><a href="#">Капитальный ремонт хирургии</a></li>
                </ul>
              </div>
            </li> 
            <li>
              <div class="right">
                <div class="division"><h4><a href="item.html">Городская больница №1</a></h4></div>
              	<ul>
                  <li><a href="#">Закупка топлива</a></li>
                  <li><a href="#">Ремонт лифта</a></li>
                  <li><a href="#">Капитальный ремонт поликлиники</a></li>
                  <li><a href="#">Капитальный ремонт хирургии</a></li>
                </ul>
              </div>
            </li> 
            <li>
              <div class="right">
                <div class="division"><h4><a href="item.html">Управление здравоохранения города Севастополя</a></h4></div>
              	<ul>
                  <li><a href="#">Закупка топлива</a></li>
                  <li><a href="#">Ремонт лифта</a></li>
                  <li><a href="#">Капитальный ремонт поликлиники</a></li>
                  <li><a href="#">Капитальный ремонт хирургии</a></li>
                </ul>
              </div>
            </li> 
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
