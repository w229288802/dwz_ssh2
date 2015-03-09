package tools;

import java.util.ArrayList;

public class EnumTest {
	private static enum ApplicationType {
		INTERIM("Interim Certification"), FULL("Full Certification");
		private final String value;

		ApplicationType(String value) {
			this.value = value;
		}

		public String getId() {
			return this.toString();
		}

		public String getName() {
			return value;
		}
		
		public ArrayList<CertificateType> getCertificateTypes(){
			return CertificateType.values(this.toString());
		}
	}
	
	private static enum CertificateType {

		CG_2079_11("C&G 2079-11 Category I", "FULL"), CITB_J11_11(
				"CITB J11-11 Category I", "FULL"), CG_2079_12(
				"C&G 2079-12 Category II", "FULL"), CITB_J11_12(
				"CITB J11-12 Category II", "FULL"), CG_2079_13(
				"C&G 2079-13 Category III", "FULL"), CITB_J11_13(
				"CITB J11-13 Category III", "FULL"), CG_2079_14(
				"C&G 2079-14 Category IV", "FULL"), CITB_J11_14(
				"CITB J11-14 Category IV", "FULL"), CG_2078("C&G 2078",
				"INTERIM"), CITB_J01("CITB J01", "INTERIM"), IN_HOUSE_QUALIFICATION(
				"In-house Qualification", "INTERIM");
		private final String value;
		private final String leval;

		CertificateType(String value, String level) {
			this.value = value;
			this.leval = level;
		}

		public String getId() {
			return this.toString();
		}

		public String getName() {
			return value;
		}

		static public ArrayList<CertificateType> values(String level) {
			ArrayList<CertificateType> certList = new ArrayList<CertificateType>();
			if (level != null) {
				CertificateType[] certs = CertificateType.values();
				for (CertificateType cert : certs) {
					if (cert.leval.equals(level)) {
						certList.add(cert);
					}
				}
			}
			return certList;
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		System.out.println("------ FULL level ------");
//		for (CertificateType cert : CertificateType.values("FULL")) {
//			System.out.println(cert.getId() + " : " + cert.getName());
//		}
//
//		System.out.println("------ INTERIM level ------");
//		for (CertificateType cert : CertificateType.values("INTERIM")) {
//			System.out.println(cert.getId() + " : " + cert.getName());
//		}
//
//		System.out.println("------ All level ------");
//		for (CertificateType cert : CertificateType.values()) {
//			System.out.println(cert.getId() + " : " + cert.getName());
//		}
//		
		System.out.println("------ ApplicationType.FULL.getCertificateTypes() ------");
		for (CertificateType cert : ApplicationType.FULL.getCertificateTypes()) {
			System.out.println(cert.getId() + " : " + cert.getName());
		}
		
		System.out.println("------ ApplicationType.INTERIM.getCertificateTypes() ------");
		for (CertificateType cert : ApplicationType.INTERIM.getCertificateTypes()) {
			System.out.println(cert.getId() + " : " + cert.getName());
		}
		


	}

	static boolean isDefined(Enum<?> [] ems, String str){
		for (Enum<?> em : ems){
			if (em.toString().equals(str)) return true;
		}
		return false;
	}
}
