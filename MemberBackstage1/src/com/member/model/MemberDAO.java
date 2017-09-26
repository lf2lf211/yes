package com.member.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO implements MemberInterface {

	private static final String DRIVER = "org.gjt.mm.mysql.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/memberbackstage";
	private static final String USER = "root";
	private static final String PASSWORD = "";

	private static final String INSERT_STMT = "INSERT INTO member"
			+ "( account, password, name, balance,loginIP, loginTime,level,state,superior,superior2,commission)"
			+ "VALUES( ? , ? , ? , ? , ? , ? , ? , ? , ? ,?,?)";
	private static final String UPDATE_STMT = "UPDATE member SET "
			+ "PASSWORD = ?,  "
			+ "NAME = ?,"
			+ "loginIP=?,"
			+ "loginTime=?, "
			+ "level = ?, "
			+ "state = ?,  "

		
			+ "commission = ?  "
			+ "WHERE memberNO = ?";
	private static final String DELETE_STMT = "DELETE FROM member WHERE memberNO = ?";
	private static final String FIND_BY_PK = "SELECT * FROM MEMber WHERE memberNO = ?";
	private static final String FIND_BY_ACCOUNT = "SELECT * FROM MEMber WHERE account = ?";
	private static final String GET_ALL_BY_SUPERIOR = "SELECT * FROM MEMber where superior like ?  order by memberNO";
	private static final String GET_ALL_BY_SUPERIOR2 = "SELECT * FROM MEMber where superior2 like ?  order by memberNO";
	private static final String GET_ALL = "SELECT * FROM MEMber ";

	@Override
	public void add(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getAccount());
			pstmt.setString(2, memberVO.getPassword());
			pstmt.setString(3, memberVO.getName());
			pstmt.setDouble(4, memberVO.getBalance());
			pstmt.setString(5, memberVO.getLoginIP());
			pstmt.setString(6, memberVO.getLoginTime());
			pstmt.setString(7, memberVO.getLevel());
			pstmt.setString(8, memberVO.getState());
			pstmt.setString(9, memberVO.getSuperior());
			pstmt.setString(10, memberVO.getSuperior2());
			pstmt.setInt(11, memberVO.getCommission());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

		
			pstmt.setString(1, memberVO.getPassword());
			pstmt.setString(2, memberVO.getName());

			pstmt.setString(3, memberVO.getLoginIP());
			pstmt.setString(4, memberVO.getLoginTime());
			pstmt.setString(5, memberVO.getLevel());
			pstmt.setString(6, memberVO.getState());

			pstmt.setInt(7, memberVO.getCommission());
			pstmt.setInt(8, memberVO.getMemberNo());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer memberNO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1,memberNO);
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public MemberVO findByPK(Integer memberNO) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, memberNO);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// "INSERT INTO MEM(MEM_ID, MEM_ACCOUNT, MEM_PASSWORD, MEM_NAME, MEM_BIRTHDAY,MEM_ADDRESS,
				//MEM_TEL,MEM_EMAIL,MEM_GENDER,MEM_FOUNDATION_ID,MEM_PHOTO,MEM_FAX)"
				memberVO = new MemberVO();
				memberVO.setMemberNo(rs.getInt("memberNO"));
				memberVO.setAccount(rs.getString("Account"));
				memberVO.setName(rs.getString("name"));
				memberVO.setPassword(rs.getString("Password"));
				memberVO.setBalance(rs.getDouble("balance"));
				memberVO.setLoginIP(rs.getString("loginIP"));
				memberVO.setLoginTime(rs.getString("loginTime"));
				memberVO.setLevel(rs.getString("level"));
				memberVO.setState(rs.getString("state"));
				memberVO.setSuperior(rs.getString("superior"));
				memberVO.setSuperior(rs.getString("superior2"));
				memberVO.setCommission(rs.getInt("Commission"));
			}
			//Area(area_code, area_adress, area_location, area_name)"
			
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("嚙碾嚙瘤 嚙瞌嚙踝蕭嚙羯  " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("嚙璀嚙踝蕭嚙踝蕭嚙踝蕭嚙踝蕭嚙瞋嚙豬潘蕭嚙踝蕭嚙瘤  嚙踝蕭嚙瞌嚙磊嚙踝蕭嚙踝蕭 " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return memberVO;
	}

	@Override
	public MemberVO findByAC(String account) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_ACCOUNT);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// "INSERT INTO MEM(MEM_ID, MEM_ACCOUNT, MEM_PASSWORD, MEM_NAME, MEM_BIRTHDAY,MEM_ADDRESS,
				//MEM_TEL,MEM_EMAIL,MEM_GENDER,MEM_FOUNDATION_ID,MEM_PHOTO,MEM_FAX)"
				memberVO = new MemberVO();
				memberVO.setMemberNo(rs.getInt("memberNO"));
				memberVO.setAccount(rs.getString("Account"));
				memberVO.setName(rs.getString("name"));
				memberVO.setPassword(rs.getString("Password"));
				memberVO.setBalance(rs.getDouble("balance"));
				memberVO.setLoginIP(rs.getString("loginIP"));
				memberVO.setLoginTime(rs.getString("loginTime"));
				memberVO.setLevel(rs.getString("level"));
				memberVO.setState(rs.getString("state"));
				memberVO.setSuperior(rs.getString("superior"));
				memberVO.setSuperior2(rs.getString("superior2"));
				memberVO.setCommission(rs.getInt("commission"));
			}
			//Area(area_code, area_adress, area_location, area_name)"
			
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("嚙碾嚙瘤 嚙瞌嚙踝蕭嚙羯  " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("嚙璀嚙踝蕭嚙踝蕭嚙踝蕭嚙踝蕭嚙瞋嚙豬潘蕭嚙踝蕭嚙瘤  嚙踝蕭嚙瞌嚙磊嚙踝蕭嚙踝蕭 " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> memList = new ArrayList<>();
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemberNo(rs.getInt("memberNO"));
				memberVO.setAccount(rs.getString("Account"));
				memberVO.setPassword(rs.getString("Password"));
				memberVO.setName(rs.getString("name"));
				memberVO.setBalance(rs.getDouble("balance"));
				memberVO.setLoginIP(rs.getString("loginIP"));
				memberVO.setLoginTime(rs.getString("loginTime"));
				memberVO.setLevel(rs.getString("level"));
				memberVO.setState(rs.getString("state"));
				memberVO.setSuperior(rs.getString("superior"));
				memberVO.setCommission(rs.getInt("commission"));
				memList.add(memberVO);
				}

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("嚙碾嚙瘤 嚙瞌嚙踝蕭嚙羯 " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("嚙璀嚙踝蕭嚙踝蕭嚙踝蕭嚙踝蕭嚙瞋嚙豬潘蕭嚙踝蕭嚙瘤  嚙踝蕭嚙瞌嚙磊嚙踝蕭嚙踝蕭 " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memList;
	}

	
	
	
	@Override
	public List<MemberVO> getAllSuperior(String account) {
		List<MemberVO> memList = new ArrayList<>();
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_BY_SUPERIOR);
			pstmt.setString(1,"%"+account+"%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemberNo(rs.getInt("memberNO"));
				memberVO.setAccount(rs.getString("Account"));
				memberVO.setPassword(rs.getString("Password"));
				memberVO.setName(rs.getString("name"));
				memberVO.setBalance(rs.getDouble("balance"));
				memberVO.setLoginIP(rs.getString("loginIP"));
				memberVO.setLoginTime(rs.getString("loginTime"));
				memberVO.setLevel(rs.getString("level"));
				memberVO.setState(rs.getString("state"));
				memberVO.setSuperior(rs.getString("superior"));
				memberVO.setSuperior2(rs.getString("superior2"));
				memberVO.setCommission(rs.getInt("commission"));
				memList.add(memberVO);
				}

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException(" " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException(" " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memList;
	}
	
	
	
	
	@Override
	public List<MemberVO> getAllSuperior2(String account) {
		List<MemberVO> memList = new ArrayList<>();
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_BY_SUPERIOR2);
			pstmt.setString(1,"%"+account+"%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemberNo(rs.getInt("memberNO"));
				memberVO.setAccount(rs.getString("Account"));
				memberVO.setPassword(rs.getString("Password"));
				memberVO.setName(rs.getString("name"));
				memberVO.setBalance(rs.getDouble("balance"));
				memberVO.setLoginIP(rs.getString("loginIP"));
				memberVO.setLoginTime(rs.getString("loginTime"));
				memberVO.setLevel(rs.getString("level"));
				memberVO.setState(rs.getString("state"));
				memberVO.setSuperior(rs.getString("superior"));
				memberVO.setSuperior2(rs.getString("superior2"));				
				memberVO.setCommission(rs.getInt("commission"));
				memList.add(memberVO);
				}

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException(" " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException(" " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memList;
	}

	public static void main(String[] args) {
		// end of while
		// 新增会员test ok
//		MemberDAO memberDAO = new MemberDAO();
//		MemberVO memberVO = new MemberVO();
		// memberVO.setAccount("aaa");
		// memberVO.setBalance(1000.00);
		// memberVO.setPassword("123");
		// memberVO.setName("test");
		// memberVO.setLoginIP("1.1.1.1");
		// memberVO.setLoginTime("201709041250");
		// memberVO.setState("启用中");;
		// memberVO.setLevel("代理");;
		// memberDAO.add(memberVO);
		// System.out.println(memberDAO);

		// update MemberTest OK
//		memberVO.setAccount("bbb");
//		memberVO.setBalance(2000.00);
//		memberVO.setPassword("456");
//		memberVO.setName("testsaa");
//		memberVO.setLoginIP("1.1.1.2");
//		memberVO.setLoginTime("201709041251");
//		memberVO.setState("启用中");
//		memberVO.setLevel("代理");
//		memberVO.setMemberNo(1);
//		memberDAO.update(memberVO);
		
//		 delete MemberTest OK
//		memberDAO.delete(1);
		
//		memberVO = memberDAO.findByPK(2);
//		memberVO = memberDAO.findByAC("ggg");
//		System.out.println(memberVO.getAccount());
//		System.out.println(memberVO.getLevel());
//		System.out.println(memberVO.getName());
//		System.out.println("______________________________");
//		
//		List<MemberVO> memList =memberDAO.getAll();
		
//		for(MemberVO mem : memList){
//			System.out.println(mem.getAccount());
//		}

	}
}
