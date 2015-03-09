package dwz.framework.core.passport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dwz.constants.BeanManagerKey;
import dwz.framework.constants.Constants;
import dwz.framework.core.exception.AuthenticationException;
import dwz.framework.core.factory.BusinessFactory;
import dwz.framework.http.wrapper.AppHttpRequestWrapper;
import dwz.framework.user.User;
import dwz.framework.user.UserManager;

public abstract class Passport {

	private static Passport passport = null;

	private static final Object lock = new Object();

	public static Passport getPassport(HttpServletRequest request) {
		if (passport == null) {
			synchronized (lock) {
				if (passport == null) {
					String passportClass = Constants.STANDARD_PASSPORT_CLASS;

					// if (request
					// .getAttribute("javax.servlet.request.cipher_suite") !=
					// null) {
					// passportClass = Constants.X509_PASSPORT_CLASS;
					// }

					Class<?> clazz = null;
					try {
						clazz = Class.forName(passportClass);
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}

					try {
						passport = (Passport) clazz.newInstance();
					} catch (InstantiationException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return passport;
	}

	public abstract void login(HttpServletRequest request, String appUserName,
			String appPassword, String appUserType)
			throws AuthenticationException;

	public abstract void login(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException;

	public abstract void logout(HttpServletRequest request,
			HttpServletResponse response);

	public static void setSessionUser(HttpServletRequest request, String userId) {
		HttpSession session = request.getSession();
		if (request instanceof AppHttpRequestWrapper) {
			session.setAttribute(Constants.AUTHENTICATION_KEY, userId);
		} else {
			UserManager uMgr = BusinessFactory.getFactory().getManager(
					BeanManagerKey.userManager);
			User user = uMgr.getUser(userId);
			session.setAttribute(Constants.AUTHENTICATION_KEY, user);
		}
	}
}