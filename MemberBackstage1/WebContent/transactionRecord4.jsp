<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.UpPoints.model.*"%>
<%@ page import="java.util.*"%>

	
<head>

<title>Insert title here</title>
</head>
<body><div>
<h3><b>上分纪录</b></h3></div><br>
<div><span>用户编号:</span> <span> <input type="text"
											placeholder="请输入用户编号" name="">
										</span> <span>方式</span> <select class="newObj" name="newObj">
											<option value="" disabled selected>支付方式</option>									
											<option value="微信">微信</option>
											<option value="支付宝">支付宝</option>
											<option value="银行卡">银行卡</option>
											<option value="QQ钱包">QQ钱包</option>
										</select> <select class="newObj" name="newObj">
											<option value="" disabled selected>状态</option>
											<option value="成功">成功</option>
											<option value="失敗">失敗</option>

										</select> <span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span></div>
<c:if test="${type.contains(\"1\")}">
<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th rowspan="2">申请编号</th>
												<th rowspan="2">用户编号</th>
												
												<th rowspan="2">用户暱称</th>
												<th rowspan="2">类型</th>
												<th rowspan="2">登录IP</th>
												<th rowspan="2">分数</th>
												<th rowspan="2">状态</th>
												<th rowspan="2">申请时间</th>
												<th rowspan="2">类别</th>
												<th rowspan="2">更新状态</th>
												<th rowspan="2">操作</th>
											</tr>
										</thead>
										<c:forEach var="uppoints" items="${list}" >

									
										<form action="UpPointsServlet.do" method="post">
										<tbody align="center">
											<tr><td></td>
												<td>${uppoints.addPointsNo}</td>
												<td>${uppoints.memberNo }</td>
												
												<td>${uppoints.name }</td>
												<td>${uppoints.level }</td>
												<td>${uppoints.loginIP }</td>
												<td>${uppoints.points }</td>
												<td>${uppoints.status }</td>
												<td>${uppoints.time }</td>
												<td>${uppoints.type }</td>
												<td><select name="status">
														<option value="成功"> 成功</option>
														<option value="未付款"> 未付款</option>
														<option value="失败"> 失败</option>
													</select></td>
												<td><input type="submit">
												<input type="hidden" name="action" value="updateStatus" >
												<input type="hidden" name="addPointsNo" value="${uppoints.addPointsNo}" ></td>
											</tr>
										</tbody>
										</form>
											
									
										</c:forEach>
									</table>
</c:if>



<c:if test="${type.contains(\"2\")}">
<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th rowspan="2">申请编号</th>
												<th rowspan="2">用户编号</th>
												
												<th rowspan="2">用户暱称</th>
												<th rowspan="2">类型</th>
												<th rowspan="2">登录IP</th>
												<th rowspan="2">分数</th>
												<th rowspan="2">状态</th>
												<th rowspan="2">申请时间</th>
												<th rowspan="2">类别</th>
												
											</tr>
										</thead>
										<c:forEach var="uppoints" items="${list}" >

									
										<form action="UpPointsServlet.do" method="post">
										<tbody align="center">
											<tr><td></td>
												<td>${uppoints.addPointsNo}</td>
												<td>${uppoints.memberNo }</td>
												
												<td>${uppoints.name }</td>
												<td>${uppoints.level }</td>
												<td>${uppoints.loginIP }</td>
												<td>${uppoints.points }</td>
												<td>${uppoints.status }</td>
												<td>${uppoints.time }</td>
												<td>${uppoints.type }</td>
											
											</tr>
										</tbody>
										</form>
										
									
										</c:forEach>
									</table>
</c:if>



<c:if test="${type.contains(\"3\")}">

<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr><th></th>
												<th rowspan="2">申请编号</th>
												<th rowspan="2">用户编号</th>
												
												<th rowspan="2">用户暱称</th>
												<th rowspan="2">类型</th>
												<th rowspan="2">登录IP</th>
												<th rowspan="2">分数</th>
												<th rowspan="2">状态</th>
												<th rowspan="2">申请时间</th>
												<th rowspan="2">类别</th>
												
											</tr>
										</thead>
										<c:forEach var="uppoints" items="${list}">
										
										<c:if test="${uppoints.account==memberVO.account||uppoints.memberNo==memberVO.memberNo}">
										<form action="UpPointsServlet.do" method="post">
										<tbody align="center">
											<tr>
												<td></td>
												<td>${uppoints.addPointsNo}</td>
											
												<td>${uppoints.memberNo }</td>
												
												<td>${uppoints.name }</td>
												<td>${uppoints.level }</td>
												<td>${uppoints.loginIP }</td>
												<td>${uppoints.points }</td>
												<td>${uppoints.status }</td>
												<td>${uppoints.time }</td>
												<td>${uppoints.type }</td>
											
											</tr>
										</tbody>
										</form>
										</c:if>
										
										</c:forEach>
									
									</table>
									</c:if>
</body>
</html>