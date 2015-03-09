package tools;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import dwz.framework.utils.DateUtil;

public class DateTest {
	static void testCalendar() {
		System.out.println("run testCalendar()......");
		Calendar calendar = new GregorianCalendar();
		calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) + 3);
		System.out.println(new Date(calendar.getTimeInMillis()));
		
		System.out.println(calendar.get(Calendar.YEAR)+"-"+calendar.get(Calendar.MONTH)
				+"-"+calendar.get(Calendar.DAY_OF_MONTH));
		
	}

	static void testDateFormat() {
		System.out.println("run testDateFormat()......");
		DateFormat df = new SimpleDateFormat("dd MMMM yyyy", Locale.UK);
		System.out.println(df.format(new Date()));
		try {
			System.out.println(new SimpleDateFormat("yyyy-MM-dd").parse(
					"2009-07-27").getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

	static void interest() {
		int year = 18, capitalPerYear = 7300;
		double interest = 0.1, totalCapital = 0, total = 0;
		for (int i = 0; i < year; i++) {
			totalCapital += capitalPerYear;
			double capital = (total + capitalPerYear) * interest;
			total += capitalPerYear + capital;
			System.out.println("Year " + i + " : " + totalCapital + " - "
					+ total + " - " + capital);
		}
	}

	/**
	 * @param args
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException {
		testCalendar();
		testDateFormat();
		interest();

		SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy", Locale.UK);
		System.out.println(sdf.format(new Date()));
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = df.parse("2010-08-10");
		System.out.println("firstOfQuarter:"+DateUtil.firstOfQuarter(date));
		System.out.println("lastOfQuarter:"+DateUtil.lastOfQuarter(date));
	}

}
