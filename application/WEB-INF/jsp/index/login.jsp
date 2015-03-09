<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<div class="signin">

	<div class="signinForm">
		<h2>I Have an Account</h2>
		<p class="signinInfo">If you have saved your information with us before, access it by logging in below.</p>
		<form method="post" action="/passport!login.do">
		<input type="hidden" name="backToUrl" value='${empty backToUrl ? param.backToUrl : backToUrl}' />
			<fieldset>
				<legend>Log in</legend>
				<p>
					<input class="textInput" type="text" name="app_username" value="${param.app_username}" alt='<s:text name="form.username"/>'>
				</p>
				<p>
					<input class="textInput" type="password" name="app_password" alt='<s:text name="form.pwd"/>'>
				</p>
				<p class="submitBt">
					<input class="signinBt" type="submit" value="Sign In" alt="Sign In">
				</p>
			</fieldset>
		</form>
		<form action="/myaccount/user!forgetPassword.do" class="forgotPanel"><!-- openForgot -->
			<a class="forgotHandle" href="#forgotpassword">Forgot your password?</a>
			<fieldset>
				<legend>Forgot your password?</legend>
				<p>
					<input class="textInput" type="text" name="userName" alt="Email Address">
					<input class="forgotBt" type="submit" value="Continue">
				</p>
			</fieldset>
		</form>
	</div>
	<div class="singupForm">
		<h2>Register</h2>
		<p class="signinInfo">Create an account today, please enter you details as below.</p>
		<form action="#">
			<fieldset>
				<legend>Register</legend>
				<p>
					<span>
						<input class="textInput firstName" type="text" name="firstName" alt="First Name">
					</span>
					<span>
						<input class="textInput lastName" type="text" name="lastName" alt="Last Name">
					</span>
				</p>
				<p>
					<input class="textInput" type="text" name="email" alt="Email Address">
				</p>
				<p>
					<input class="textInput" type="password" name="password" alt="Password">
				</p>
				<p>
					<input class="textInput" type="password" name="rePassword" alt="Confirm Password">
				</p>
				<p class="submitBt">
					<input class="signupBt" type="submit" value="Create My Account" alt="Create My Account">
				</p>
			</fieldset>
		</form>
	</div>
</div>