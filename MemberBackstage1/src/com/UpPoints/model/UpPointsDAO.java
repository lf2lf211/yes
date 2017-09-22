package com.UpPoints.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.member.model.MemberVO;

public class UpPointsDAO implements UpPointsInterface {

	private static final String DRIVER = "org.gjt.mm.mysql.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/memberbackstage";
	private static final String USER = "root";
	private static final String PASSWORD = "";
	
	private static final String INSERT_STMT = "INSERT INTO uppoints"
			+ "(memberNo,name,loginIP,level,points,status,time)"
			+ "VALUES(?,? , ? , ? , ?,'未付款',?)";
	
	private static final String UPDATE_STMT = "UPDATE uppoints SET "
			+ "NAME = ?,"	
			+ "loginIP=?,"
			+ "level = ?, "
		    + "points = ?"
			
			+ "WHERE memberNO = ?";
	private static final String UPDATE_STATUS_STMT = "UPDATE uppoints SET status='已收' ";
	private static final String FIND_BY_PK = "SELECT * FROM uppoints WHERE memberNO = ?";
	private static final String GET_ALL = "SELECT * FROM uppoints ";
	
	@Override
	public void add(UpPointsVO uppointsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, uppointsVO.getMemberNo());
			pstmt.setString(2, uppointsVO.getName());
			pstmt.setString(3, uppointsVO.getLoginIP());
			pstmt.setString(4, uppointsVO.getLevel());
			pstmt.setInt(5, uppointsVO.getPoints());
	
			pstmt.setString(6, uppointsVO.getTime());
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
	public void update(UpPointsVO uppointsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, uppointsVO.getName());
			pstmt.setString(2, uppointsVO.getLoginIP());
			pstmt.setString(3, uppointsVO.getLevel());
			pstmt.setInt(4, uppointsVO.getPoints());
			pstmt.setInt(5, uppointsVO.getMemberNo());
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
	public UpPointsVO findByPK(Integer memberNO) {
		UpPointsVO uppointsVO = null;
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
				uppointsVO = new UpPointsVO();
				uppointsVO.setMemberNo(rs.getInt("memberNO"));
				uppointsVO.setName(rs.getString("name"));
				uppointsVO.setLoginIP(rs.getString("loginIP"));
				uppointsVO.setLevel(rs.getString("level"));
				uppointsVO.setPoints(rs.getInt("points"));
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

		return uppointsVO;
	}
	
	
	@Override
	public void delete(Integer memberNO) {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public List<UpPointsVO> getAll() {
		List<UpPointsVO> uppointsList = new ArrayList<>();
		UpPointsVO uppointsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				uppointsVO = new UpPointsVO();
				uppointsVO.setMemberNo(rs.getInt("memberNO"));
				uppointsVO.setName(rs.getString("name"));
				uppointsVO.setLoginIP(rs.getString("loginIP"));
				uppointsVO.setLevel(rs.getString("level"));
				uppointsVO.setPoints(rs.getInt("points"));
				uppointsList.add(uppointsVO);
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
		return uppointsList;
	}
}
