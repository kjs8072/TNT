package TNT_DAO;


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
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";//ip,db¹Ù²ã¾ßÇÔ

	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "hr", "hr");//admin oracle·Î ¹Ù²Ù±â
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

	public ArrayList<StudentBean> getInfoList(){
		connect();
		String sql="select student_id, student_name, student_birth, student_gender, student_phone, student_address, student_univ_coll, student_major " 
				+ " from students";
		
		ArrayList<StudentBean> list = new ArrayList<>();
		StudentBean bean = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new StudentBean();
				bean.setStudent_name(rs.getString("student_name"));
				bean.setStudent_birth(rs.getDate("student_birth"));
				bean.setStudent_gender(rs.getString("gender"));
				bean.setStudent_phone(rs.getString("student_phone"));
				bean.setStudent_address(rs.getString("student_address"));
				bean.setStudent_univ_coll(rs.getString("student_univ_coll"));
				bean.setStudent_major(rs.getString("student_major"));
				bean.setStudent_id(rs.getString("student_id"));
				
				list.add(bean);
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
	
	public int funcStudent_check(String id) {
	      connect();
	      CallableStatement cs;
	      String sql = "{? = call studid_check(?)";
	      int result = 0;

	      try {
	         cs = conn.prepareCall(sql);
	         cs.registerOutParameter(1, java.sql.Types.INTEGER);
	         cs.setString(2, id);
	         cs.execute();
	         result = cs.getInt(1);
	         System.out.println("llllllllllllllllllllllll"+result);
//	         System.out.println(cs.getInt(1) + " => success ");
	         cs.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return 0;
	      }
	      return result;
	   }
	
	public boolean insertDB(StudentBean membership) { //»ðÀÔ
		connect();
		String sql = "insert into students (student_id,student_pw,student_name,sysdate,student_gender,student_phone,student_address,student_complete_edu,student_univ_coll,student_major)"
					+ " values (?,?,?,?,?,?,?,?,?) ";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, membership.getStudent_id());
				pstmt.setString(2, membership.getStudent_pass()); //ex)
				pstmt.setString(3, membership.getStudent_name());
				pstmt.setString(4, membership.getStudent_gender());
				pstmt.setString(5, membership.getStudent_phone());
				pstmt.setString(6, membership.getStudent_address());
				pstmt.setString(7, membership.getStudent_complete_edu());
				pstmt.setString(8, membership.getStudent_univ_coll());
				pstmt.setString(9, membership.getStudent_major());
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			} finally {
				disconnect();
			}
			return true;
	}
	
}
