[#ftl]
	<div class="loginbox right">
      <form method="post" action="#">
        <div class="first-of-type">
          <label for="username">User Name:</label>
          <input type="text" name="username" id="username" value="" />
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" name="password" id="password	" value="" />
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