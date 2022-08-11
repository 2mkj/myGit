package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO2 {
	private DataSource ds;
	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public MemberDAO2() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : "+ ex);
		}
	}
	public int isId(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; //DB에 해당 id가 없습니다.
		try {
			conn = ds.getConnection();

			String sql = "select email from memberall where email = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0; //DB에 해당 id가 있습니다.
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
		return result;
	}

	public Memberall member_info(String email) {
		Memberall m = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = ds.getConnection();
			
			String sql = "select * from memberall where email = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Memberall();
				m.setEmail(rs.getString("email"));
				m.setPass(rs.getString("pass"));
				m.setUser_name(rs.getString("user_name"));
				m.setName(rs.getString("name"));
				m.setJumin1(rs.getString("jumin1"));
				m.setJumin2(rs.getString("jumin2"));
				m.setGender(rs.getString("gender"));
				m.setPhone(rs.getString("phone"));
				m.setPost(rs.getString("post"));
				m.setAddress(rs.getString("address"));
				m.setMemberfile(rs.getString("memberfile"));
				
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


	public int update(Memberall m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			if(m.getMemberfile() != null) { // 프로필 사진 수정 안함 
			pstmt = conn.prepareStatement(
						 "update memberall "
					   + " set pass=?, user_name=?, name=?, "
					   + "     phone=?, post=?, address=?, memberfile=? "
					   + " where email=? ");
			pstmt.setString(1, m.getPass());
			pstmt.setString(2, m.getUser_name());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getPost());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getMemberfile());
			pstmt.setString(8, m.getEmail());
			result = pstmt.executeUpdate();
			}else {							// 프로필 사진 수정함 
			pstmt = conn.prepareStatement(
						 "update memberall "
					   + " set pass=?, user_name=?, name=?, "
					   + "     phone=?, post=?, address=? "
					   + " where email=? ");
			pstmt.setString(1, m.getPass());
			pstmt.setString(2, m.getUser_name());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getPost());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getEmail());
			result = pstmt.executeUpdate();
			}
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


	public int delete(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
		try {
			conn = ds.getConnection();
			String sql = "delete memberall where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
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
	public int isId(String email, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; //아이디가 존재하지 않습니다.
		try {
			conn = ds.getConnection();

			String sql = "select email, pass from memberall where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
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
	
	
	public int insert(Memberall m) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			System.out.println("getConnection : insert()");
			
			pstmt = con.prepareStatement(
					"insert into memberall "
					+ " values(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getUser_name());
			pstmt.setString(4, m.getName());
			pstmt.setString(5, m.getJumin1());
			pstmt.setString(6, m.getJumin2());
			pstmt.setString(7, m.getGender());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getPost());
			pstmt.setString(10, m.getAddress());
			pstmt.setString(11, m.getMemberfile());
			result = pstmt.executeUpdate();//삽입 성공시 result는 1
			
		//primary key 제약조건 위반했을 경우 발생하는 에러
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			result = -1;
			System.out.println("멤버 아이디 중복 에러입니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
	public String isIDPW(String name, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		try {
			conn = ds.getConnection();

			String sql = "select email from memberall where name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				email = rs.getString("email");
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
		return email;
	}


}
