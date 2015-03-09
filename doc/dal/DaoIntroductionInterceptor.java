package uk.co.quidos.framework.persistence.dao.impl;

import java.util.List;

import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.IntroductionInterceptor;
import org.springframework.util.CollectionUtils;

import uk.co.quidos.framework.persistence.dao.DaoConstant;
import uk.co.quidos.framework.persistence.dao.IBaseDao;
import uk.co.quidos.framework.persistence.dao.QueryHql;
import uk.co.quidos.framework.persistence.dao.exception.NoSupportDaoMethodException;
import uk.co.quidos.framework.persistence.dao.vo.PageBreakFirstAndMaxResultVO;

public class DaoIntroductionInterceptor implements IntroductionInterceptor {
	
	private static Log log = LogFactory.getLog(DaoIntroductionInterceptor.class);

	@SuppressWarnings("unchecked")
	public Object invoke(MethodInvocation methodInvocation) throws Throwable {
		// 声明方法的Class
		if (log.isDebugEnabled()) {
			log.debug("Quidos Framework V1.0 : The Method Invocation is : " + methodInvocation);
		}
		Class methodClazz = methodInvocation.getMethod().getDeclaringClass();
		if (log.isDebugEnabled()) {
			log.debug("Quidos Framework V1.0 : The Method Declaring Class is : " + methodInvocation.getMethod().getDeclaringClass());
		}

		if (methodClazz.isAssignableFrom(IBaseDao.class)) {
			// 执行 BaseDao操作
			return methodInvocation.proceed();
		}
		
		//Annonation 
		QueryHql queryHql = methodInvocation.getMethod().getAnnotation(QueryHql.class);
		if (queryHql != null){
			
			String hql = queryHql.hql();
			BaseDaoImpl baseDaoImpl = (BaseDaoImpl)methodInvocation.getThis();
			// Method Name
			String methodName = methodInvocation.getMethod().getName();
			//methodInvocation.getMethod().getAnnotations();
			// Method Parameter
			Object[] params = methodInvocation.getArguments();
			
			// Update or Delete
			if (methodName.startsWith(DaoConstant.DELETE_ALL_PREFIX) || methodName.startsWith(DaoConstant.UPDATE_ALL_PREFIX)) {
				if (log.isDebugEnabled()) {
					log.debug("Quidos Framework V1.0 : The update or delete method Invoked ");
				}
				return baseDaoImpl.executeHql(hql, params);
			}
			
			if (methodName.startsWith(DaoConstant.FIND_UNIQUE_PREFIX)){
				List tmpList = baseDaoImpl.queryHql(hql, params);
				if (CollectionUtils.isEmpty(tmpList)){
					return null;
				}else{
					return tmpList.get(0);
				}
			}
			
			if (methodName.startsWith(DaoConstant.FIND_PAGE_BREAK_PREFIX)) {
				if (params == null || params.length < 2) {
					throw new java.lang.IllegalArgumentException("Quidos Framework V1.0 : The PageBreak Illegal Argument length < 2");
				}
				Object[] newParams = new Object[params.length - 2];
				for (int i = 0; i < newParams.length; i++) {
					newParams[i] = params[i];
				}
				PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult = new PageBreakFirstAndMaxResultVO();
				voPageBreakFirstAndMaxResult.setFirstResult( (int)((Long)params[params.length - 2]).longValue());
				voPageBreakFirstAndMaxResult.setMaxResult( (int)((Long)params[params.length - 1]).longValue());
				return baseDaoImpl.queryHql(hql, newParams, voPageBreakFirstAndMaxResult);
			}

			if (methodName.startsWith(DaoConstant.FIND_NUMBER_PREFIX)) {
				return baseDaoImpl.queryHqlNumber(hql, params);
			}

			if (methodName.startsWith(DaoConstant.FIND_PREFIX)) {
				return baseDaoImpl.queryHql(hql, params);
			}
			
		}
		
		//No Annonation
		BaseDaoImpl baseDaoImpl = (BaseDaoImpl)methodInvocation.getThis();
		// Method Name
		String methodName = methodInvocation.getMethod().getName();
		//methodInvocation.getMethod().getAnnotations();
		// Method Parameter
		Object[] params = methodInvocation.getArguments();
		// Query Name
		
		String queryName = baseDaoImpl.getNamingStrategy().getNamingOfQuery(methodClazz, methodInvocation.getMethod());
		if (log.isDebugEnabled()) {
			log.debug("Quidos Framework V1.0 : The query name : " + queryName);
		}
		// Update or Delete
		if (methodName.startsWith(DaoConstant.DELETE_ALL_PREFIX) || methodName.startsWith(DaoConstant.UPDATE_ALL_PREFIX)) {
			if (log.isDebugEnabled()) {
				log.debug("Quidos Framework V1.0 : The update or delete method Invoked ");
			}
			return baseDaoImpl.execute(queryName, params);
		}
		
		if (methodName.startsWith(DaoConstant.FIND_UNIQUE_PREFIX)){
			List tmpList = baseDaoImpl.query(queryName, params);
			if (CollectionUtils.isEmpty(tmpList)){
				return null;
			}else{
				return tmpList.get(0);
			}
		}
		
		if (methodName.startsWith(DaoConstant.FIND_PAGE_BREAK_PREFIX)) {
			if (params == null || params.length < 2) {
				throw new java.lang.IllegalArgumentException("Quidos Framework V1.0 : The PageBreak Illegal Argument length < 2");
			}
			Object[] newParams = new Object[params.length - 2];
			for (int i = 0; i < newParams.length; i++) {
				newParams[i] = params[i];
			}
			PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult = new PageBreakFirstAndMaxResultVO();
			voPageBreakFirstAndMaxResult.setFirstResult( (int)((Long)params[params.length - 2]).longValue());
			voPageBreakFirstAndMaxResult.setMaxResult( (int)((Long)params[params.length - 1]).longValue());
			return baseDaoImpl.query(queryName, newParams, voPageBreakFirstAndMaxResult);
		}

		if (methodName.startsWith(DaoConstant.FIND_NUMBER_PREFIX)) {
			return baseDaoImpl.queryNumber(queryName, params);
		}

		if (methodName.startsWith(DaoConstant.FIND_PREFIX)) {
			return baseDaoImpl.query(queryName, params);
		}

		throw new NoSupportDaoMethodException("Quidos.Framework V1.0 : No Support Dao Method Exception,Please Check Method Name rule !");
	}

	@SuppressWarnings("unchecked")
	public boolean implementsInterface(Class clazz) {
		return clazz.isInterface() && IBaseDao.class.isAssignableFrom(clazz);
	}

}
