package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.member.model.MemberVO;

import net.sf.json.JSONObject;

@WebServlet("/AjaxServlet.do")
public class AjaxServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		
//		MemberService memberService = new MemberService();
//		List<MemberVO> memberVO= memberService.getAllName(name);
		
		
		
//		
//		HashMap<String, String> userInfoMap = new HashMap<String, String>();
//
//		userInfoMap.put("name", name);
////		userInfoMap.put("name1", "名字1");
////		userInfoMap.put("name2", "名字2");
////		userInfoMap.put("name3", "名字3");
//		
//		String userInfo = userInfoMap.isEmpty()?"0":"1";
//		//System.out.println("Hashmap is empty?"+userInfoMap.isEmpty());
//		
//
//		JSONObject responseJSONObject = new JSONObject();
//		responseJSONObject.putAll(userInfoMap);
//	   // System.out.printf( "JSON: %s",responseJSONObject.toString(2));

		
//		PrintWriter out = response.getWriter();
//		out.println(responseJSONObject);

	}

}
