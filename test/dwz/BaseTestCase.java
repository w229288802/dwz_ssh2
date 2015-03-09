package dwz;

import dwz.framework.config.Configuration;
import dwz.framework.core.factory.BusinessFactory;

public abstract class BaseTestCase {
	protected static BusinessFactory bf;
	protected static Configuration appConfig;
	static {
		bf = BusinessFactory.getFactory();
		appConfig = bf.retrieveConfiguration();
	}

	public BaseTestCase(){
		
	}
}
