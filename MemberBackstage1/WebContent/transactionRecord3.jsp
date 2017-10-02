<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="ttpSvc" scope="page"
	class="com.thirdpartypayment.model.ThirdPartyPaymentSvc" />
<head>

<title>Insert title here</title>
</head>
<body>
<div><h3><b>第三方交易</b></h3></div>
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
										</span></div><br>
<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>	
												<th rowspan="2">订单编号</th>
												<th rowspan="2">用户暱称</th>
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
<%-- 											<c:if test="${tppSvc.name==memberVO.name}"> --%>
										<tbody>
											<tr>
												<td></td>
												<td>${tppSvc.orderNo}</td>
												
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
<%-- 										</c:if> --%>
											</c:forEach>
									</table>
</body>
</html>