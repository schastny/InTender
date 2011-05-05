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
          <h3>${tender.division.title}</h3>
          <div class="products">
              <div class="right">
                <h4>${tender.title}</h4>
                <table>
					<tr>
						<td><span class="bold">[@spring.message "label.tenderId"/]:</span></td>
						<td>${tender.id}</td>
					</tr>
					<tr>
						<td><span class="bold">[@spring.message "label.tenderDate"/]:</span></td>
						<td>${tender.price}</td>
					</tr>
					<tr>
						<td><span class="bold">[@spring.message "label.tenderDocs"/]:</span></td>
						<td>
		                  	<a href="[@spring.url '/image/${tender.id}.doc'/]"><img src="[@spring.url '/resources/img/save_doc.gif'/]"></a>
		                  	<a href="[@spring.url '/image/${tender.id}.pdf'/]"><img src="[@spring.url '/resources/img/save_pdf.gif'/]"></a>						
						</td>
					</tr>
				</table>
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