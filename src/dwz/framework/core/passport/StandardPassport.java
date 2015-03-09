package dwz.framework.core.passport;

import java.util.Collection;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dwz.constants.BeanDaoKey;
import dwz.framework.constants.Constants;
import dwz.framework.core.exception.AuthenticationException;
import dwz.framework.core.factory.BusinessFactory;
import dwz.persistence.daos.SysUserDao;

public class StandardPassport extends Passport {
	public void login(HttpServletRequest request, String appUserName,
			String appPassword, String appUserType) throws AuthenticationException{

		Collection<String> ids = null;
		SysUserDao userDao = BusinessFactory.getFactory().getDao(BeanDaoKey.sysUserDao);
		
		ids = userDao.findByPublicCredential(appUserName, appPassword);

		if (ids == null || ids.size() < 1) {
			System.out.println("login failed: " + appUserType + ": "
					+ appUserName);
			throw new AuthenticationException("msg.login.failure");
		}
		String userId = ids.iterator().next();

		setSessionUser(request, userId);
		
	}

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {

		String appUserName = request.getParameter(Constants.PASSPORT_USERNAME);
		String appPassword = request.getParameter(Constants.PASSPORT_PASSWORD);
		String appUserType = request.getParameter(Constants.PASSPORT_USER_TYPE);

		login(request, appUserName, appPassword, appUserType);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		// String sid = "";
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (Constants.AUTHENTICATION_TOKEN.equals(cookie.getName())) {
					// sid = cookie.getValue();
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					break;
				}
			}
		}

		HttpSession session = request.getSession();
		// session.invalidate();
		session.removeAttribute(Constants.AUTHENTICATION_KEY);
	}

}
