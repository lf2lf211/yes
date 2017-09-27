<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="uppointsSvc" scope="page"
	class="com.UpPoints.model.UpPointsService" />
<head>

<title>Insert title here</title>
</head>
<body>
<h3><b><center>上分纪录</center></b></h3>

<c:if test="${type.contains(\"1\")}">
<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
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
										
										<c:forEach var="uppoints" items="${uppointsSvc.all_By_Up}">

										<form action="UpPointsServlet.do" method="post">
										<tbody align="center">
											<tr><td></td>
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
										
										<c:forEach var="uppoints" items="${uppointsSvc.all_By_Up}">

										<form action="UpPointsServlet.do" method="post">
										<tbody align="center">
											<tr><td></td>
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
											<tr>
												<th></th>
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
										
										<c:forEach var="uppoints" items="${uppointsSvc.all_By_Up}">

										<c:if test="${uppoints.account==memberVO.account||uppoints.memberNo==memberVO.memberNo}">
										<form action="UpPointsServlet.do" method="post">
										<tbody align="center">
											<tr><td></td>
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