package tools.xml;

import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;


public class Dom4jTest {

	private static Document doc;
	static {
		SAXReader reader = new SAXReader();
		try {
			doc = reader.read(Dom4jTest.class
					.getResourceAsStream("ExternalDefinitions.xml"));
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		long lasting = System.currentTimeMillis();
		try {
			Element root = doc.getRootElement();
			
//			for (Iterator i = root.elementIterator("Country"); i.hasNext();) {
//				Element foo = (Element) i.next();
//				System.out.println("Country-Code:" + foo.elementText("Country-Code"));
//				System.out.println(foo.getPath());
//				System.out.println(foo.element("Recommendation").elementText("Improvement-Number"));
//				
//				List list = foo.selectNodes("//Recommendation" );
//		        Node node = foo.selectSingleNode("//Recommendation/Improvement-Summary[@language='2']");
//
//		        System.out.println(list.size());
//		        System.out.println(node.getStringValue());
//			}

			for (Element foo : (List<Element>)root.elements("Addendum")){
				Node node = foo.selectSingleNode("//Addendum-Text[@language='2']");
				System.out.println(node.getStringValue());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("运行时间：" + (System.currentTimeMillis() - lasting)
				+ " 毫秒");
	}
}
