[#ftl]
[#import "spring.ftl" as spring]
<div align="left">
	[@spring.message "label.title"/]
</div>

<a href=" [@spring.url '/index' /] ">
	Main page
</a>

<div>
	<form method="POST" action="[@spring.url '/j_spring_security_check' /]" id="login.form">
		<div style="text-align:left; width:400px">
			<div style="text-align:right;">
				[#if Session.SPRING_SECURITY_LAST_EXCEPTION?? && Session.SPRING_SECURITY_LAST_EXCEPTION.message?has_content]
					<font color="red">
					[@spring.message "label.loginerror" /]:
					${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
					</font>
				[/#if]
			</div>
			<div style="text-align:right;">
				[@spring.message "label.login" /]
				<input type="text" name="j_username"">
			</div>
			<div style="text-align:right;">
				[@spring.message "label.password"/]
				<input type="password" name="j_password">
			</div>
			<div style="text-align:right;">
				[@spring.message "label.remember"/]
				<input type="checkbox" name="_spring_security_remember_me">
			</div>
			<div style="text-align:right;">
				<input type="submit" value="ОК"/>
			</div>
		</div>
	</form>
</div>