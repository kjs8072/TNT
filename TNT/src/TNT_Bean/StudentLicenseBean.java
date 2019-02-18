package TNT_Bean;

import java.sql.Date;

public class StudentLicenseBean {

	private String t_license_code;
	private Date t_license_start_date;
	private Date t_license_end_date;
	private int license_num;
	private int student_num;
	
	public String getT_license_code() {
		return t_license_code;
	}
	public void setT_license_code(String t_license_code) {
		this.t_license_code = t_license_code;
	}
	public Date getT_license_start_date() {
		return t_license_start_date;
	}
	public void setT_license_start_date(Date t_license_start_date) {
		this.t_license_start_date = t_license_start_date;
	}
	public Date getT_license_end_date() {
		return t_license_end_date;
	}
	public void setT_license_end_date(Date t_license_end_date) {
		this.t_license_end_date = t_license_end_date;
	}
	public int getLicense_num() {
		return license_num;
	}
	public void setLicense_num(int license_num) {
		this.license_num = license_num;
	}
	public int getStudent_num() {
		return student_num;
	}
	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}
}
