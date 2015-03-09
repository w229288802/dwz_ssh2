package tools;

import org.apache.commons.lang.StringEscapeUtils;


/**
 * example http://www.crjug.org/?q=node/22
 * 
 * @author zhanghuihua
 * 
 */
public class CharacterTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println( StringEscapeUtils.escapeHtml("\""));
		System.out.println(Character.UnicodeBlock.LATIN_EXTENDED_A);
		for (char c = 0; c < Character.MAX_VALUE; c++) {
			if (Character.isJavaIdentifierPart(c)) {
				if (Character.UnicodeBlock.of(c).equals(
						Character.UnicodeBlock.LATIN_EXTENDED_A)) {
					System.out.print(c + " ");
				}
			}
		}
		System.out.println();

		System.out.println(Character.UnicodeBlock.GREEK);
		for (char c = 0; c < Character.MAX_VALUE; c++) {
			if (Character.isJavaIdentifierStart(c)) {
				if (Character.UnicodeBlock.of(c).equals(
						Character.UnicodeBlock.GREEK)) {
					System.out.print(c + " ");
				}
			}
		}
		System.out.println();

		System.out.println(Character.UnicodeBlock.CURRENCY_SYMBOLS);
		for (char c = 0; c < Character.MAX_VALUE; c++) {
			if (Character.isJavaIdentifierStart(c)) {
				if (Character.UnicodeBlock.of(c).equals(
						Character.UnicodeBlock.CURRENCY_SYMBOLS)) {
					System.out.print(c + " ");
				}
			}
		}
		System.out.println();
		

		System.out.println("â ŷ ŵ");

	}

}
