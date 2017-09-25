package com.UpPoints.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UpPoints.model.UpPointsService;
import com.UpPoints.model.UpPointsVO;
import com.db.Jdbcmysql;

/**
 * Servlet implementation class UpPointsServlet
 */
@WebServlet("/UpPointsServlet.do")
public class UpPointsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String action = req.getParameter("action");
	
	
		if("addUpPoints".equals(action)){
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			Integer points = null;
			try {
				points = new Integer(req.getParameter("points").trim());
			} catch (NumberFormatException e) {
				errorMsgs.put("points","分数请输入数字");
			}
			
			
			int memberNo = Integer.parseInt(req.getParameter("memberNo"));
			String name = req.getParameter("name");
			String loginIP = req.getParameter("loginIP");
			String level = req.getParameter("level");
			String url = req.getParameter("url");
			String status = req.getParameter("status");
			String time = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
			
			
			if (!errorMsgs.isEmpty()) {
				res.sendRedirect("index.jsp#" + url);
				return;
			}
			
			
			UpPointsService upPointsSvc =new UpPointsService();
			
			upPointsSvc.addUpPointsVO(memberNo,name, loginIP, level, points,status,time);
			
			res.sendRedirect("index.jsp#" + url);
			
			
		}
	
	
	
	
	
	
	
	
	
	
	}



//	public static void main(String[] args) {
//		Jdbcmysql test = new Jdbcmysql();
//	Vector	all=test.doSqlSelect("SELECT * FROM thirdpartypayment", 11, false);
//		System.out.println(all);
//	}




}
