package com.scrollingtext.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.Jdbcmysql;

@WebServlet("/scrollingtext.do")
public class ScrollingtextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String sql = "";
		Jdbcmysql db = new Jdbcmysql();
		String action = request.getParameter("action");

		if (action.equals("getall")) {
			// 執行此程式將跑马灯捞出
			String url = request.getParameter("url");

			try {
				sql = "select * from mari.scrollingtext ";

				Vector vr = db.doSqlSelect(sql, 2, false);
				String scrollingText = (String) vr.get(0);
				String updateTime = (String) vr.get(1);
				// HashMap<String, String> map = new HashMap<String, String>();
				// map.put("status", "SUCCESS");
				// map.put("scrollingText", scrollingText);
				// JSONObject json = new JSONObject(map);
				// out.print(json);
				// System.out.println(json) ;


				response.sendRedirect("index.jsp#" + url);

			} catch (Exception e) {
				System.out.println("GET scrollingtext ERROR CAUSE ::" + e.toString());
			}
		}

		if (action.equals("updateScoll")) {
			// 執行此程式將跑马灯捞出
			try {

				String scrollingText = request.getParameter("scrollingText");
				String url = request.getParameter("url");
				String updateTime = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
				
				scrollingText = new String(scrollingText.getBytes("ISO-8859-1"), "UTF-8");
				System.out.println(scrollingText);
				sql = "update  mari.scrollingtext set textContent = '" +scrollingText + "' , updateTime =  '"+ updateTime +"' "; 
				db.doSqlUpdate(sql);

				response.sendRedirect("index.jsp#" + url);

			} catch (Exception e) {
				System.out.println("GET scrollingtext ERROR CAUSE ::" + e.toString());
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
