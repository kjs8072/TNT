package TNT_Bean;

public class LicenseBean {

	private int license_num;
	private String license_name;
	private String certificate_authority;
	private String license_type;
	
	public int getLicense_num() {
		return license_num;
	}
	public void setLicense_num(int license_num) {
		this.license_num = license_num;
	}
	public String getLicense_name() {
		return license_name;
	}
	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}
	public String getCertificate_authority() {
		return certificate_authority;
	}
	public void setCertificate_authority(String certificate_authority) {
		this.certificate_authority = certificate_authority;
	}
	public String getLicense_type() {
		return license_type;
	}
	public void setLicense_type(String license_type) {
		this.license_type = license_type;
	}
}
