package dwz.demo.junit3;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class ModelTestSuite extends TestCase{

	public static Test suite() {
		System.out.println("ModelTestSuite suite...");
		TestSuite suite = new TestSuite("model test");
		suite.addTestSuite(ClassTest.class);
		return suite;
	}

	public void testSuite() {
		System.out.println("ModelTestSuite testSuite...");
		junit.textui.TestRunner.run(suite());
	}
}
