package dwz.business.constants.info;

public enum AdType {
	IMAGE("ͼImage"), FLASH("Flash"), CODE("Code");
	private final String value;

	AdType(String value) {
		this.value = value;
	}

	public String getId() {
		return this.toString();
	}

	public String getName() {
		return value;
	}
}
