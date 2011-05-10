[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.title"/] - Login page</title>
<link rel="shortcut icon" href="[@spring.url '/resources/img/favicon.ico'/]" type="image/x-icon" /> 

<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />
</head>
<body>
<div id="wrap">
	  <div id="mastcontent" class="twocols">
		    <div class="left sidebar">
		    </div>
		    
			<div class="right">
				<div id="masthead">  
					<h1 class="left"><a href="[@spring.url '/index'/]"><span>InTender Logo</span></a></h1><br/>
					[#include "/tiles/main_login_form.ftl"]
				</div>
			</div>
	  </div>
</div>
</body>
</html>