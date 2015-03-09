package tools;


public class RandomTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		java.util.Random r = new java.util.Random();

		for (int i = 0; i < 10; i++) {
			System.out.println(r.nextInt(10));
			System.out.println("random: " + random(1, 1));
		}

		for (int i = 1; i < 10; i++) {
			double num = i/10.0;
			System.out.println("Math.round(" + num + ") = " + Math.round(num));
		}
		

	}

	public static long random(long start, long end) {
		return Math.round(Math.random() * (end - start)) + start;
	}
}
