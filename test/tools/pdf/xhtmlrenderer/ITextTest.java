package tools.pdf.xhtmlrenderer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import dwz.framework.utils.pdf.PdfUtil;

import com.lowagie.text.DocumentException;

public class ITextTest {

	/**
	 * @param args
	 * @throws ParserConfigurationException 
	 * @throws IOException 
	 * @throws SAXException 
	 * @throws FileNotFoundException 
	 * @throws DocumentException 
	 */
	public static void main(String[] args) {
//		generatePdf("EPC_EAW_en.html");
//		generatePdf("EPC_EAW_cy.html");
//		generatePdf("cn.html");
//		generatePdf("footnote/footnote2.html");
//		generatePdf("footnote/footer-test.html");
//		generatePdf("footnote/footer-test2.html");
//		generatePdf("EPC_EAW_rating.html");
		generatePdf("EPC_EAW_en.html");
//		generatePdf("EPC_EAW_cy.html");
	}

	

	private static void generatePdf(String xhtmlFileName) {

		try {
			String basePath = System.getProperty("user.dir")
					+ "/test/tools/pdf/xhtmlrenderer";
			String xhtmlPath = basePath + "/" + xhtmlFileName;
			String pdfPath = basePath + "/" + xhtmlFileName.substring(0, xhtmlFileName.lastIndexOf("."))+".pdf";
			
//			Map<String, Object> pdfMap = new HashMap<String, Object>();
//			String xhtmlContent = TemplateUtil.template2String(Utils.getFileContent(inputFile),
//					pdfMap, false);
//			PdfUtil.saveContent2Pdf(basePath, pdfPath, xhtmlContent);

			PdfUtil.xhtml2Pdf(basePath, pdfPath, new File(xhtmlPath));
			
			String waterPdfPath = pdfPath.substring(0, pdfPath.lastIndexOf(".")) + "-water.pdf";
			PdfUtil.buildPDFWater(pdfPath, waterPdfPath, "PREVIEW");

		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
}
