package tools;

import java.util.Properties;

public class SystemProperties {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(SystemProperties.class.getResource(""));
		System.out.println(System.getProperty("user.dir"));
		Properties props=System.getProperties();
		for (Object p : props.keySet()){
			System.out.println(p + ": " + props.getProperty(p.toString()));
		}
	}

}
