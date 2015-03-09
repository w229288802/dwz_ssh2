package uk.co.quidos.framework.persistence.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import uk.co.quidos.framework.persistence.dao.DaoConstant;
import uk.co.quidos.framework.persistence.dao.IBaseDao;
import uk.co.quidos.framework.persistence.dao.INamingStrategy;
import uk.co.quidos.framework.persistence.dao.OrderType;
import uk.co.quidos.framework.persistence.dao.vo.PageBreakFirstAndMaxResultVO;

public class BaseDaoImpl<T,PK extends java.io.Serializable> extends HibernateDaoSupport implements IBaseDao<T,PK> {
	private Log log = LogFactory.getLog(this.getClass());
	
	private Class<T> clazz;
	
	private INamingStrategy namingStrategy;
	public INamingStrategy getNamingStrategy() {
		if (namingStrategy == null){
			namingStrategy = new IntegratedNamingStrategyImpl();
		}
		return namingStrategy;
	}
	public void setNamingStrategy(INamingStrategy namingStrategy) {
		this.namingStrategy = namingStrategy;
	}

	public BaseDaoImpl(Class<T> clazz){
		this.clazz = clazz;
	}
	
	public void delete(T model) {
		this.getHibernateTemplate().delete(model);
	}
	
	@SuppressWarnings("unchecked")
	public List findAll() {
		Package thePackage = clazz.getPackage();
		String packageName = "";
		if (thePackage != null){
			packageName = thePackage.getName() + ".";
		}else{
			packageName = "";
		}
		
		String clazzName = this.clazz.getSimpleName();
		clazzName = packageName + clazzName;
		final String listHql = "from " + clazzName;
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(listHql);
				return query.list();
			}
		});
		return (List)o;
	}

	@SuppressWarnings("unchecked")
	public List findAll(OrderType orderType,String propertyName) {
		Assert.notNull(orderType);
		Assert.hasText(propertyName);
		
		Package thePackage = clazz.getPackage();
		String packageName = "";
		if (thePackage != null){
			packageName = thePackage.getName() + ".";
		}else{
			packageName = "";
		}
		
		String clazzName = this.clazz.getSimpleName();
		clazzName = packageName + clazzName;
		
		final String listHql = "from " + clazzName + "order by " + propertyName + " " + orderType.getValue();
		
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(listHql);
				return query.list();
			}
		});
		return (List)o;
	}
	
	@SuppressWarnings("unchecked")
	public T findByPrimaryKey(PK modelPK) {
		
		try{
			T model = (T)this.getHibernateTemplate().load(clazz, modelPK);
			return model;
		}catch(ObjectNotFoundException e){
			log.info("ObjectNotFoundException");
		}catch(ObjectRetrievalFailureException e){
			log.info("ObjectRetrievalFailureException");
		}
		return null;
	}

	public List<T> findByPrimaryKeys(List<PK> pks) {
		if (!CollectionUtils.isEmpty(pks)){
			List<T> ts = new ArrayList<T>();
			for (PK pk : pks){
				T t = this.findByPrimaryKey(pk);
				ts.add(t);
			}
			if (!CollectionUtils.isEmpty(ts)){
				return ts;
			}
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public boolean isExist(PK modelPk) {
		try{
			T model = (T)this.getHibernateTemplate().load(clazz, modelPk);
			if (model != null){
				return true;
			}
		}catch(ObjectNotFoundException e){
			log.info("ObjectNotFoundException");
		}catch(ObjectRetrievalFailureException e){
			log.info("ObjectRetrievalFailureException");
		}
		return false;
	}
	
	public void insert(T model) {
		this.getHibernateTemplate().save(model);
	}

	public void update(T model) {
		this.getHibernateTemplate().merge(model);
	}
	
	public void deleteById(PK modelPK) {
		T model = this.findByPrimaryKey(modelPK);
		if (model != null){
			this.delete(model);
		}
	}
	
	public void deleteByIds(List<PK> pks) {
		if (!CollectionUtils.isEmpty(pks)){
			for (PK pk : pks){
				this.deleteById(pk);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public long findAllNumber() {
		Package thePackage = clazz.getPackage();
		String packageName = "";
		if (thePackage != null){
			packageName = thePackage.getName() + ".";
		}else{
			packageName = "";
		}

		String clazzName = this.clazz.getSimpleName();
		clazzName = packageName + clazzName;
		final String listHql = "select count(model) as c from " + clazzName + " as model";
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(listHql);
				return query.list();
			}
		});
		List<Long> allRowsList = (List)o;
		if (allRowsList == null || allRowsList.size() <=0){
			throw new java.lang.RuntimeException();
		}
		return allRowsList.get(0);
	}

	public void insertBatch(final List<T> modelList) {
		this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				for (int i=0;i<modelList.size();i++){
					session.save(modelList.get(i));
					if (i % DaoConstant.INSERT_SIZE == 0){
						session.flush();
					}
				}
				return null;
			}
		});
	}

	public List<?> queryHql(final String hql,final Object[] params){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				return query.list();
			}
		});
		return (List<?>)o;
	}
	
	public List<?> queryHql(final String hql,final Object[] params,final PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				if (voPageBreakFirstAndMaxResult != null){
					query.setFirstResult(voPageBreakFirstAndMaxResult.getFirstResult());
					query.setMaxResults(voPageBreakFirstAndMaxResult.getMaxResult());
				}
				return query.list();
			}
		});
		return (List<?>)o;
	}
	
	@SuppressWarnings("unchecked")
	public Number queryHqlNumber(final String hql, final Object[] params){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				List<Number> tmpList = query.list();
				return ((tmpList == null || tmpList.size() <=0) ? null : tmpList.get(0));
			}
		});
		return (Number)o;
	}
	
	public int executeHql(final String hql, final Object[] params){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				return query.executeUpdate();
			}
		});
		return (Integer)o;
	}
	
	public List<?> querySql(final Map<String, Class<?>> entityBundle, final String sql,final Object[] params,final PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						sqlQuery.setParameter(i, params[i]);
					}
				}
				if (voPageBreakFirstAndMaxResult != null){
					sqlQuery.setFirstResult(voPageBreakFirstAndMaxResult.getFirstResult());
					sqlQuery.setMaxResults(voPageBreakFirstAndMaxResult.getMaxResult());
				}
				Set<String> keySet = entityBundle.keySet();
				for (String key:keySet){
					sqlQuery.addEntity(key, entityBundle.get(key));
				}
				return sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			}
		});
		return (List<?>)o;
	}
	
	public List<?> querySql(final Map<String, Class<?>> entityBundle, final String sql,final Object[] params){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						sqlQuery.setParameter(i, params[i]);
					}
				}
				if (entityBundle != null){
				Set<String> keySet = entityBundle.keySet();
					for (String key:keySet){
						sqlQuery.addEntity(key, entityBundle.get(key));
					}
				}
				return sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			}
		});
		return (List<?>)o;
	}
	
	@SuppressWarnings("unchecked")
	public Number querySqlNumber(final Map<String, Class<?>> entityBundle, final String sql,final Object[] params){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						sqlQuery.setParameter(i, params[i]);
					}
				}
				if (entityBundle != null){
					Set<String> keySet = entityBundle.keySet();
					for (String key:keySet){
						sqlQuery.addEntity(key, entityBundle.get(key));
					}
				}
				List<Map<String,Number>> tmpMapList = sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
				if (CollectionUtils.isEmpty(tmpMapList)){
					return null;
				}else{
					Map<String,Number> tmpMap = tmpMapList.get(0);
					return tmpMap.values().toArray()[0];
				}
			}
		});
		return (Number)o;
	}
	
	public int executeSql(final Map<String, Class<?>> entityBundle,final String sql,final Object[] params){
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						sqlQuery.setParameter(i, params[i]);
					}
				}
				Set<String> keySet = entityBundle.keySet();
				for (String key:keySet){
					sqlQuery.addEntity(key, entityBundle.get(key));
				}
				return sqlQuery.executeUpdate();
			}
		});
		return (Integer)o;
	}

	public void deleteBatch(final List<T> modelList) {
		this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				for (int i=0;i<modelList.size();i++){
					session.delete(modelList.get(i));
					if (i % DaoConstant.INSERT_SIZE == 0){
						session.flush();
					}
				}
				return null;
			}
		});
	}

	public void updateBatch(final List<T> modelList) {
		this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				for (int i=0;i<modelList.size();i++){
					session.update(modelList.get(i));
					if (i % DaoConstant.INSERT_SIZE == 0){
						session.flush();
					}
				}
				return null;
			}
		});
	}
	
	public List<?> query(final String queryName, final Object[] params, final PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult) {
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.getNamedQuery(queryName);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				if (voPageBreakFirstAndMaxResult != null){
					query.setFirstResult(voPageBreakFirstAndMaxResult.getFirstResult());
					query.setMaxResults(voPageBreakFirstAndMaxResult.getMaxResult());
				}
				return query.list();
			}
		});
		return (List<?>)o;
	}
	
	public List<?> query(final String queryName, final Object[] params) {
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.getNamedQuery(queryName);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				return query.list();
			}
		});
		return (List<?>)o;
	}
	
	@SuppressWarnings("unchecked")
	public Number queryNumber(final String queryName, final Object[] params) {
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.getNamedQuery(queryName);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				List<Number> tmpList = query.list();
				return ((tmpList == null || tmpList.size() <=0) ? null : tmpList.get(0));
			}
		});
		return (Number)o;
	}
	
	public int execute(final String queryName, final Object[] params) {
		Object o = this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.getNamedQuery(queryName);
				if (params != null && params.length >0){
					for (int i=0; i<params.length; i++){
						query.setParameter(i, params[i]);
					}
				}
				return query.executeUpdate();
			}
		});
		return (Integer)o;
	}
	
}
