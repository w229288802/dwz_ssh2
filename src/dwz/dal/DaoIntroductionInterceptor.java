package dwz.dal;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.IntroductionInterceptor;

public class DaoIntroductionInterceptor implements IntroductionInterceptor {

	private static Log log = LogFactory
			.getLog(DaoIntroductionInterceptor.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.aopalliance.intercept.MethodInterceptor#invoke(org.aopalliance.intercept.MethodInvocation)
	 */
	public Object invoke(MethodInvocation methodInvocation) throws Throwable {
		// 声明方法的Class

		Class<?> methodClazz = methodInvocation.getMethod().getDeclaringClass();

		if (methodClazz.isAssignableFrom(BaseDao.class)) {
			// 执行 BaseDao操作
			return methodInvocation.proceed();
		}
		BaseDaoImpl baseDao = (BaseDaoImpl) methodInvocation.getThis();

		// 方法名称
		String methodName = methodInvocation.getMethod().getName();
		// 方法的参数
		Object[] params = methodInvocation.getArguments();
		// 查询名称
		String queryName = getNamedQueryString(methodInvocation.getMethod());
		if (log.isInfoEnabled()) {
			log.info("The query name : " + queryName);
		}

		// 更新或者是删除方法
		if (methodName.startsWith(DaoConstant.DELETE_ALL_PREFIX)
				|| methodName.startsWith(DaoConstant.UPDATE_ALL_PREFIX)) {
			if (log.isInfoEnabled()) {
				log.info("The update or delete method Invoked");
			}
			return baseDao.executeCmd(queryName, params);
		}
		if (methodName.startsWith(DaoConstant.FIND_PREFIX)) {
			// 分页查询
			if (methodName.endsWith(DaoConstant.PAGE_BREAK_SUFFIX)) {
				if (params == null || params.length < 2) {
					throw new java.lang.IllegalArgumentException(
							"The PageBreak Illegal Argument length < 2");
				}
				Object[] newParams = new Object[params.length - 2];
				for (int i = 0; i < newParams.length; i++) {
					newParams[i] = params[i];
				}

				int startIndex = ((Integer) params[params.length - 2])
						.intValue();
				int count = ((Integer) params[params.length - 1]).intValue();
				return baseDao.findCmd(queryName, newParams, startIndex, count);
			}
			// 非分页查询
			return baseDao.findCmd(queryName, params);
		}
		throw new NoSupportDaoMethodException(
				"No Support Dao Method Exception, Please Check Method Name rule");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.aop.DynamicIntroductionAdvice#implementsInterface(java.lang.Class)
	 */
	public boolean implementsInterface(Class clazz) {
		return clazz.isInterface() && BaseDao.class.isAssignableFrom(clazz);
	}

	private String getNamedQueryString(Method method) {
		String clazz = method.getDeclaringClass().getName();
		return clazz + "." + method.getName();
	}
}
