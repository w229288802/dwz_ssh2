package dwz.present.passport;

import java.io.UnsupportedEncodingException;

import dwz.framework.core.exception.AuthenticationException;
import dwz.framework.core.passport.Passport;
import dwz.present.BaseAction;

public class PassportAction extends BaseAction {

	private String backToUrl;

	public String login() {
		Passport passport = Passport.getPassport(request);
		boolean loginOk = false;

		try {
			if (isSkipVC() || this.verifyValidationCode(getValidationCode())) {
				passport.login(request, response);
				loginOk = true;
			} else {
				setStatusCode(300);
				setMessage(this.getText("msg.validation.code.match"));
			}

		} catch (AuthenticationException e) {
			setStatusCode(300);
			setMessage(e.getLocalizedMessage());
		}

		if (backToUrl == null || backToUrl.trim().length() == 0) {
			backToUrl = "/myaccount/index!index.do";
		} else {
			try {
				backToUrl = java.net.URLDecoder.decode(backToUrl, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		System.out.println("backToUrl: " + backToUrl);

		if (loginOk) {
			return SUCCESS;
		}

		return INPUT;
	}

	public String logout() {
		Passport passport = Passport.getPassport(request);

		passport.logout(request, response);

		if (backToUrl == null) {
			backToUrl = "/index!index.do";
		}

		return SUCCESS;
	}

	public String getBackToUrl() {
		return backToUrl;
	}

	public void setBackToUrl(String backToUrl) {
		this.backToUrl = backToUrl;
	}

}
