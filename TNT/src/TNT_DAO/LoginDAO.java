package TNT;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO {

	Connection conn;
	PreparedStatement pstmt;

	String jdbc_dirver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@192.168.111.136:1521:TNT";

	void connect() {
		try {
			Class.forName(jdbc_dirver);
			conn = DriverManager.getConnection(jdbc_url, "admin", "admin");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean funcStaff(int id, String pw) {
		connect();
		CallableStatement cs;
		String sql = "{call staff_login_check(?, ?)}";

		try {
			cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, java.sql.Types.INTEGER);
			cs.setInt(1, id);
			cs.setString(2, pw); // 교직원 password 값
			cs.execute();
			int result = cs.getInt(1);
//			System.out.println(cs.getString(1) + " => sussess ");
			cs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	public boolean funcStudent(int id, String pw) {
		connect();
		CallableStatement cs;
		String sql = "{? = call log_in_check(?, ?)";

		try {
			cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, java.sql.Types.INTEGER);
			cs.setInt(2, id);
			cs.setString(3, pw); // 학생 password 값
			cs.execute();
			int result = cs.getInt(1);
//			System.out.println(cs.getInt(1) + " => success ");
			cs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<LoginBean> studentDBselect() {
		connect();
		String sql = "select * from students ";
		ArrayList<LoginBean> login = new ArrayList<>();
		LoginBean bean = null;

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new LoginBean();
				bean.setUserid(1);
				bean.setPasswd("passwd");

				login.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return login;

	}

	public ArrayList<LoginBean> staffDBselect() {
		connect();
		String sql = "select * from staffs ";
		ArrayList<LoginBean> login = new ArrayList<>();
		LoginBean bean = null;

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new LoginBean();
				bean.setUserid(1);
				bean.setPasswd("passwd");

				login.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return login;

	}

	public boolean studentsDBinsert(LoginBean loginbean) {
		connect();
		String sql = "insert into students (student_id, student_pass)" + "values(?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginbean.getUserid());
			pstmt.setString(2, loginbean.getPasswd());

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean staffsDBinsert(LoginBean loginbean) {
		connect();
		String sql = "insert into staffs (staff_id, staff_pass)" + "values(?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginbean.getUserid());
			pstmt.setString(2, loginbean.getPasswd());

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

}
