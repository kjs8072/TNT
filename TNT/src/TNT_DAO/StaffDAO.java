package TNT_DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StaffDAO {

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:TNT";

		void connect() { //DB¿¬°á
			try {
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, "admin", "oracle");
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

	}
		void disconnect() {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		public boolean insertDB(TNTStaff membership) { //»ðÀÔ
			connect();
			String sql = "insert into staffs (staff_num,staff_id,staff_pass,staff_name,staff_gender,staff_responsibility,staff_address,staff_phone,staff_email)"
						+ " values (?,?,?,?,?,?,?,?,?) ";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, membership.getStaff_num()); //ex)
					pstmt.setInt(2, membership.getStaff_id());
					pstmt.setString(3, membership.getStaff_pass());
					pstmt.setString(4, membership.getStaff_name());
					pstmt.setString(5, membership.getStaff_gender());
					pstmt.setString(6, membership.getStaff_responsibility());
					pstmt.setString(7, membership.getStaff_address());
					pstmt.setString(8, membership.getStaff_phone());
					pstmt.setString(9, membership.getStaff_email());
					pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				} finally {
					disconnect();
				}
				return true;
		}

		public int funcstaff_check(int id) {
		      connect();
		      CallableStatement cs;
		      String sql = "{? = call staff_check(?)";
		      int result = 0;

		      try {
		         cs = conn.prepareCall(sql);
		         cs.registerOutParameter(1, java.sql.Types.INTEGER);
		         cs.setInt(2, id);
		         cs.execute();
		         result = cs.getInt(1);
		         System.out.println("llllllllllllllllllllllll"+result);
//		         System.out.println(cs.getInt(1) + " => success ");
		         cs.close();
		      } catch (SQLException e) {
		         e.printStackTrace();
		         return 0;
		      }
		      return result;
		   }
		
}


