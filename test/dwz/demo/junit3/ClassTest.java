package dwz.demo.junit3;

import junit.framework.TestCase;

import org.junit.Test;

public class ClassTest extends TestCase{

	protected void setUp() {
		System.out.println("ClassTest setUp...");
	}
	@Test
	public void testShow() {
		System.out.println("ClassTest testShow()");
	}
	
}
