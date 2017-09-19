package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.mysql.*;
import org.gjt.mm.mysql.Driver;

public class Jdbcmysql {
	private Connection con = null;
	private Statement stat = null;
	private ResultSet rs = null;
	private PreparedStatement pst = null;
	private int size = 0;

	public Jdbcmysql() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");

			// 嚙踝蕭Udriver
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mari", "root", "");
//			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mari", "root", "@hkhs7396");

			// 嚙踝蕭oconnection
		} catch (ClassNotFoundException e) {
			System.out.println("DriverClassNotFound :" + e.toString()); 
		} // 嚙踝蕭嚙箠嚙踝蕭|嚙踝蕭嚙踝蕭sqlexception
		catch (SQLException x) {
			System.out.println("Exception :" + x.toString());
		}
	}

	public static void main(String[] args) {
		Jdbcmysql test = new Jdbcmysql();
	}

	public Vector doSqlSelect(String SqlStatement, int columnNum, boolean is_cut) {
		Vector vector = new Vector();

		try {
			String s = null;
			stat = con.createStatement();
			size = 0;
			for (rs = stat.executeQuery(SqlStatement); rs.next();) {
				size++;
				if (is_cut) {
					String Str = "";
					for (int i = 1; i <= columnNum; i++) {
						if (i > 1)
							Str = Str + "|";
						s = rs.getString(i);
						Str = Str + s;
					}
					vector.addElement(Str);
				} else {
					for (int j = 1; j <= columnNum; j++) {
						s = rs.getString(j);
						vector.addElement(s);
					}
				}
			}
		} catch (SQLException sqlexception) {
			System.out.println("SQLException:");
			while (sqlexception != null) {
				System.out.println("SQLState: " + sqlexception.getSQLState());
				System.out.println("Message:  " + sqlexception.getMessage());
				System.out.println("Vendor:   " + sqlexception.getErrorCode());
				System.out.println("SqlStatement:  " + SqlStatement);
				sqlexception = sqlexception.getNextException();

				System.out.println("");
			}
		} catch (Exception exception) {
			System.out.println("bbbbbbb :" + exception.toString());
			System.out.println("Exception:  " + exception);
			exception.printStackTrace();
		}
		return vector;
	}

	/**
	 * <pre>
	 * <br>
	     嚙諸潘蕭:1.String SqlStatement :嚙褒入嚙踝蕭 SQL 嚙緙嚙糊<br>
	     嚙褒回:int           <br>
	     嚙踝蕭嚙踝蕭:嚙踝蕭嚙�,嚙踝蕭s,嚙磋嚙踝蕭嚙踝蕭嚙�<br>
	 * </pre>
	 */

	public synchronized int doSqlUpdate(String SqlStatement) {
		int i = -1;
		try {
			stat = con.createStatement();
			i = stat.executeUpdate(SqlStatement);
		} catch (SQLException sqlexception) {
			System.out.println("SQLException:");
			while (sqlexception != null) {
				System.out.println("SQLState: " + sqlexception.getSQLState());
				System.out.println("Message:  " + sqlexception.getMessage());
				System.out.println("Vendor:   " + sqlexception.getErrorCode());
				System.out.println("SqlStatement:  " + SqlStatement);
				sqlexception = sqlexception.getNextException();

				System.out.println("");
			}
		} catch (Exception exception) {
			System.out.println("Exception:  " + exception);
			System.out.println("SqlStatement:  " + SqlStatement);
			exception.printStackTrace();
		}
		return i;
	}

	/**
	 * <pre>
	 * <br>
	    嚙諸潘蕭:嚙盤  <br>
	    嚙褒回:嚙盤  <br>
	    嚙踝蕭嚙踝蕭:嚙瞎嚙踝蕭 DBUtility 嚙踝蕭嚙踝蕭嚙褓存嚙豌潘蕭<br>
	 * </pre>
	 */
	private void clearResult() throws SQLException {
		if (stat != null)
			stat.close();
		stat = null;
		if (pst != null)
			pst.close();
		pst = null;
		if (rs != null)
			rs.close();
		rs = null;
	}

	public void closeConnection() throws SQLException {
		if (!con.getAutoCommit())
			con.setAutoCommit(true);
		clearResult();
		if (con == null)
			throw new SQLException("This connection has been closed already.");
		if (con.isClosed())
			throw new SQLException("This connection has been closed.");
		con.close();
		con = null;
	}

	public boolean isClosed() throws SQLException {
		boolean isClose = true;
		if (con != null)
			isClose = con.isClosed();
		return isClose;
	}

	public void setAutoCommit(boolean t) throws SQLException {
		try {
			if (!t) {
				con.setAutoCommit(false);
			}
		} catch (Exception exception) {
			System.out.println("Exception:  " + exception);
			exception.printStackTrace();
		}
	}

	public void commit() throws SQLException {
		try {
			con.commit();
		} catch (Exception exception) {
			System.out.println("Exception:  " + exception);
			exception.printStackTrace();
		}
	}

	public void rollback() {
		try {
			con.rollback();
		} catch (Exception exception) {
			System.out.println("Exception:  " + exception);
			exception.printStackTrace();
		}
	}

}