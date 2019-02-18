package TNT_Bean;

import java.sql.Date;

public class TestvuBean {

	private String student_name;
	private String course_name;
	private String subject_name;
	private int score;
	private Date test_date;
	private String test_division;
	private String test_result;
	
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getTest_date() {
		return test_date;
	}
	public void setTest_date(Date test_date) {
		this.test_date = test_date;
	}
	public String getTest_division() {
		return test_division;
	}
	public void setTest_division(String test_division) {
		this.test_division = test_division;
	}
	public String getTest_result() {
		return test_result;
	}
	public void setTest_result(String test_result) {
		this.test_result = test_result;
	}
}
