package tools;

import java.util.ArrayList;
import java.util.Collection;

import dwz.framework.el.ElUtility;

public class ElUtilityTest {
	public static void main(String[] args) {
		String o = "aaa";
		Collection<String> c = new ArrayList<String>();
		c.add("aaa");
		c.add("aaa");
		c.add("aaa");
		System.out.println("ElUtility.contains: "+ElUtility.contains(o, c));
		System.out.println(c.size());
	}
}
