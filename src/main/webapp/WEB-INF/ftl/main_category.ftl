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
          <h3>Центр охраны здоровья матери и ребёнка</h3>
          <div class="products">
              <div class="right">
              	<h4>Tenders</h4>
              	[#if tenderList??]
	              	<ul>
	                	[#list tenderList as tender]
							<li>
								<span class="bold">
									${tender.price} 
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
                <h4>General information</h4>
				<table>
					<tr>
						<td><span class="bold">Full name:</span></td>
						<td>Коммунальное специализированное заведение «Городская больница № 5 – Центр охраны здоровья матери и ребенка» - ЦОЗМиР</td>
					</tr>
					<tr>
						<td><span class="bold">Address:</span></td>
						<td>Севастополь, ул. Острякова 155.</td>
					</tr>
					<tr>
						<td><span class="bold">Contacts:</span></td>
						<td>Email:admin2@intender.net <br/> Tel: 54-27-37</td>
					</tr>					
					<tr>
						<td><span class="bold">History:</span></td>
						<td>
							<strong>Задачи Центра</strong> – организация и обеспечение квалифицированной, в полном объеме стационарной, консультативной и амбулаторной медицинской помощи детям с 0 до 18 лет, взрослому населению – в соответствии со специализацией коечного фонда, структурой женских консультаций и МЦПСиРЧ. <br />
							<br />
							<em>Основные направления деятельности:</em> <ul>
							<li>роды,</li>
							<li>беременность,</li>
							<li>лечение детей,</li>
							<li>охрана здоровья женщин и детей.</li>
							</ul>
							
							В соответствии с лицензией Министерства здравоохранения Украины № 36 от 29.12.2006 года медицинская помощь оказывается по 51 специальности. <br />
							Круглосуточно функционируют все стационарные отделения, травматологический пункт, центр охраны зрения, обеспечивается лабораторно-диагностическая помощь. <br />
							В поликлинике ведут консультативный прием врачи по 22 специальностям, работает дневной стационар, городская санаторно-курортная, отборочная комиссия. <br />
							<br />
							<em>Лабораторно-диагностическая служба представлена:</em><ul>
							<li>отделением лабораторной диагностики,</li>
							<li>медико-генетической лабораторией,</li>
							<li>диагностической бактериологическое лабораторией,</li>
							<li>лабораторией иммуноферментного анализа (ИФА),</li>
							<li>цито-генетической лабораторией,</li>
							<li>иммунологической и токсикологической лабораториями.</li>
							</ul>
							
							Иммунологические и токсикологические лаборатории оснащенны современной аппаратурой, в том числе анализаторами для массовых клинических к биохимических исследований. <br />
							Диагностическое аппаратное обследование представлено эндоскопической, рентгенологической, ультразвуковой, маммографической аппаратурой с использованием компьютерных технологий. <br />
							<br />
							Магнитно-резонансные и компьютерно-топографические исследования проводятся на базе городской больницы №1. При необходимости по направлениям специалистов Центра проводится консультирование в клиниках НИИ г.Симферополя и г.Киева. <br />
							<br />
							Имеется опыт оперативного лечения выездными бригадами клинических НИИ на базе Центра. <br />
							Городская больница №5 ЦОЗМиР является базой подготовки врачей-интернов Крымского государственного медицинского университета г.Симферополя и медицинских сестер Севастопольского медицинского колледжа. <br />
							<br />
							Ежегодно в больницу приходят до 40 молодых специалистов, в том числе до 10 врачей, до 30 медицинских сестер и фельдшеров. <br />
							Городская больница № 5 сотрудничает с благотворительными фондами «Материнство и детство», «Центр солидарности», Украинской Православной Церковью.
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