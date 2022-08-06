package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	private DataSource ds;
	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : "+ ex);
		}
	}


	public int isId(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; //아이디가 존재하지 않습니다.
		try {
			conn = ds.getConnection();

			String sql = "select id, password from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(2).equals(pass)) {
					result = 1; //아이디와 비밀번호 일치하는 경우
				} else {
					result = 0; //비밀번호가 일치하지 않는 경우
				}
			}
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (conn != null)
					conn.close(); 
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} 
		return result;
	}


	public Member member_info(String id) {
		Member m = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = ds.getConnection();
			
			String sql = "select * from member where id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAge(rs.getInt(4));
				m.setGender(rs.getString(5));
				m.setEmail(rs.getString(6));
				m.setMemberfile(rs.getString(7));
			}
		} catch (Exception se) {
			se.printStackTrace();
		}  finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} 
		return m;
	}


	public int update(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member "
				   + "set name=?, age=?, gender=?, email=?, memberfile=? "
				   + "where id=? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getMemberfile());
			pstmt.setString(6, m.getId());
			result = pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getDetail() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}


	public int delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
		try {
			conn = ds.getConnection();
			String sql = "delete member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (conn != null)
					conn.close(); 
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} 
		return result;
	}


}
