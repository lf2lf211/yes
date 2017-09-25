package com.thirdpartypayment.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThirdPartyPaymentDAO implements ThirdPartyPaymentInterFace {

	private static final String DRIVER = "org.gjt.mm.mysql.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/memberbackstage";
	private static final String USER = "root";
	private static final String PASSWORD = "";

	private static final String INSERT_STMT = "INSERT INTO ThirdPartyPayment"
			+ "(  openId, name, payType,amt, balance,state,loginIP,loginTime,requestTime,responseTime)"
			+ "VALUES(  ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)";
	private static final String UPDATE_STMT = "UPDATE ThirdPartyPayment SET "
			+ "openId = ?,"
			+ "name = ?,  "
			+ "payType = ?,"
			+ "amt = ? ,"
			+ "balance=?,"
			+ "state=?, "
			+ "loginIP = ?, "
			+ "loginTime = ?,  "
			+ "requestTime = ?  ,"
			+ "responseTime = ?  "
			+ "WHERE orderNo = ?";
	private static final String DELETE_STMT = "DELETE FROM ThirdPartyPayment WHERE orderNo = ?";
	private static final String FIND_BY_PK = "SELECT * FROM ThirdPartyPayment WHERE orderNo = ?";
	private static final String FIND_BY_OPENID_AND_RT = "SELECT * FROM ThirdPartyPayment WHERE openId = ? and requestTime=?";
	private static final String FIND_BY_ACCOUNT = "SELECT * FROM ThirdPartyPayment WHERE orderNo = ?";
	private static final String GET_ALL = "SELECT * FROM ThirdPartyPayment order by orderNo";

	@Override
	public void add(ThirdPartyPaymentVO thirdPartyPaymentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, thirdPartyPaymentVO.getOpenId());
			pstmt.setString(2, thirdPartyPaymentVO.getName());
			pstmt.setString(3, thirdPartyPaymentVO.getPayType());
			pstmt.setInt(4, thirdPartyPaymentVO.getAmt());
			pstmt.setInt(5, thirdPartyPaymentVO.getBalance());
			pstmt.setString(6, thirdPartyPaymentVO.getState());
			pstmt.setString(7, thirdPartyPaymentVO.getLoginIP());
			pstmt.setString(8, thirdPartyPaymentVO.getLoginTime());
			pstmt.setString(9, thirdPartyPaymentVO.getRequestTime());
			pstmt.setString(10, thirdPartyPaymentVO.getResponseTime());
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
	public void update(ThirdPartyPaymentVO thirdPartyPaymentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, thirdPartyPaymentVO.getOpenId());
			pstmt.setString(2, thirdPartyPaymentVO.getName());
			pstmt.setString(3, thirdPartyPaymentVO.getPayType());
			pstmt.setInt(4, thirdPartyPaymentVO.getAmt());
			pstmt.setInt(5, thirdPartyPaymentVO.getBalance());
			pstmt.setString(6, thirdPartyPaymentVO.getState());
			pstmt.setString(7, thirdPartyPaymentVO.getLoginIP());
			pstmt.setString(8, thirdPartyPaymentVO.getLoginTime());
			pstmt.setString(9, thirdPartyPaymentVO.getRequestTime());
			pstmt.setString(10, thirdPartyPaymentVO.getResponseTime());
			pstmt.setLong(11, thirdPartyPaymentVO.getOrderNo());
			pstmt.executeUpdate();
			con.commit();
			// Handle any driver errors
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
	public void delete(Integer orderNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1,orderNo);
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
	public ThirdPartyPaymentVO findByOpenIdAndRequestTime(String openId, String requestTime) {
		ThirdPartyPaymentVO thirdPartyPaymentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_OPENID_AND_RT);
			pstmt.setString(1, openId);
			pstmt.setString(2, requestTime);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// "INSERT INTO MEM(MEM_ID, MEM_ACCOUNT, MEM_PASSWORD, MEM_NAME, MEM_BIRTHDAY,MEM_ADDRESS,
				//MEM_TEL,MEM_EMAIL,MEM_GENDER,MEM_FOUNDATION_ID,MEM_PHOTO,MEM_FAX)"
				thirdPartyPaymentVO = new ThirdPartyPaymentVO();
				thirdPartyPaymentVO.setOrderNo(rs.getInt("orderNo"));
				thirdPartyPaymentVO.setOpenId(rs.getString("openId"));
				thirdPartyPaymentVO.setName(rs.getString("name"));
				thirdPartyPaymentVO.setPayType(rs.getString("payType"));
				thirdPartyPaymentVO.setAmt(rs.getInt("amt"));
				thirdPartyPaymentVO.setBalance(rs.getInt("balance"));
				thirdPartyPaymentVO.setState(rs.getString("state"));
				thirdPartyPaymentVO.setLoginIP(rs.getString("loginIP"));
				thirdPartyPaymentVO.setLoginTime(rs.getString("loginTime"));
				thirdPartyPaymentVO.setRequestTime(rs.getString("requestTime"));
				thirdPartyPaymentVO.setResponseTime(rs.getString("responseTime"));
			}
			//Area(area_code, area_adress, area_location, area_name)"
			
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("��Ⅵ�� �������劑  " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("�������������������惇瞏�����  ������������� " + se.getMessage());
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

		return thirdPartyPaymentVO;
	}
	
	@Override
	public ThirdPartyPaymentVO findByPK(Integer orderNo) {
		ThirdPartyPaymentVO thirdPartyPaymentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, orderNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// "INSERT INTO MEM(MEM_ID, MEM_ACCOUNT, MEM_PASSWORD, MEM_NAME, MEM_BIRTHDAY,MEM_ADDRESS,
				//MEM_TEL,MEM_EMAIL,MEM_GENDER,MEM_FOUNDATION_ID,MEM_PHOTO,MEM_FAX)"
				thirdPartyPaymentVO = new ThirdPartyPaymentVO();
				thirdPartyPaymentVO.setOrderNo(rs.getInt("orderNo"));
				thirdPartyPaymentVO.setOpenId(rs.getString("openId"));
				thirdPartyPaymentVO.setName(rs.getString("name"));
				thirdPartyPaymentVO.setPayType(rs.getString("payType"));
				thirdPartyPaymentVO.setAmt(rs.getInt("amt"));
				thirdPartyPaymentVO.setBalance(rs.getInt("balance"));
				thirdPartyPaymentVO.setState(rs.getString("state"));
				thirdPartyPaymentVO.setLoginIP(rs.getString("loginIP"));
				thirdPartyPaymentVO.setLoginTime(rs.getString("loginTime"));
				thirdPartyPaymentVO.setRequestTime(rs.getString("requestTime"));
				thirdPartyPaymentVO.setResponseTime(rs.getString("responseTime"));
			}
			//Area(area_code, area_adress, area_location, area_name)"
			
		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("��Ⅵ�� �������劑  " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("�������������������惇瞏�����  ������������� " + se.getMessage());
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

		return thirdPartyPaymentVO;
	}


	@Override
	public List<ThirdPartyPaymentVO> getAll() {
		List<ThirdPartyPaymentVO> memList = new ArrayList<>();
		ThirdPartyPaymentVO thirdPartyPaymentVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				thirdPartyPaymentVO = new ThirdPartyPaymentVO();
				thirdPartyPaymentVO.setOrderNo(rs.getInt("orderNo"));
				thirdPartyPaymentVO.setOpenId(rs.getString("openId"));
				thirdPartyPaymentVO.setName(rs.getString("name"));
				thirdPartyPaymentVO.setPayType(rs.getString("payType"));
				thirdPartyPaymentVO.setAmt(rs.getInt("amt"));
				thirdPartyPaymentVO.setBalance(rs.getInt("balance"));
				thirdPartyPaymentVO.setState(rs.getString("state"));
				thirdPartyPaymentVO.setLoginIP(rs.getString("loginIP"));
				thirdPartyPaymentVO.setLoginTime(rs.getString("loginTime"));
				thirdPartyPaymentVO.setRequestTime(rs.getString("requestTime"));
				thirdPartyPaymentVO.setResponseTime(rs.getString("responseTime"));
				memList.add(thirdPartyPaymentVO);
				}

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("��Ⅵ�� �������劑 " + ce.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("�������������������惇瞏�����  ������������� " + se.getMessage());
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
		// �憓��est ok
		ThirdPartyPaymentDAO memberDAO = new ThirdPartyPaymentDAO();
		ThirdPartyPaymentVO thirdPartyPaymentVO = new ThirdPartyPaymentVO();
		thirdPartyPaymentVO.setOpenId("openId");
		thirdPartyPaymentVO.setName("name");
		thirdPartyPaymentVO.setPayType("1");
		thirdPartyPaymentVO.setAmt(10000);
		thirdPartyPaymentVO.setBalance(1000);
		thirdPartyPaymentVO.setState("state");
		thirdPartyPaymentVO.setLoginIP("loginIP");
		thirdPartyPaymentVO.setLoginTime("loginTime");
		thirdPartyPaymentVO.setRequestTime("requestTime");
		thirdPartyPaymentVO.setResponseTime("responseTime");
		memberDAO.add(thirdPartyPaymentVO);
		 System.out.println(memberDAO.toString());

		// update MemberTest OK
//		thirdPartyPaymentVO.setOpenId("openIdXX");
//		thirdPartyPaymentVO.setName("name");
//		thirdPartyPaymentVO.setPayType("1");
//		thirdPartyPaymentVO.setAmt(10000);
//		thirdPartyPaymentVO.setBalance(1000);
//		thirdPartyPaymentVO.setState("state");
//		thirdPartyPaymentVO.setLoginIP("loginIP");
//		thirdPartyPaymentVO.setLoginTime("loginTime");
//		thirdPartyPaymentVO.setRequestTime("requestTime");
//		thirdPartyPaymentVO.setResponseTime("responseTime");
//		thirdPartyPaymentVO.setOrderNo(1);
//		memberDAO.update(thirdPartyPaymentVO);
		
//		 delete MemberTest OK
//		memberDAO.delete(1);
		
//		thirdPartyPaymentVO = memberDAO.findByPK(2);
//		thirdPartyPaymentVO = memberDAO.findByAC("ggg");
//		System.out.println(thirdPartyPaymentVO.getAccount());
//		System.out.println(thirdPartyPaymentVO.getLevel());
//		System.out.println(thirdPartyPaymentVO.getName());
//		System.out.println("______________________________");
//		
//		List<ThirdPartyPaymentVO> memList =memberDAO.getAll();
		
//		for(ThirdPartyPaymentVO mem : memList){
//			System.out.println(mem.getAccount());
//		}
	}

	
}
