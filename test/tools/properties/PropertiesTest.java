package tools.properties;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class PropertiesTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		Properties props = new Properties();
		try {
			props.load(PropertiesTest.class
					.getResourceAsStream("test.properties"));
			System.out.println(props.getProperty("app.test.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}

		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		URL url = loader.getResource("spring_test.cfg.xml");
		File file = new File(url.getFile());
		System.out.println(file.getAbsolutePath());
		
		Properties props2 = new Properties();
		try {
			props2.load(loader.getResourceAsStream("spring_test.cfg.xml"));
			for(Object o: props2.keySet()){
				System.out.println(o);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
