<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>
												<th rowspan="2">用户编号</th>
												<th rowspan="2">用户类型</th>
												<th rowspan="2">暱称</th>
												<th rowspan="2">登录IP</th>
												<th rowspan="2">交易号</th>
												<th rowspan="2">进款</th>
												<th rowspan="2">出款</th>
												<th rowspan="2">馀额</th>
												<th rowspan="2">状态</th>
												<th rowspan="2">支付方式</th>
<!-- 												<th rowspan="2">描述</th> -->
<!-- 												<th rowspan="2">操作人</th> -->
<!-- 												<th rowspan="2">修改时间</th> -->
												<th rowspan="2">申请时间</th>
												<th rowspan="2">操作</th>
											</tr>
<!-- 											<tr> -->
<!-- 												<th>支付方式</th> -->
<!-- 												<th>支付标题</th> -->
<!-- 												<th>支付名称</th> -->
<!-- 												<th>支付帐号</th> -->
<!-- 											</tr> -->
										</thead>
										<c:forEach var="tppSvc" items="${ttpSvc.all}">
										<tbody>
											<tr>
												<td></td>
												<td>${tppSvc.orderNo}</td>
												<td>${tppSvc.openId}</td>
												<td>${tppSvc.name}</td>
												<td>${tppSvc.loginIP }</td>
												<td>交易号</td>
												<td>进款</td>
												<td>出款</td>
												<td>${tppSvc.balance }</td>
												<td>${tppSvc.state}</td>
												<td>${tppSvc.payType}</td>
												<td>${tppSvc.requestTime}</td>
												<td>${tppSvc.responseTime}</td>
											
											</tr>
										</tbody>
											</c:forEach>
									</table>
</body>
</html>