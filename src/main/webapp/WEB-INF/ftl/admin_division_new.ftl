[#ftl]
[#import "spring.ftl" as spring]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[@spring.message "label.admin.title"/] - [@spring.message "label.createNewDivision"/]</title>
<link rel="shortcut icon" href="[@spring.url '/resources/img/favicon.ico'/]" type="image/x-icon" /> 

<link rel="stylesheet" href="[@spring.url '/resources/css/main.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/reset.css'/]" type="text/css" media="all" />
<link rel="stylesheet" href="[@spring.url '/resources/css/layout.css'/]" type="text/css" media="all" />

<script type='text/javascript' src="[@spring.url '/resources/js/jquery.min.js'/]" ></script>
<!-- jquery.wysiwyg.js -->
	<link rel="stylesheet" href="[@spring.url '/resources/css/jquery.wysiwyg.css'/]" type="text/css" media="all" />
	
	<script type="text/javascript" src="[@spring.url '/resources/js/jquery.wysiwyg.js'/]"></script>
	<script type="text/javascript" src="[@spring.url '/resources/js/controls/wysiwyg.image.js'/]"></script>
	<script type="text/javascript" src="[@spring.url '/resources/js/controls/wysiwyg.link.js'/]"></script>
	<script type="text/javascript" src="[@spring.url '/resources/js/controls/wysiwyg.table.js'/]"></script>

	<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			$('#description').wysiwyg();
		});
	})(jQuery);
	</script>
<!-- jquery.wysiwyg.js -->

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
          <h3>[@spring.message "label.createNewDivision"/]</h3>
	          <div class="products">
	              <div class="right">
	                <h4>[@spring.message "label.generalInformation"/]</h4>
						<form method="POST" action="[@spring.url '/admin/division/store' /]">
                			<div style="display:none;">[@spring.formInput "division.id"/]</div>						
							<table>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.name"/]:</span></td>
									<td>[@spring.formInput "division.title", "style='width:500px'"/]</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.fullName"/]:</span></td>
									<td>[@spring.formInput "division.fullTitle", "style='width:500px'"/]</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.address"/]:</span></td>
									<td>[@spring.formInput "division.address", "style='width:500px'"/]</td>
								</tr>
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.contacts"/]:</span></td>
									<td>[@spring.formInput "division.contacts", "style='width:500px'"/]</td>
								</tr>					
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.description"/]:</span></td>
									<td>
										[@spring.formTextarea "division.description", 'rows="25" cols="60"'/]
									</td>
								</tr>	
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.managerEmail"/]:</span></td>
									<td>[@spring.formInput "division.managerEmail", "style='width:500px'"/]</td>
								</tr>															
								<tr>
									<td class="first"><span class="bold">[@spring.message "label.division.managerPassword"/]:</span></td>
									<td>[@spring.formInput "division.managerPassword", "style='width:500px'"/]</td>
								</tr>															
								<tr><td/>
									<td><input type="submit" value="[@spring.message "label.store"/]" /></td>
								</tr>
							</table>
						</form>	              
	              </div> <!-- right -->
	          </div> <!-- products -->

      </div>
    </div>
  </div>
	<div id="mastfooter">
		[#include "/tiles/footer.ftl"]
	</div>
</div>
</body>

</html>