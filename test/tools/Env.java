package tools;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

public class Env {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		System.setProperty("sun.jnu.encoding", "UTF-8");
		System.setProperty("file.encoding", "UTF-8");
		System.out.println("â ŷ ŵ");
		System.out.println("Hello, it's: " + new Date());
		// print available locales
		Locale list[] = DateFormat.getAvailableLocales();
		System.out.println("======System available locales:======== ");
		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i].toString() + "\t"
					+ list[i].getDisplayName());
		}

		// print JVM default properties
		System.out.println("======System property======== ");
		System.getProperties().list(System.out);
	}

}
