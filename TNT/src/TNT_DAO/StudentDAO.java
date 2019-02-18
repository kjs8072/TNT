package TNT_DAO;

//지선이바보
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import TNT_Bean.StudentBean;
import TNT_Bean.TestvuBean;
 
public class StudentDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	CallableStatement cs = null;
	ResultSet rs = null;

	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";//ip,db바꿔야함

	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "hr", "hr");//admin oracle로 바꾸기
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public ArrayList<StudentBean> getStudents() {
		connect();
		String sql = "select student_num, student_name, student_birth, student_gender, student_phone, "
							+ "student_address, student_complete_edu, student_univ_coll, student_major "
							+ "from students order by 1";
		
		ArrayList<StudentBean> list = new ArrayList<>();
		StudentBean student = null;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				student = new StudentBean();
				student.setStudent_num(rs.getInt("student_num"));
				student.setStudent_name(rs.getString("student_name"));
				student.setStudent_birth(rs.getDate("student_birth"));
				student.setStudent_gender(rs.getString("student_gender"));
				student.setStudent_phone(rs.getString("student_phone"));
				student.setStudent_address(rs.getString("student_address"));
				student.setStudent_complete_edu(rs.getString("student_complete_edu"));
				student.setStudent_univ_coll(rs.getString("student_univ_coll"));
				student.setStudent_major(rs.getString("student_major"));

				list.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<TestvuBean> getScore() {

		connect();
		
		String sql = "select * from test_vu";
		
		ArrayList<TestvuBean> list = new ArrayList<>();
		TestvuBean vu= null;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				vu = new TestvuBean();
				vu.setStudent_name(rs.getString("student_name"));
				vu.setCourse_name(rs.getString("course_name"));
				vu.setSubject_name(rs.getString("subject_name"));
				vu.setScore(rs.getInt("score"));
				vu.setTest_date(rs.getDate("test_date"));
				vu.setTest_division(rs.getString("test_division"));
				vu.setTest_result(rs.getString("test_result"));

				list.add(vu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
