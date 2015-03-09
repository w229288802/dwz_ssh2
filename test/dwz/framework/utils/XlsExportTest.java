package dwz.framework.utils;

import java.util.Date;

import dwz.framework.utils.excel.XlsExport;

public class XlsExportTest {
	private static enum ExportFiled {
		SKU("编号"), NAME("名称"), DATE("日期"), PRICE("金额"), PERCENT("百分比");
		private final String name;

		ExportFiled(String name) {
			this.name = name;
		}

		public String getName() {
			return this.name;
		}
	}

	public static void main(String[] args) {
		System.out.println("开始导出Excel文件: "+System.currentTimeMillis());
		XlsExport e = new XlsExport();

		// header
		e.createRow(0);
		for (ExportFiled filed : ExportFiled.values()) {
			e.setCell(filed.ordinal(), filed.getName());
		}

		String [] list = new String[]{"工商银行","招商银行"};
		e.createListBox(list, 1, 1);
		
		for (int i = 1; i<5000; i++){
			e.createRow(i);
			e.setCell(0, i);
			e.setCell(1, "工商银行");
			e.setCell(2, new Date());
//			e.setCell(3, 19999.99);
			e.setCurrency(3, 19999.99);
			e.setPercent(4, i/100d);
		}

		e.exportXls("e:/test.xls");

		System.out.println("导出Excel文件完成: "+System.currentTimeMillis());
	}
}
