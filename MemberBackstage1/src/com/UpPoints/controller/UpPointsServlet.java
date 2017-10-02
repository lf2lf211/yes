package com.UpPoints.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UpPoints.model.UpPointsService;
import com.UpPoints.model.UpPointsVO;
import com.db.Jdbcmysql;
import com.member.model.MemberService;
import com.member.model.MemberVO;


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
		
		if ("查詢".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String url = req.getParameter("url");
			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				Map<String, String[]> map = req.getParameterMap();
				
				
				/***************************2.開始複合查詢***************************************/
				UpPointsService upPointsSvc =new UpPointsService();
				List<UpPointsVO> list  = upPointsSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("list", list); // 資料庫取出的list物件,存入request
				res.sendRedirect("index.jsp#"+url);
				return;	
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
			}
		}
				
		
		if ("查詢2".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String url = req.getParameter("url");
			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				Map<String, String[]> map = req.getParameterMap();
				
				
				/***************************2.開始複合查詢***************************************/
				UpPointsService upPointsSvc =new UpPointsService();
				List<UpPointsVO> list  = upPointsSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("list2", list); // 資料庫取出的list物件,存入request
				res.sendRedirect("index.jsp#"+url);
				return;	
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
			}
		}
		
		if("addUpPoints".equals(action)){
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			
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
			String status;
			String time =  new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss").format(Calendar.getInstance().getTime());
			String type = req.getParameter("type");
			if(type.equals("上分")){
				 status = "成功";
			}else{ status = "未付款";}
			MemberService member =new MemberService();
			
			String account = member.getOneMemberVO(memberNo).getSuperior2();
			
			
			if (!errorMsgs.isEmpty()) {
				res.sendRedirect("index.jsp#" + url);
				session.setAttribute("errorMsgs", errorMsgs);
				return;
			}
			
			
			
			UpPointsService upPointsSvc =new UpPointsService();
			
			upPointsSvc.addUpPointsVO(memberNo,name, loginIP, level, points,status,time,type,account);
			
			MemberService memberService = new MemberService();
			MemberVO mem = memberService.getOneMemberVO(memberNo);
			
			if ("管理员".equals(mem.getLevel())) {
				
				UpPointsService svc =new UpPointsService();
				List<UpPointsVO> list = svc.getAll_By_Up();
				session.setAttribute("list",list);
				List<UpPointsVO> list2 = svc.getAll_By_Down();
				session.setAttribute("list2",list2);

			}
			if ("总代理".equals(mem.getLevel())) {
				UpPointsService svc =new UpPointsService();
				List<UpPointsVO> list = svc.getAll_By_Up();
				session.setAttribute("list",list);	
				List<UpPointsVO> list2 = svc.getAll_By_Down2(mem.getAccount(),mem.getMemberNo());
				session.setAttribute("list2",list2);
			}
			if ("代理".equals(mem.getLevel())) {
				UpPointsService svc =new UpPointsService();
				List<UpPointsVO> list = svc.getAll_By_Up2(mem.getAccount(),mem.getMemberNo());
				session.setAttribute("list",list);
				List<UpPointsVO> list2 = svc.getAll_By_Down2(mem.getAccount(),mem.getMemberNo());
				session.setAttribute("list2",list2);
			}
			
			session.removeAttribute("errorMsgs");
			
			res.sendRedirect("index.jsp#"+url);
			return;	
			
		}

	
	
	
		if("updateStatus".equals(action)){
		
			String status = req.getParameter("status").trim();
			Integer memberNo = new Integer(req.getParameter("memberNo").trim());
			//Integer addPointsNo = Integer.parseInt(req.getParameter("addPointsNo"));
			Integer addPointsNo = new Integer(req.getParameter("addPointsNo"));
			UpPointsService upPointsSvc = new UpPointsService();
			upPointsSvc.updateStatus(status, addPointsNo);
			MemberService memberService = new MemberService();
			MemberVO mem = memberService.getOneMemberVO(memberNo);

			if ("管理员".equals(mem.getLevel())) {
				
				UpPointsService svc =new UpPointsService();
				List<UpPointsVO> list = svc.getAll_By_Up();
				session.setAttribute("list",list);
				List<UpPointsVO> list2 = svc.getAll_By_Down();
				session.setAttribute("list2",list2);

			}
			if ("总代理".equals(mem.getLevel())) {
				UpPointsService svc =new UpPointsService();
				List<UpPointsVO> list = svc.getAll_By_Up();
				session.setAttribute("list",list);	
				List<UpPointsVO> list2 = svc.getAll_By_Down2(mem.getAccount(),mem.getMemberNo());
				session.setAttribute("list2",list2);
			}
			if ("代理".equals(mem.getLevel())) {
				UpPointsService svc =new UpPointsService();
				List<UpPointsVO> list = svc.getAll_By_Up2(mem.getAccount(),mem.getMemberNo());
				session.setAttribute("list",list);
				List<UpPointsVO> list2 = svc.getAll_By_Down2(mem.getAccount(),mem.getMemberNo());
				session.setAttribute("list2",list2);
			}
			
			res.sendRedirect("index.jsp#menu8");
			return;
		
		}	

	
		
		
		
		
		
		
		
		
		
		
	}

	


//	public static void main(String[] args) {
//		Jdbcmysql test = new Jdbcmysql();
//	Vector	all=test.doSqlSelect("SELECT * FROM thirdpartypayment", 11, false);
//		System.out.println(all);
//	}





}
