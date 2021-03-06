package com.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UpPoints.model.UpPointsService;
import com.UpPoints.model.UpPointsVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;

/**
 * Servlet implementation class memberServlet
 */
@WebServlet("/member.do")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	private String fillStr(String value, int count, boolean frontORback, String fillChar) {
		String rtvalue = value;
		if (rtvalue == null) {
			rtvalue = "";
			for (int i = 0; i < count; i++)
				if (frontORback)
					rtvalue = String.valueOf(rtvalue) + String.valueOf(fillChar);
				else
					rtvalue = String.valueOf(fillChar) + String.valueOf(rtvalue);
		} else {
			int len = rtvalue.length();
			if (len > count) {
				rtvalue = rtvalue.substring(0, count);
			} else {
				int a = count - len;
				for (int i = 0; i < a; i++)
					if (frontORback)
						rtvalue = String.valueOf(rtvalue) + String.valueOf(fillChar);
					else
						rtvalue = String.valueOf(fillChar) + String.valueOf(rtvalue);
			}
		}
		return rtvalue;
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String action = req.getParameter("action");

		
		if ("查詢3".equals(action)) { // 來自select_page.jsp的複合查詢請求
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
				MemberService memberSvc =new MemberService();
				List<MemberVO> list  = memberSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("search", list); // 資料庫取出的list物件,存入request
				res.sendRedirect("index.jsp#"+url);
				return;	
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
			}
		}
		
		if ("查詢4".equals(action)) { // 來自select_page.jsp的複合查詢請求
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
				MemberService memberSvc =new MemberService();
				List<MemberVO> list  = memberSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("search2", list); // 資料庫取出的list物件,存入request
				res.sendRedirect("index.jsp#"+url);
				return;	
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
			}
		}
		
		
		if("link".equals(action)){
			
			String superior = req.getParameter("superior");
			String link="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx80c45f3549697bf9&redirect_uri=http%3a%2f%2fwww2.8d8dpay.com%2f8d8d%2fLoginServlet&response_type=code&scope=snsapi_userinfo&state="+superior+"#wechat_redirect";
			String url = req.getParameter("url");
			session.setAttribute("link", link);
			res.sendRedirect("index.jsp#"+url);
			return;
		}
		
		if ("login".equals(action)) {
			List<String> checkMsgs = new LinkedList<String>();
			req.setAttribute("checkMsgs", checkMsgs);
			try {
				String account = req.getParameter("account");
				String password = req.getParameter("password");
				String loginIP = "";
				String loginTime = "";
				MemberService memberService = new MemberService();
				MemberVO mem = memberService.CheckOneMemberVO(account);

				if (mem == null) {
					checkMsgs.add("无此帐号");
					req.getRequestDispatcher("login.jsp").forward(req, res);
					return;
				}

				if (!mem.getState().equals("启用")) {
					checkMsgs.add("帐号停权中，请洽所上级代理");
					req.getRequestDispatcher("login.jsp").forward(req, res);
					return;
				}

				if (mem.getAccount().equals(account.trim()) && mem.getPassword().equals(password.trim())) {
					loginIP = req.getRemoteAddr();
					loginTime = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
					mem.setLoginIP(loginIP);
					mem.setLoginTime(loginTime);
					System.out.println(mem.getLevel());
					if ("管理员".equals(mem.getLevel())) {
						
						UpPointsService svc =new UpPointsService();
						List<UpPointsVO> list = svc.getAll_By_Up();
						session.setAttribute("list",list);
						List<UpPointsVO> list2 = svc.getAll_By_Down();
						session.setAttribute("list2",list2);
						session.setAttribute("type", "1");
					}
					if ("总代理".equals(mem.getLevel())) {
						UpPointsService svc =new UpPointsService();
						List<UpPointsVO> list = svc.getAll_By_Up();
						session.setAttribute("list",list);
						session.setAttribute("type", "2");
						List<UpPointsVO> list2 = svc.getAll_By_Down2(mem.getAccount(),mem.getMemberNo());
						session.setAttribute("list2",list2);
					}
					if ("代理".equals(mem.getLevel())) {
						UpPointsService svc =new UpPointsService();
						List<UpPointsVO> list = svc.getAll_By_Up2(mem.getAccount(),mem.getMemberNo());
						session.setAttribute("list",list);
						List<UpPointsVO> list2 = svc.getAll_By_Down2(mem.getAccount(),mem.getMemberNo());
						session.setAttribute("list2",list2);
						session.setAttribute("type", "3");
						
					}
					List<MemberVO> list = memberService.getAllSuperior(account);
					session.setAttribute("search", list);
					List<MemberVO> list2 = memberService.getAllSuperior2(account);

					session.setAttribute("search2", list2);

					memberService.updateMemberVO(mem);

					req.getSession().setAttribute("memberVO", mem);
					res.sendRedirect("index.jsp");
					return;

				} else {
					checkMsgs.add("帐号、密码错误");
					req.getRequestDispatcher("login.jsp").forward(req, res);

				}

			} catch (Exception e) {
				checkMsgs.add(e.getMessage());
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}

		}

		///////////////

		if ("searchMyMember".equals(action)) {

			String url = req.getParameter("url");
			MemberService memberService = new MemberService();
			Integer memberNo = new Integer(req.getParameter("memberNo"));
			MemberVO mem = memberService.getOneMemberVO(memberNo);

			// String applyTime = new
			// SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
			req.getSession().setAttribute("myMem", mem);
			// req.getSession().setAttribute("applyTime", applyTime);
			res.sendRedirect("index.jsp#" + url);
			return;
		}

		///////////////////////////////// 存新增會員值
		// 新增會員 代理
		if ("memInsert".equals(action)) {

			String account;

			String a = "1";
			try {
				String pathname = "/var/lib/tomcat7/webapps/MemberBackstage/don.txt"; // 绝对路径或相对路径都可以，这里是绝对路径，写入文件时演示相对路径
				File filename = new File(pathname); // 要读取以上路径的input。txt文件
				InputStreamReader reader = new InputStreamReader(new FileInputStream(filename)); // 建立一个输入流对象reader
				BufferedReader br = new BufferedReader(reader); // 建立一个对象，它把文件内容转成计算机能读懂的语言
				String line = "";
				line = br.readLine();
				int intValue = Integer.valueOf(line);
				intValue = intValue + 1;
				a = String.valueOf(intValue);
			} catch (Exception e) {
				File writename = new File("/var/lib/tomcat7/webapps/MemberBackstage/don.txt"); // 相对路径，如果没有则要建立一个新的output。txt文件
				writename.createNewFile(); // 创建新文件
				BufferedWriter out = new BufferedWriter(new FileWriter(writename));
				out.write("1"); // \r\n即为换行
				out.flush(); // 把缓存区内容压入文件
				out.close(); // 最后记得关闭文件
			}
			String outString = "";

			outString = fillStr(a, 5, false, "0");

			account = ("YB" + outString);

			File writename = new File("/var/lib/tomcat7/webapps/MemberBackstage/don.txt"); // 相对路径，如果没有则要建立一个新的output。txt文件
			writename.createNewFile(); // 创建新文件
			BufferedWriter out = new BufferedWriter(new FileWriter(writename));
			out.write(a); // \r\n即为换行
			out.flush(); // 把缓存区内容压入文件
			out.close(); // 最后记得关闭文件

			List<String> checkMsgs = new LinkedList<String>();
			req.setAttribute("checkMsgs", checkMsgs);
			// try {
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			Double balance = 0.00;
			String loginIP = "";
			String loginTime = "";
			String level = req.getParameter("level");
			String state = "启用";
			String url = req.getParameter("url");
			String superior = req.getParameter("superior") + account;
			String superior2 = req.getParameter("superior2");

			int commission = Integer.parseInt(req.getParameter("commission"));

			
			if("总代理".equals(level)){
				commission=85;
			}
			
	
			MemberService memberService = new MemberService();

			memberService.addMemberVO(account, password, name, balance, loginIP, loginTime, level, state, superior,
					superior2, commission);

			String acc = req.getParameter("acc");// 查看下線
			List<MemberVO> list = memberService.getAllSuperior(memberService.CheckOneMemberVO(acc).getAccount());
			List<MemberVO> list2 = memberService.getAllSuperior2(memberService.CheckOneMemberVO(acc).getAccount());

			session.setAttribute("search", list);
			session.setAttribute("search2", list2);

			res.sendRedirect("index.jsp#" + url);

			// } catch (Exception e) {
			// checkMsgs.add(e.getMessage());
			// req.getRequestDispatcher("login.jsp").forward(req, res);
			// }
		}

		if ("deleteMember".equals(action)) {

			List<String> checkMsgs = new LinkedList<String>();
			req.setAttribute("checkMsgs", checkMsgs);
			try {
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				String url = req.getParameter("url");
				MemberService memberService = new MemberService();
				memberService.deleteMemberVO(memberNo);
				res.sendRedirect("index.jsp#" + url);
			} catch (Exception e) {
				checkMsgs.add(e.getMessage());
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
		}

		if ("changeState".equals(action)) {

			List<String> checkMsgs = new LinkedList<String>();
			req.setAttribute("checkMsgs", checkMsgs);
			try {
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				String state = req.getParameter("state");
				String url = req.getParameter("url");
				String memberVONo = req.getParameter("memberVONo");
				System.out.println(state);
				
				if("启用".equals(state)){
					state = "停用";
				}else{
					state = "启用";
				}
				
				MemberService memberService = new MemberService();
				MemberVO memberVO = memberService.getOneMemberVO(memberNo);
				memberVO.setState(state);
				memberService.updateMemberVO(memberVO);
				
				List<MemberVO> list = memberService.getAllSuperior(memberVONo);
				session.setAttribute("search", list);
				List<MemberVO> list2 = memberService.getAllSuperior2(memberVONo);

				session.setAttribute("search2", list2);
				System.out.println("update member succes");
				res.sendRedirect("index.jsp#" + url);

			} catch (Exception e) {
				checkMsgs.add(e.getMessage());
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
		}

		if ("memberUpdate".equals(action)) {

			List<String> checkMsgs = new LinkedList<String>();
			req.setAttribute("checkMsgs", checkMsgs);

			try {
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				String memberVONo = req.getParameter("memberVONo");
//				String password = req.getParameter("password");
//				String name = req.getParameter("name");
//				String level = req.getParameter("level");
				String url = req.getParameter("url");
				int commission = Integer.parseInt(req.getParameter("commission"));
				System.out.println(commission);
				
//
//				if (password.length() < 3 || password.length() > 12) {
//					checkMsgs.add("密码错误");
//					System.out.println("gggggggggg");
//					// req.getRequestDispatcher("login.jsp").forward(req, res);
//				}
				
////				if("总代理".equals(level)){
//					commission=85;
//				}
				
				System.out.println(commission);
				MemberService memberService = new MemberService();
				MemberVO memberVO = memberService.getOneMemberVO(memberNo);

//				memberVO.setPassword(password);
//				memberVO.setName(name);
//				memberVO.setLevel(level);
				memberVO.setCommission(commission);

				if (!checkMsgs.isEmpty()) {
					session.setAttribute("checkMsgs", checkMsgs);

					res.sendRedirect("index.jsp#" + url);
					return;
				}
				
				memberService.updateMemberVO(memberVO);
				
				List<MemberVO> list = memberService.getAllSuperior(memberVONo);
				session.setAttribute("search", list);
				List<MemberVO> list2 = memberService.getAllSuperior2(memberVONo);
				session.setAttribute("search2", list2);

				res.sendRedirect("index.jsp#" + url);
				return;

			} catch (Exception e) {
				checkMsgs.add(e.getMessage());
				req.getRequestDispatcher("login.jsp").forward(req, res);
				return;
			}
		}

		if ("logout".equals(action)) {

			session.invalidate();
			String url = req.getContextPath() + "/login.jsp";
			res.sendRedirect(url);
		}

	}

}
