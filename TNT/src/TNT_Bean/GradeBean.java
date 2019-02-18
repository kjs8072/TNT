package TNT_Bean;

import java.sql.Date;

public class GradeBean {
	private int score_num;
	private int score;
	private Date test_date;
	private String test_division;
	private String test_result;
	private int detail_num;
	private int student_num;
	
	public int getScore_num() {
		return score_num;
	}
	public void setScore_num(int score_num) {
		this.score_num = score_num;
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
	public int getDetail_num() {
		return detail_num;
	}
	public void setDetail_num(int detail_num) {
		this.detail_num = detail_num;
	}
	public int getStudent_num() {
		return student_num;
	}
	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}
	
	
}
