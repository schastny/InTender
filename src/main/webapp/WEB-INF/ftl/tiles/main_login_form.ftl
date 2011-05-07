[#ftl]
	<div class="loginbox right">
      <form method="POST" action="[@spring.url '/j_spring_security_check' /]" id="login.form">
        <div class="first-of-type">
				[#if Session.SPRING_SECURITY_LAST_EXCEPTION?? && Session.SPRING_SECURITY_LAST_EXCEPTION.message?has_content]
					<span>
					[@spring.message "label.loginerror" /]:
					${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
					</span>
				[/#if]       
        </div>
        <div>
			<label for="username">[@spring.message "label.login" /]</label>
			<input type="text" name="j_username"">          
        </div>
        <div>
			<label for="password">[@spring.message "label.password"/]</label>
			<input type="password" name="j_password">
        </div>        
        <div>
			<label>[@spring.message "label.remember"/]</label>
			<input class="check" type="checkbox" name="_spring_security_remember_me">
			<input type="image" class="submit" src="[@spring.url '/resources/img/btn_login_top.gif'/]" />
        </div>        

      </form>
      <p>
      	<a href="#">Forgot your password?</a> 
      	<a href="#">I don't have an account</a>
      	<a href="[@spring.url '/admin'/]">Admin section</a>
      	<a href="[@spring.url '/logout'/]">[@spring.message "label.logout"/]</a>
      </p>
    </div>