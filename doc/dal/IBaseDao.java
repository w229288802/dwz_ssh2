package uk.co.quidos.framework.persistence.dao;

import java.util.List;
import java.util.Map;

import uk.co.quidos.framework.persistence.dao.vo.PageBreakFirstAndMaxResultVO;

public interface IBaseDao<T,PK extends java.io.Serializable> extends IDao{
	
	void insert(T model);
	
	void update(T model);
	
	void delete(T model);
	
	void deleteById(PK modelPK);
	
	void deleteByIds(List<PK> pks);
	
	boolean isExist(PK modelPk);
	
	T findByPrimaryKey(PK modelPK);
	
	List<T> findByPrimaryKeys(List<PK> pks);
	
	List<T> findAll();
	
	List<T> findAll(OrderType orderType,String propertyName);
	
	long findAllNumber();
	
	void insertBatch(List<T> modelList);
	
	void updateBatch(List<T> modelList);
	
	void deleteBatch(List<T> modelList);
	
	List<?> queryHql(final String hql, final Object[] params);

	List<?> queryHql(final String hql, final Object[] params, final PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult);

	Number queryHqlNumber(final String hql, final Object[] params);

	int executeHql(final String hql, final Object[] params);

	List<?> querySql(final Map<String, Class<?>> entityBundle, final String sql, final Object[] params, final PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult);

	List<?> querySql(final Map<String, Class<?>> entityBundle, final String sql, final Object[] params);

	Number querySqlNumber(final Map<String, Class<?>> entityBundle, final String sql, final Object[] params);

	int executeSql(final Map<String, Class<?>> entityBundle, final String sql, final Object[] params);
	
	List<?> query(final String queryName,final Object[] params);
	
	List<?> query(final String queryName, final Object[] params, final PageBreakFirstAndMaxResultVO voPageBreakFirstAndMaxResult);
	
	Number queryNumber(final String queryName, final Object[] params);
	
	int execute(final String queryName,final Object[] params);
	
}
