<%@page import="com.member.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="search" scope="session" type="java.util.List" />
<jsp:useBean id="search2" scope="session" type="java.util.List" />
<%@ page import="java.util.*"%>
<jsp:useBean id="uppointsSvc" scope="page"
	class="com.UpPoints.model.UpPointsService" />
<jsp:useBean id="memSvc" scope="page"
	class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>元宝娱乐后台管理</title>
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">
<link rel="stylesheet" type="text/css"
	href="assets/jquery-ui-1.12.1.custom/jquery-ui.css">
<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">
<link href="assets/css/bow.css" rel="stylesheet">
<script src="assets/js/chart-master/Chart.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->
		<header class="header black-bg">
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start-->
			<a href="index.jsp" class="logo"> <b>元宝娱乐后台管理系统</b>
			</a>
			<!--logo end-->
			<div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout" href="member.do?action=logout">退出</a></li>
				</ul>
				<ul class="nav pull-right top-menu">
					<li><a class="logout cashClick" href="#"
						style="position: relative;"> <span class="badge bg-theme"
							style="position: absolute; right: -10px; top: -10px; z-index: 100;">5</span>
							下分
					</a></li>
				</ul>
				<ul class="nav pull-right top-menu">
					<li><a class="logout rechargeClick" href="#"
						style="position: relative;"> <span class="badge bg-theme"
							style="position: absolute; right: -10px; top: -10px; z-index: 100;">5</span>
							上分
					</a></li>
				</ul>
				<ul class="nav pull-right top-menu">
					<li><a class="logout GenClick" href="#"
						style="position: relative;"> <span class="badge bg-theme"
							style="position: absolute; right: -10px; top: -10px; z-index: 100;">5</span>
							客服
					</a></li>
				</ul>
			</div>
		</header>
		<!--header end-->
		<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">
					<h5 class="centered">功能菜单</h5>
					<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class="fa fa-question-circle"></i> <span>客服</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="#" id="General"> <i class="fa fa-comment-o"></i>
									客服讯息
							</a></li>
							<li><a href="#" id="accountList"> <i
									class="fa fa-file-text-o"></i> 帐户明细
							</a></li>
							<li><a href="#" id="dayBet"> <i class="fa fa-jpy"></i>
									单日注单
							</a></li>
							<li><a href="#" id="welcome"> <i class="fa fa-comment-o"></i>
									生成推广连结
							</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class="fa fa-money"></i> <span>储值</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="#" id="recharge"> <i class="fa fa-jpy"></i>
									上分申请
							</a></li>

							<li><a href="#" id="cash"> <i class="fa fa-jpy"></i>
									下分申请
							</a></li>
							
							<li><a href="#" id="chargeRecord"> <i
									class="fa fa-file-text-o"></i> 交易纪录
							</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class="fa fa-code-fork"></i> <span>层级</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="#" id="agentLV"> <i class="fa fa-code-fork"></i>
									代理层级
							</a></li>
							
							<li><a href="#" id="changeAgent"> <i class="fa fa-users"></i>
									管理下线
							</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class="fa fa-align-left"></i> <span>业务抽成</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="#" id="cashAsk"> <i class="fa fa-money"></i>
<!-- 									提现请求 -->
										输赢列表
							</a></li>
							<li><a href="#" id="cashRecord"> <i
									class="fa fa-file-text-o"></i> 
<!-- 									提现纪录 -->
										反佣列表
							</a></li>
							<li><a href="#" id="thirdPay"> <i
									class="fa fa-credit-card"></i> 结算纪录
							</a></li>
							
							
							
						</ul></li>
						<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class="fa fa-cogs"></i> <span>大厅设置</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="scrollingtext.do?action=getall&url=menu15"
								id="lobbySet"> <i class="fa fa-lightbulb-o"></i> 跑马灯公告
							</a></li>
							<!-- <li><a  href="#" id="lobbySort"><i class="fa fa-university"></i>大厅排序</a></li> -->
							<!-- <li><a  href="#" id="gameRule"><i class="fa fa-exclamation-triangle"></i>游戏规则</a></li> -->
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class="fa fa-th"></i> <span>帐务</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="#" id="RevenueReport"> <i
									class="fa fa-file-text-o"></i> 营收报表
							</a></li>
							<li><a href="#" id="memStatistics"> <i
									class="fa fa-users"></i> 会员统计
							</a></li>
							<li><a href="#" id="BetList"> <i
									class="fa fa-file-text-o"></i> 注单列表
							</a></li>
							
						</ul></li>
					<!-- <li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class=" fa fa-desktop"></i> <span>系统记录</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<li><a href="#" id="memOnline"> <i class="fa fa-user"></i>
									在线会员
							</a></li>
							<li><a href="#" id="dailyRecord"> <i
									class="fa fa-file-text-o"></i> 日志
							</a></li>
						</ul></li> -->
					<li class="sub-menu"><a href="javascript:;" class="menu_arrow">
							<i class=" fa fa-desktop"></i> <span>系统管理</span> <img
							src="assets/img/down.png" style="float: right;">
					</a>
						<ul class="sub">
							<!-- <li><a href="#" id="rightSet"> <i class="fa fa-key"></i>
									权限设定
							</a></li> -->
							<!-- 							<li> -->
							<!-- 								<a href="#" id="changePSD"> -->
							<!-- 									<i class="fa fa-unlock"></i> -->
							<!-- 									密码修改 -->
							<!-- 								</a> -->
							<!-- 							</li> -->
							<li><a href="#" id="LogInRecord"> <i
									class="fa fa-file-text-o"></i> 登陆日志
							</a></li>
							<!-- <li><a href="#" id="BetLimSet"> <i class="fa fa-cogs"></i>
									下注限额设置
							</a></li> -->
							<li><a href="#" id="ReceiptSet"> <i class="fa fa-cogs"></i>
									收款设置
							</a></li>
							<li><a href="#" id="addAdmin"> <i class="fa fa-key"></i>
									会员管理
							</a></li>
						</ul></li>
					<li><a href="#" id="userRight"> <i class="fa fa-key"></i>
							用户权限
					</a></li>
				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<div class="main35" id="main-content">
			<div class="wrapper">
				<div class="row mt">
					<div class="whitearea col-lg-12 table">
						<!-- 配備管理開始 -->
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home"
								class="home"> <i class="fa fa-home"></i> 后台首页
							</a></li>
							<li class="menu_General" style="display: none;"><a
								data-toggle="tab" href="#menu01" class="menu_General"> <i
									class="fa fa-comment-o"></i> 客服讯息
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_accountList" style="display: none;"><a
								data-toggle="tab" href="#menu02" class="menu_accountList"> <i
									class="fa fa-file-text-o"></i> 帐户明细
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_dayBet" style="display: none;"><a
								data-toggle="tab" href="#menu03" class="menu_dayBet"> <i
									class="fa fa-jpy"></i> 单日注单
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_welcome" style="display: none;"><a
								data-toggle="tab" href="#menu4" class="menu_welcome"> <i
									class="fa fa-comment-o"></i> 生成推广连结
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ========================储值======================= -->
							<li class="menu_recharge" style="display: none;"><a
								data-toggle="tab" href="#menu5" class="menu_recharge"> <i
									class="fa fa-jpy"></i> 上分申请
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_recharge_con" style="display: none;"><a
								data-toggle="tab" href="#menu39" class="menu_recharge_con"> <i
									class="fa fa-jpy"></i>上分申请
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_cash" style="display: none;"><a
								data-toggle="tab" href="#menu6" class="menu_cash"> <i
									class="fa fa-jpy"></i> 下分申请
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							
							<li class="menu_chargeRecord" style="display: none;"><a
								data-toggle="tab" href="#menu8" class="menu_chargeRecord"> <i
									class="fa fa-file-text-o"></i> 交易纪录
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ======================层级<=============================== -->
							<li class="menu_agentLV" style="display: none;"><a
								data-toggle="tab" href="#menu9" class="menu_agentLV"> <i
									class="fa fa-code-fork"></i> 代理层级
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>

							<li class="menu_changeAgent" style="display: none;"><a
								data-toggle="tab" href="#menu11" class="menu_changeAgent"> <i
									class="fa fa-users"></i> 管理下线
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_thirdPay" style="display: none;"><a
								data-toggle="tab" href="#menu7" class="menu_thirdPay"> <i
									class="fa fa-credit-card"></i> 结算纪录
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ==========================else============================ -->
							
							<li class="menu_cashAsk" style="display: none;"><a
								data-toggle="tab" href="#menu13" class="menu_cashAsk"> <i
									class="fa fa-money"></i> 输赢列表
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_cashRecord" style="display: none;"><a
								data-toggle="tab" href="#menu14" class="menu_cashRecord"> <i
									class="fa fa-file-text-o"></i> 反佣列表
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							
							
							
							
							
							<li class="menu_businessNO" style="display: none;"><a
								data-toggle="tab" href="#menu7" class="menu_businessNO"> <i
									class="fa fa-align-left"></i> 结算纪录
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_lobbySet" style="display: none;"><a
								data-toggle="tab" href="#menu15" class="menu_lobbySet"> <i
									class="fa fa-lightbulb-o"></i> 跑马灯公告
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_lobbySort" style="display: none;"><a
								data-toggle="tab" href="#menu16" class="menu_lobbySort"> <i
									class="fa fa-university"></i> 大厅排序
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_gameRule" style="display: none;"><a
								data-toggle="tab" href="#menu17" class="menu_gameRule"> <i
									class="fa fa-exclamation-triangle"></i> 游戏规则
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ================================帐务<================================ -->
							<li class="menu_RevenueReport" style="display: none;"><a
								data-toggle="tab" href="#menu18" class="menu_RevenueReport">
									<i class="fa fa-file-text-o"></i> 营收报表
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_memStatistics" style="display: none;"><a
								data-toggle="tab" href="#menu19" class="menu_memStatistics">
									<i class="fa fa-users"></i> 会员统计
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_BetList" style="display: none;"><a
								data-toggle="tab" href="#menu20" class="menu_BetList"> <i
									class="fa fa-file-text-o"></i> 注单列表
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_prizeResult" style="display: none;"><a
								data-toggle="tab" href="#menu21" class="menu_prizeResult"> <i
									class="fa fa-gift"></i> 开奖结果
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ==============================系统记录<============================== -->
							<li class="menu_memOnline" style="display: none;"><a
								data-toggle="tab" href="#menu22" class="menu_memOnline"> <i
									class="fa fa-user"></i> 在线会员
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_dailyRecord" style="display: none;"><a
								data-toggle="tab" href="#menu23" class="menu_dailyRecord"> <i
									class="fa fa-file-text-o"></i> 日志
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ==============================系统管理<=============================== -->
							<li class="menu_rightSet" style="display: none;"><a
								data-toggle="tab" href="#menu24" class="menu_rightSet"> <i
									class="fa fa-key"></i> 权限设定
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- 							<li class="menu_changePSD" style="display: none;"> -->
							<!-- 								<a data-toggle="tab" href="#menu25" class="menu_changePSD"> -->
							<!-- 									<i class="fa fa-unlock"></i> -->
							<!-- 									密码修改 -->
							<!-- 								</a> -->
							<!-- 								<b class="menu_del fa fa-times" style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b> -->
							<!-- 							</li> -->
							<li class="menu_LogInRecord" style="display: none;"><a
								data-toggle="tab" href="#menu26" class="menu_LogInRecord"> <i
									class="fa fa-file-text-o"></i> 登陆日志
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_BetLimSet" style="display: none;"><a
								data-toggle="tab" href="#menu27" class="menu_BetLimSet"> <i
									class="fa fa-cogs"></i> 下注限额设置
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_ReceiptSet" style="display: none;"><a
								data-toggle="tab" href="#menu28" class="menu_ReceiptSet"> <i
									class="fa fa-cogs"></i> 收款设置
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<li class="menu_addAdmin" style="display: none;"><a
								data-toggle="tab" href="#menu29" class="menu_addAdmin"> <i
									class="fa fa-key"></i> 会员管理
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
							<!-- ==============================用户权限<=============================== -->
							<li class="menu_userRight" style="display: none;"><a
								data-toggle="tab" href="#menu30" class="menu_userRight"> <i
									class="fa fa-key"></i> 用户权限
							</a> <b class="menu_del fa fa-times"
								style="position: absolute; top: 5px; right: 2px; cursor: pointer; padding: 5px;"></b>
							</li>
						</ul>
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 后台首页
									</h4>
									<table>
										<tbody>
											<tr>
												<td valign="top" colspan="2">
													<fieldset
														style="width: 460px; border: solid 1px #aaa; margin-top: 8px; margin-left: 15px; position: relative;">
														<legend>基本信息</legend>
														<table id="myTable" style="width: 100%;">
															<tbody>
																<tr>
																	<td style="width: 90px;">账户：</td>
																	<td><span
																		class="mini-textbox mini-textbox-disabled mini-textbox-readOnly"
																		id="loginname" style="border-width: 0px;"> <span
																			class="mini-textbox-border"> <input
																				type="text" class="mini-textbox-input"
																				autocomplete="off" placeholder="123"
																				id="loginname$text" name="loginname" readonly=""
																				disabled="" value='${memberVO.account }'>

																		</span> <input type="hidden">
																	</span></td>
																</tr>
																<tr>
																	<td style="width: 90px;">昵称：</td>
																	<td><span
																		class="mini-textbox mini-textbox-disabled mini-textbox-readOnly"
																		id="nickname" style="border-width: 0px;"> <span
																			class="mini-textbox-border"> <input
																				value='${memberVO.name }' type="text"
																				class="mini-textbox-input" autocomplete="off"
																				placeholder="" id="nickname$text" name="nickname"
																				readonly="" disabled="">
																		</span> <input type="hidden">
																	</span></td>
																</tr>
															</tbody>
														</table>
													</fieldset>
												</td>
											</tr>
											<tr>
												<td valign="top" width="500">
													<fieldset
														style="border: solid 1px #aaa; margin-top: 8px; margin-left: 15px; position: relative;">
														<legend>【更新纪录】</legend>
														<ul id="ul_log">
															<li>v0208:「更新首页」首页按要求调整，又上角新加提醒</li>
															<li>v0207:「未开统计」新增开奖号码</li>
															<li>v0202:修正「未开统计」未统计特定注单错误</li>
															<li>v0122:经营层可使用「注单列表」「未开统计」「交易纪录」</li>
															<li>v0121:新增管理帐号安全机制</li>
															<li>v0120:调整「单日统计」项目</li>
															<li>v0118:会员的代理帐号若为ZZZ开头, 视为虚拟分, 统计时将会额外计算</li>
															<li>v0116:「会员列表」显示总馀分丶介面优化</li>
															<li>v0116:「彩金审核」取消0108提醒项目、提醒项目异动丶加总丶介面优化</li>
															<li>v0116:「派彩纪录」增加导出功能</li>
															<li>v0116:「会员统计」增加(1)统计期数(2)期数清单(3)导出功能</li>
															<li>v0116:「线上人数」可直接发讯息给用户。</li>
															<li><span style="text-decoration: line-through;">
																	v0108:「彩金审核」新增条件提醒，提醒条件如下
																	<ul>
																		<li>0.已派彩n笔</li>
																		<li>1.只押大小单双</li>
																		<li>2.组合比例低于10%,没有单点数字</li>
																		<li>3.下注次数低于10次</li>
																		<li>4.组合超过50%</li>
																	</ul> <span></span>
															</span></li>
														</ul>
													</fieldset>
												</td>
												<td valign="top" width="500">
													<fieldset
														style="border: solid 1px #aaa; margin-top: 8px; margin-left: 15px; position: relative;">
														<legend>【场次说明】</legend>
														<ul>
															<li>PK10
																<ul>
																	<li><b>北京赛车：</b> 从09:02 至 23:57
																		每期间隔5分钟，等待开奖时间为1分钟，全天共179期，每期会从01-10个号码中随机开出10个号码做为当期开奖车号。
																	</li>
																	<li><b>幸运飞艇：</b> 从13:09 至 凌晨 04:04
																		每期间隔5分钟，等待开奖时间为1分钟，全天共180期，每期会从01-10个号码中随机开出10个号码做为当期开奖艇号。
																	</li>
																</ul>
															</li>
														</ul>
													</fieldset>
													<fieldset
														style="border: solid 1px #aaa; margin-top: 8px; margin-left: 15px; position: relative;">
														<legend>【系统说明】</legend>
														<ul>
															<li><b>管理员备注：</b> 只有管理员可看到的备注</li>
															<li>名词解释
																<ul>
																	<li><b>管理员：</b> 后台操作人员 <br> <b>经营层：</b>
																		包含：公司，代理 <br> <b>会员/用户：</b> 玩家</li>
																	<li><b>％：</b> 百分比，1%=0.01 <br> <b>‰：</b>
																		千分比，1‰=0.001</li>
																</ul>
															</li>
															<li>竞猜及客服「讯息」只保留15天纪录</li>
														</ul>
													</fieldset>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu01" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 客服讯息
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>
												<th rowspan="2">创建时间</th>
												<th rowspan="2">代理编号</th>
												<th rowspan="2">用户编号</th>
												<th rowspan="2">暱称</th>
												<th rowspan="2">＠用户暱称</th>
												<th rowspan="2">登录IP</th>
												<th colspan="2">讯息</th>
												<th rowspan="2">分类</th>
												<th rowspan="2">状态</th>
											</tr>
											<tr>
												<th>内容</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu02" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 帐户明细
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>
												<th rowspan="2">编号</th>
												<th rowspan="2">用户类型</th>
												<th rowspan="2">用户编号</th>
												<th rowspan="2">用户暱称</th>
												<th rowspan="2">登录IP</th>
												<th rowspan="2">操作类型</th>
												<th rowspan="2">订单号</th>
												<th colspan="4">游戏内容</th>
												<th rowspan="2">变化金额</th>
												<th rowspan="2">变化前金额</th>
												<th rowspan="2">变化后金额</th>
												<th rowspan="2">创建时间</th>
											</tr>
											<tr>
												<th>游戏</th>
												<th>期号</th>
												<th>类型</th>
												<th>投注点</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu03" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-6">
										<h4>
											<i class="fa fa-angle-right"></i> 单日注单
										</h4>
									</div>
									<div class="col-xs-12 col-sm-6">
										<span>用户编号:</span> <span> <input type="text"
											placeholder="用户编号" name="">
										</span> <select class="newObj" name="newObj">
											<option value="" disabled selected>游戏彩种...</option>
											<option value="">123</option>
											<option value="">321</option>
											<option value="">9453</option>
											<option value="">9487</option>
										</select> <span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span>
									</div>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>暱称</th>
												<th>笔数</th>
												<th>总下注</th>
												<th>总输赢</th>
												<th>期数</th>
												<th>均额</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu4" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 生成推广连结
									</h4>
									<fieldset
										style="border: solid 1px #aaa; margin-top: 8px; margin-left: 15px; position: relative; width: 600px;">
										<legend>
											<h3>【生成推广连结】</h3>
										</legend>
										<!--     <div class="div">
                <table>
                  <tbody><tr>
                    <td style="text-align: right;width:30%;">前端客服欢迎语：</td>
                    <td>
                    <textarea cols="45" rows="10" placeholder="" name="welcome" style="height: 48px;"></textarea>
                    <input type="hidden">
                    </td>
                  </tr>
                  <tr>
                    <td style="text-align: right;">分享名片图标：</td>
                    <td>
                    <textarea cols="45" rows="10" placeholder="" id="img_14$text" name="sharelogo" style="height: 48px;"></textarea>
                    <input type="hidden">
                    <input type="file" id="upload_14" multiple="multiple" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" style="display: inline-block;">
                      <input type="button" id="show" value="上传"></td>
                  </tr>
                  <tr>
                    <td style="text-align: right;">分享名片欢迎语：</td>
                    <td>
                    <textarea cols="45" rows="10" placeholder="" name="desc" style="height: 48px;"></textarea>
                    <input type="hidden">
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                    <div style="text-align:center;padding:10px;">
                        <a class="mini-button" href="javascript:void(0)" style="width: 60px; margin-right: 20px;">
                        <input type="button" id="show" value="保存">
                        </a>
                      </div>
                    </td>
                  </tr>
                </tbody>
                </table>
              </div> -->
										<div style="text-align: center; padding: 10px;">
											<a class="mini-button" href="javascript:void(0)"
												style="width: 60px; margin-right: 20px;"> <input
												type="button" id="show" value="连结生成">
											</a>
										</div>
									</fieldset>
								</div>
							</div>
							<!-- =================================储值============================== -->
							<c:if test="${type.contains(\"2\")||type.contains(\"1\")}">
							<div id="menu5" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 上分申请
									</h4>
									我的下线:
									<form action="member.do" method="Post" style='display: inline-block'>
									
									<select size="1" name="memberNo">
										<c:forEach var="member" items="${search}">
											<option value="${member.memberNo}" ${(member.account==member.account)? 'selected':'' } >帳號:${member.account}名稱:${member.name} 
										</c:forEach>
									</select>
									<input type="hidden" name="url" value="menu39">
									<input type="hidden" name="action" value="searchMyMember" >
									<input type="submit" id="recharge_con">
									</form>
									
								</div>
							</div>
							<div id="menu39" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 上分申请
									</h4>
									<form action="UpPointsServlet.do" method="post">
									<table 
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>
												<!-- <th rowspan="2">上分纪录</th> -->
												<th rowspan="2">用户编号</th>
												<th rowspan="2">会员帐号</th>
												<th rowspan="2">用户暱称</th>
												<th rowspan="2">类型</th>
												<th rowspan="2">登录IP</th>
<!-- 												<th rowspan="2">用户馀额</th> -->
<!-- 												<th colspan="4">支付信息</th> -->
<!-- 												<th rowspan="2">描述</th> -->
<!-- 												<th rowspan="2">操作人</th> -->
												<th rowspan="2">上级</th>
												<th rowspan="2">分数</th>
												<th rowspan="2">操作</th>
											
											</tr>
<!-- 											<tr> -->
<!-- 												<th>支付方式</th> -->
<!-- 												<th>支付标题</th> -->
<!-- 												<th>支付名称</th> -->
<!-- 												<th>支付帐号</th> -->
<!-- 											</tr> -->
										</thead>
										
										<tbody align="center">
											<tr>
												<td></td>
												<!-- <td></td> -->
												<td>${myMem.memberNo }</td>
												<td>${myMem.account }</td>
												<td>${myMem.name }</td>
												<td>${myMem.level }</td>
												<td>${myMem.loginIP }</td>
			
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->

<!-- 												<td></td> -->
												<td>${memberVO.account}</td>
												<td  align="center">${errorMsgs.points}<input type="text" name="points"></td>
												<td><input type="submit">
												<input type="hidden" name="action" value="addUpPoints" >
												<input type="hidden" name="memberNo" value="${myMem.memberNo }" >
												<input type="hidden" name="name" value="${myMem.name }">
												<input type="hidden" name="level" value="${myMem.level }">
												<input type="hidden" name="loginIP" value="${myMem.loginIP }">
												<input type="hidden" name="url" value="menu39">
												</td>
												
											</tr>
										</tbody>
										
									</table></form>
								</div>
							</div>
							</c:if>
							<div id="menu6" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 下分申请
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>
												<!-- <th rowspan="2">下分纪录</th> -->
												<th rowspan="2">用户编号</th>
												<th rowspan="2">用户暱称</th>
												<th rowspan="2">类型</th>
												<th rowspan="2">登录IP</th>
												<th rowspan="2">用户馀额</th>
												<th rowspan="2">操作人</th>
												<th rowspan="2">操作</th>
											</tr>
											
										</thead>
										<tbody>
											<tr>
												<td></td>
												<!--  <td></td> -->
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
<!-- 							<div id="menu7" class="tab-pane fade"> -->
<!-- 								<div class="model content-panel "> -->
<!-- 									<h4> -->
<!-- 										<i class="fa fa-angle-right"></i> 结算纪录 -->
<!-- 									</h4> -->
<!-- 									<table -->
<!-- 										class="table table-bordered table-striped table-condensed"> -->
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th></th> -->
<!-- 												<th>用户类型</th> -->
<!-- 												<th>用户编号</th> -->
<!-- 												<th>用户暱称</th> -->
<!-- 												<th>馀额</th> -->
<!-- 												<th>状态</th> -->
<!-- 												<th>登录IP</th> -->
<!-- 												<th>登录时间</th> -->
<!-- 												<th>创建时间</th> -->
<!-- 												<th>操作</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<!-- 											<tr> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</div> -->

							<div id="menu8" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-6">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 交易纪录
										</h4>
										<div class="btn-group">
											<a href="#" class="btn btn-default" role="button"> <i
												class="fa fa-arrow-down"></i> 导出EXCEL
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<span>用户编号:</span> <span> <input type="text"
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
										</span>
									</div>
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
												<th colspan="2">支付信息</th>
												<th rowspan="2">描述</th>
												<th rowspan="2">操作人</th>
<!-- 												<th rowspan="2">修改时间</th> -->
												<th rowspan="2">申请时间</th>
												<th rowspan="2">操作</th>
											</tr>
											<tr>
												<th>支付方式</th>
<!-- 												<th>支付标题</th> -->
<!-- 												<th>支付名称</th> -->
												<th>支付帐号</th>
											</tr>
										</thead>
										<c:forEach var="tppSvc" items="${memSvc.all}">
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td>${tppSvc.loginIP }</td>
												<td>交易号</td>
												<td>进款</td>
												<td>出款</td>
												<td>${tppSvc.balance }</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											
											</tr>
										</tbody>
											</c:forEach>
									</table>
								</div>
							</div>
							<!-- =========================层级===================================== -->
							<div id="menu9" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 代理层级
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th> </th>
												<th>用户编号</th>
												<th>用户账户</th>
												<th>用户密码</th>
												<th>用户昵称</th>
												<th>余额</th>
												<th>登录IP</th>
												<th>登录时间</th>
												<th>身分</th>
												<th>状态</th>
												<th>层级</th>
												<th>上级</th>
												

											</tr>
										</thead>
							
												<%@ include file="/page/page1.file" %> 
										
										<c:forEach var="member" items="${search}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
												
											<tbody>
												<tr>
													<td></td>
													<td class='memberNo'>${member.memberNo}</td>
													<td class='account'>${member.account}</td>
													<td class='password'>${member.password}</td>
													<td class='name'>${member.name}</td>
													<td>${member.balance }</td>
													<td>${member.loginIP }</td>
													<td>${member.loginTime }</td>
													<td class='level'>${member.level}</td>
													<td>${member.state }</td>
													<td>${member.superior}</td>
													<td>${member.superior2}</td>
													
												</tr>
											</tbody>

										</c:forEach>
										<%@include file="/page/page2.file"%> 
									

									</table>
								</div>
							</div>
							<div id="menu10" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 会员列表
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr> 
												<th></th>
												<th>所属上级</th>
												<th>用户编号</th>
												<th>用户暱称</th>
												<th>馀额</th>
												<th>总输赢</th>
												<th>状态</th>
												<th>备注</th>
												<th>最后登入IP</th>
												<th>登录时间</th>
												<th>间格时间</th>
												<th>创建时间</th>
												<th>注单明细</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
							<div id="menu11" class="tab-pane fade">
								<div class="model content-panel ">
								<h4>
										<i class="fa fa-angle-right"></i> 会员管理
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th> </th>
												<th>用户编号</th>
												<th>用户账户</th>
												<th>用户密码</th>
												<th>用户昵称</th>
												<th>余额</th>
												<th>登录IP</th>
												<th>登录时间</th>
												<th>身分</th>
												<th>状态</th>
												<th>上級</th>
												<th>上級</th>
												<th>操作</th>

											</tr>
										</thead>
							
									
										
										<c:forEach var="member" items="${search2}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
												
											<tbody>
												<tr>
													<td></td>
													<td class='memberNo'>${member.memberNo}</td>
													<td class='account'>${member.account}</td>
													<td class='password'>${member.password}</td>
													<td class='name'>${member.name}</td>
													<td>${member.balance }</td>
													<td>${member.loginIP }</td>
													<td>${member.loginTime }</td>
													<td class='level'>${member.level}</td>
													<td>${member.state }</td>
													<td>${member.superior}</td>
													<td>${member.superior2}</td>
													<td><input type="submit"
														class="btn btn-warning change_Btn" value='修改'>
														
														<form action="member.do" method="Post"
															style='display: inline-block'>
															<input type="hidden" name='memberNo'
																value="${member.memberNo}">
																<input type="hidden" name='memberVONo'
																value="${memberVO.account}"> <input type="hidden"
																name='action' value="enableMember"> <input
																type="hidden" name='state' value="启用"> <input
																type="hidden" name='url' value="menu29"> <input
																type="submit" class="nobtn btn btn-primary btn-sm"
																value='复权'>
														</form>
														<form action="member.do" method="Post"
															style='display: inline-block'>
															<input type="hidden" name='memberNo' value="${member.memberNo}"> 
																<input type="hidden" name='memberVONo'
																value="${memberVO.account}">
																<input type="hidden" name='action' value="disableMember"> 
																<input type="hidden" name='state' value="停用"> 
																<input type="hidden" name='url' value="menu29"> 
																<input type="submit" class="yesbtn btn btn-primary btn-sm"
																value='停权'>
														</form></td>
												</tr>
											</tbody>

										</c:forEach>
						
									

									</table>
									
									
									<div class="changeMember" style="display: none;">
										<hr>
										<h4>
											<i class="fa fa-angle-right"></i> 修改会员
										</h4>
										<div class="container" style="max-width: 400px;">
											<form action="member.do" method="post">
												<table
													class="table table-bordered table-striped table-condensed">
													<thead>
														<tr>
															<th></th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>用户编号</td>
															<td><input type="text" name="memberNo"
																readonly="readonly" class='memberNo'></td>
														</tr>
														<tr>
															<td>用户账户</td>
															<td><input type="text" name="account"
																readonly="readonly" class='account'></td>
														</tr>
														<tr>
															<td>用户密码</td>
															<td><input type="text" name="password"
																class='password'></td>
														</tr>
														<tr>
															<td>用户昵称</td>
															<td><input type="text" name="name" class='name'>
															</td>
														</tr>
														<tr>
															<td>身分</td>

															<c:if test="${type.contains(\"1\") }">
																<td><select name="level">
																		<option value="总代理">总代理</option>
																		<option value="代理">代理</option>
																</select></td>
															</c:if>
															<c:if
																test="${type.contains(\"2\")||type.contains(\"3\") }">
																<td><select name="level">

																		<option value="代理">代理</option>
																</select></td>
															</c:if>

														</tr>
														<tr>
															<td><input type="hidden" name="url" value="menu29">
																<input type="hidden" name="action" value="memberUpdate">
															</td>
															<td><input type="submit" name="" value="送出">
															</td>
														</tr>
													</tbody>
												</table>
											</form>
										</div>
									</div>
									<hr>
									<h4>
										<i class="fa fa-angle-right"></i> 新增会员
									</h4>
									<div class="container" style="max-width: 400px;`">
										<form action="member.do" method="post">
											<table
												class="table table-bordered table-striped table-condensed">
												<thead>
													<tr>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>账户</td>
														<td>帐号系统会自行产生</td>
													</tr>
													<tr>
														<td>密码</td>
														<td><input type="password" name="password"></td>
													</tr>
													<tr>
														<td>名称</td>
														<td><input type="text" name="name"></td>
													</tr>
													<tr>
														<td>权限</td>
														<c:if test="${type.contains(\"1\") }">
															<td><select name="level">
																	<option value="总代理">总代理</option>
																	<option value="代理">代理</option>
															</select></td>
														</c:if>
														<c:if
															test="${type.contains(\"2\")||type.contains(\"3\") }">
															<td><select name="level">

																	<option value="代理">代理</option>
															</select></td>
														</c:if>
													</tr>
													<tr>
														<td><input
															type="hidden" name="superior"
															value="${memberVO.superior},">
															<input type="hidden" name="superior2"
															value="${memberVO.account}"> <input
															type="hidden" name="acc" value="${memberVO.account}">
															<input type="hidden" name="action" value="memInsert">
															<input type="hidden" name="url" value="menu11">
														</td>
														<td><input type="submit" name="" value="新增">
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
								</div>
							</div>
							<!-- =========================else=============================== -->
<!-- 							<div id="menu12" class="tab-pane fade"> -->
<!-- 								<div class="model content-panel "> -->
<!-- 									<h4> -->
<!-- 										<i class="fa fa-angle-right"></i> 业务流水 -->
<!-- 									</h4> -->
<!-- 								</div> -->
<!-- 							</div> -->

<div id="menu12" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 结算纪录
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>所属上级</th>
												<th>用户帐号</th>
												<th>用户名称</th>
												<th>阶层</th>
												<th>帐户馀额</th>
												<th>总馀额</th>
												<th>提现金额</th>
												<th>银行类型</th>
												<th>持卡人</th>
												<th>银行帐号</th>
												<th>开户行</th>
												<th>时间</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div id="menu13" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 提现请求
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>所属上级</th>
												<th>用户帐号</th>
												<th>用户名称</th>
												<th>阶层</th>
												<th>帐户馀额</th>
												<th>总馀额</th>
												<th>提现金额</th>
												<th>银行类型</th>
												<th>持卡人</th>
												<th>银行帐号</th>
												<th>开户行</th>
												<th>时间</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu14" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-6">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 提现纪录
										</h4>
										<div class="btn-group">
											<a href="#" class="btn btn-default" role="button"> <i
												class="fa fa-arrow-down"></i> 导出EXCEL
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<span>用户编号:</span> <span> <input type="text"
											placeholder="请输入用户编号" name="">
										</span> <span>方式</span> <select class="newObj" name="newObj">
											<option value="" disabled selected>支付方式</option>
											<option value="">123</option>
											<option value="">321</option>
											<option value="">9453</option>
											<option value="">9487</option>
										</select> <select class="newObj" name="newObj">
											<option value="" disabled selected>成功</option>
											<option value="">123</option>
											<option value="">321</option>
											<option value="">9453</option>
											<option value="">9487</option>
										</select> <span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span>
									</div>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>所属上级</th>
												<th>用户帐号</th>
												<th>用户名称</th>
												<th>阶层</th>
												<th>帐户馀额</th>
												<th>总馀额</th>
												<th>提现金额</th>
												<th>银行类型</th>
												<th>持卡人</th>
												<th>银行帐号</th>
												<th>开户行</th>
												<th>时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<c:if test="${type.contains(\"1\")}">
							<div id="menu15" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 跑马灯公告
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>内容</th>
												<th>修改时间</th>
												<th>操作</th>
											</tr>
										</thead>
										
										<tbody>
											<tr>
												<form action="scrollingtext.do" method='get'>
													<td></td>
													<td><textarea class="Marquee" cols="100" rows="3"
															name='scrollingText'>${scrollingText}</textarea></td>
													<td>${updateTime}</td>
													<td><input type="hidden" name='action'value='updateScoll'>
													<input type="hidden"name='url' value='menu15'> 
													<input type="submit"class="btn btn-warning change_Btn" value='修改'></td>
												</form>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu16" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 大厅排序
									</h4>
								</div>
							</div>
							<div id="menu17" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 游戏规则
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>游戏编号</th>
												<th>游戏类型</th>
												<th>游戏风格</th>
												<th>标题</th>
												<th>内容</th>
												<th>位置</th>
												<th>排序值</th>
												<th>修改时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- ==================================帐务=================================== -->
							<div id="menu18" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-6">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 营收报表
										</h4>
										<div class="btn-group">
											<a href="#" class="btn btn-default" role="button"> <i
												class="fa fa-arrow-down"></i> 导出EXCEL
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<span>用户编号:</span> <span> <input type="text"
											placeholder="请输入用户编号" name="">
										</span> <span>方式</span> <select class="newObj" name="newObj">
											<option value="" disabled selected>支付方式</option>
											<option value="">123</option>
											<option value="">321</option>
											<option value="">9453</option>
											<option value="">9487</option>
										</select> <select class="newObj" name="newObj">
											<option value="" disabled selected>成功</option>
											<option value="">123</option>
											<option value="">321</option>
											<option value="">9453</option>
											<option value="">9487</option>
										</select> <span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span>
									</div>
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
												<th rowspan="2">更新状态</th>
												<th rowspan="2">操作</th>
											</tr>
										</thead>
										<c:forEach var="uppoints" items="${uppointsSvc.all}">
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
								</div>
							</div>
							<div id="menu19" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-6">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 会员统计
										</h4>
										<div class="btn-group">
											<a href="#" class="btn btn-default" role="button"> <i
												class="fa fa-arrow-down"></i> 导出EXCEL
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<span>会员编号:</span> <span> <input type="text"
											placeholder="请输入用户编号" name=""></span>
<!-- 										 <span>排序</span> <select class="newObj" name="newObj"> -->
<!-- 											<option value="" disabled selected>排序方式</option> -->
<!-- 											<option value="">123</option> -->
<!-- 											<option value="">321</option> -->
<!-- 											<option value="">9453</option> -->
<!-- 											<option value="">9487</option> -->
<!-- 										</select> -->
<!-- 										<span> 时间： <input type="text" class="datepicker">  -->
<!-- 										</span> <span> 至 <input type="text" class="datepicker"> -->
<!-- 										</span> --><span> <input type="button" name="" value="查询"> 
	 										</span> 
									</div>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>用户暱称</th>
												<th>上级代理</th>
												<th>总笔数</th>
												<th>总下注金额</th>
												<th>总输赢金额</th>
												<th>总期数</th>
												<th>每期均额</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu20" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-5">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 注单列表
										</h4>
										<div class="btn-group">
											<a href="#" class="btn btn-default" role="button"> <i
												class="fa fa-arrow-down"></i> 导出EXCEL
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-7">
										<span>游戏彩种：</span> <select class="newObj" name="newObj">
											<option value="" disabled selected>游戏彩种...</option>
											<option value="">小玛莉</option>
											<option value="">龙虎</option>

<!-- 										</select> <span>注单号</span> <span> <input type="text" -->
<!-- 											placeholder="注单号" name=""> -->
<!-- 										</span>  -->
<!-- 										<select class="newObj" name="newObj"> -->
<!-- 											<option value="" disabled selected>状态...</option> -->
<!-- 											<option value="">123</option> -->
<!-- 											<option value="">321</option> -->
<!-- 											<option value="">9453</option> -->
<!-- 											<option value="">9487</option> -->
<!-- 										</select>  -->
										<span> <input type="text" placeholder="会员编号" name="">
										</span> <span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span>
									</div>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>注单号</th>
												<th>游戏类型</th>
<!-- 												<th>游戏风格</th> -->
<!-- 												<th>游戏主键</th> -->
												<th>游戏期号</th>
												<th>开奖结果</th>
<!-- 												<th>游戏状态</th> -->
												<th>用户昵称</th>
												<th>用户编号</th>
												<th>投注类型</th>
												<th>投注点</th>
												<th>投注金额</th>
												<th>输赢情况</th>
												<th>状态</th>
												<th>投注时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
<!-- 							<div id="menu21" class="tab-pane fade"> -->
<!-- 								<div class="model content-panel "> -->
<!-- 									<div class="col-xs-12 col-sm-5"> -->
<!-- 										<h4 style="display: inline-block;"> -->
<!-- 											<i class="fa fa-angle-right"></i> 开奖结果 -->
<!-- 										</h4> -->
<!-- 										<div class="btn-group"> -->
<!-- 											<a href="#" class="btn btn-default" role="button"> <i -->
<!-- 												class="fa fa-arrow-down"></i> 导出EXCEL -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-xs-12 col-sm-7"> -->
<!-- 										<span>游戏彩种：</span> <select class="newObj" name="newObj"> -->
<!-- 											<option value="" disabled selected>游戏彩种...</option> -->
<!-- 											<option value="">123</option> -->
<!-- 											<option value="">321</option> -->
<!-- 											<option value="">9453</option> -->
<!-- 											<option value="">9487</option> -->
<!-- 										</select> <span>期号：</span> <span> <input type="text" -->
<!-- 											placeholder="期号" name=""> -->
<!-- 										</span> <select class="newObj" name="newObj"> -->
<!-- 											<option value="" disabled selected>状态</option> -->
<!-- 											<option value="">123</option> -->
<!-- 											<option value="">321</option> -->
<!-- 											<option value="">9453</option> -->
<!-- 											<option value="">9487</option> -->
<!-- 										</select> <span> 时间： <input type="text" class="datepicker"> -->
<!-- 										</span> <span> 至 <input type="text" class="datepicker"> -->
<!-- 										</span> <span> <input type="button" name="" value="查询"> -->
<!-- 										</span> -->
<!-- 									</div> -->
<!-- 									<table -->
<!-- 										class="table table-bordered table-striped table-condensed"> -->
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th rowspan="2"></th> -->
<!-- 												<th rowspan="2">主键</th> -->
<!-- 												<th rowspan="2">游戏类型</th> -->
<!-- 												<th rowspan="2">游戏风格</th> -->
<!-- 												<th rowspan="2">期号</th> -->
<!-- 												<th rowspan="2">开奖结果</th> -->
<!-- 												<th rowspan="2">期状态</th> -->
<!-- 												<th colspan="3">周期合计</th> -->
<!-- 												<th rowspan="2">开奖时间</th> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<th>注单数</th> -->
<!-- 												<th>下注金额</th> -->
<!-- 												<th>用户结果</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<!-- 											<tr> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 												<td></td> -->
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!-- ==================================系统记录================================== -->
							
							<div id="menu22" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 在线会员
									</h4>
									<span style="float: right;"> <input type="button"
										name="" value="查询">
									</span> <input style="float: right;" type="text" placeholder="请输入用户编号"
										name="">
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>用户昵称</th>
												<th>用户状态</th>
												<th>余额</th>
												<th>最后登录IP</th>
												<th>登录时间</th>
												<th>创建时间</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu23" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-6">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 日志
										</h4>
										<div class="btn-group">
											<a href="#" class="btn btn-default" role="button"> <i
												class="fa fa-arrow-down"></i> 导出EXCEL
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<span> <input type="text" placeholder="请输入搜索内容" name="">
										</span> <span> <input type="text" placeholder="请输入用户编号"
											name="">
										</span> <select class="newObj" name="newObj">
											<option value="" disabled selected>记录类型</option>
											<option value="">123</option>
											<option value="">321</option>
											<option value="">9453</option>
											<option value="">9487</option>
										</select> <span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span>
									</div>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>编号</th>
												<th>用户类型</th>
												<th>用户编号</th>
												<th>用户昵称</th>
												<th>类型</th>
												<th>操作对象</th>
												<th>描述</th>
												<th>登录IP</th>
												<th>登录时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- ==================================系统管理=================================== -->
								
							<div id="menu24" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限设定
									</h4>
								</div>
							</div>
							<!-- 							<div id="menu25" class="tab-pane fade"> -->
							<!-- 								<div class="model content-panel "> -->
							<!-- 									<h4> -->
							<!-- 										<i class="fa fa-angle-right"></i> -->
							<!-- 										密码修改 -->
							<!-- 									</h4> -->
							<!-- 									<div class="mini-toolbar" style="border-bottom: 0; padding: 0px; width: 100%;"> -->
							<!-- 										<h1> -->
							<!-- 											【 -->
							<!-- 											<span id="name_title">a0808</span> -->
							<!-- 											】密码修改 -->
							<!-- 										</h1> -->
							<!-- 										<form id="form1" method="post"> -->
							<!-- 											<input type="hidden" class="mini-hidden" name="ID"> -->
							<!-- 											<table> -->
							<!-- 												<tbody> -->
							<!-- 													<tr> -->
							<!-- 														<td> -->
							<!-- 															<label>账户名：</label> -->
							<!-- 														</td> -->
							<!-- 														<td> -->
							<!-- 															<input name="loginname" readonly=""> -->
							<!-- 														</td> -->
							<!-- 													</tr> -->
							<!-- 													<tr> -->
							<!-- 														<td> -->
							<!-- 															<label>*旧密码：</label> -->
							<!-- 														</td> -->
							<!-- 														<td> -->
							<!-- 															<input type="password" name="pwd_o"> -->
							<!-- 														</td> -->
							<!-- 														<td id="pwdr_error" class="errorText"></td> -->
							<!-- 													</tr> -->
							<!-- 													<tr> -->
							<!-- 														<td> -->
							<!-- 															<label>*新密码：</label> -->
							<!-- 														</td> -->
							<!-- 														<td> -->
							<!-- 															<input type="password" name="pwd"> -->
							<!-- 														</td> -->
							<!-- 														<td id="pwd_error" class="errorText"></td> -->
							<!-- 													</tr> -->
							<!-- 													<tr> -->
							<!-- 														<td> -->
							<!-- 															<label>*确认密码：</label> -->
							<!-- 														</td> -->
							<!-- 														<td> -->
							<!-- 															<input type="password" name="pwd_r"> -->
							<!-- 														</td> -->
							<!-- 														<td id="pwd_r_error" class="errorText"></td> -->
							<!-- 													</tr> -->
							<!-- 													<tr> -->
							<!-- 														<td></td> -->
							<!-- 														<td> -->
							<!-- 															<span> -->
							<!-- 																<input type="button" name="" value="确定"> -->
							<!-- 															</span> -->
							<!-- 														</td> -->
							<!-- 													</tr> -->
							<!-- 												</tbody> -->
							<!-- 											</table> -->
							<!-- 										</form> -->
							<!-- 									</div> -->
							<!-- 									<hr width="500px" align="left" style="margin-left: 5px;"> -->
							<!-- 									<div class="description"> -->
							<!-- 										<h3>Description</h3> -->
							<!-- 										<p>1、密码设置必须六位字符以上</p> -->
							<!-- 										<p>2、密码修改后，敬请牢记密码，避免不必要的过失导致损失。</p> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div id="menu26" class="tab-pane fade">
								<div class="model content-panel ">
									<div class="col-xs-12 col-sm-9">
										<h4 style="display: inline-block;">
											<i class="fa fa-angle-right"></i> 登陆日志
										</h4>
									</div>
									<div class="col-xs-12 col-sm-3">
										<span> 时间： <input type="text" class="datepicker">
										</span> <span> 至 <input type="text" class="datepicker">
										</span> <span> <input type="button" name="" value="查询">
										</span>
									</div>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>编号</th>
												<th>用户类型</th>
												<th>账号</th>
												<th>登录IP</th>
												<th>登录时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu27" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 下注限额设置
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>游戏类型</th>
												<th>玩法组</th>
												<th>下注组</th>
												<th>下限</th>
												<th>上限</th>
												<th>状态</th>
												<th>备注</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="menu28" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 收款设置
									</h4>
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th rowspan="2"></th>
												<th rowspan="2">标示</th>
												<th rowspan="2">银行</th>
												<th rowspan="2">持卡人</th>
												<th rowspan="2">帐号</th>
												<th rowspan="2">状态</th>
												<th colspan="3">操作</th>
												<th rowspan="2">绑定</th>
											</tr>
											<tr>
												<th>关闭</th>
												<th>修改</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						 </c:if>
							<c:if test="${type.contains(\"1\") }">
							<div id="menu29" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 会员管理
									</h4>
									
									
									<table
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th></th>
												<th>用户编号</th>
												<th>用户账户</th>
												<th>用户密码</th>
												<th>用户昵称</th>
												<th>余额</th>
												<th>登录IP</th>
												<th>登录时间</th>
												<th>身分</th>
												<th>状态</th>
												<th>上級</th>
												<th>操作</th>

											</tr>
										</thead>
										<%@ include file="/page/page3.file" %> 
										
										<c:forEach var="member" items="${search}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

											<tbody>
												<tr>
													<td></td>
													<td class='memberNo'>${member.memberNo}</td>
													<td class='account'>${member.account}</td>
													<td class='password'>${member.password}</td>
													<td class='name'>${member.name}</td>
													<td>${member.balance }</td>
													<td>${member.loginIP }</td>
													<td>${member.loginTime }</td>
													<td class='level'>${member.level}</td>
													<td>${member.state }</td>
													<td>${member.superior}</td>

													<td><input type="submit"
														class="btn btn-warning change_Btn" value='修改'>
														<form action="member.do" method="Post"
															style='display: inline-block'>
															<input type="hidden" name='memberNo'
																value="${member.memberNo}"> <input type="hidden"
																name='action' value="deleteMember"> <input
																type="hidden" name='url' value="menu29"> <input
																type="submit" class="btn btn-danger" value='删除'>
														</form>
														<form action="member.do" method="Post"
															style='display: inline-block'>
															<input type="hidden" name='memberNo'
																value="${member.memberNo}"> <input type="hidden"
																name='action' value="enableMember"> <input
																type="hidden" name='state' value="启用"> <input
																type="hidden" name='url' value="menu29"> <input
																type="submit" class="nobtn btn btn-primary btn-sm"
																value='复权'>
														</form>
														<form action="member.do" method="Post"
															style='display: inline-block'>
															<input type="hidden" name='memberNo'
																value="${member.memberNo}"> <input type="hidden"
																name='action' value="disableMember"> <input
																type="hidden" name='state' value="停用"> <input
																type="hidden" name='url' value="menu29"> <input
																type="submit" class="yesbtn btn btn-primary btn-sm"
																value='停权'>
														</form></td>
												</tr>
											</tbody>

										</c:forEach>
										<%@include file="/page/page2.file"%> 
									<%-- <jsp:include page="/page/page2.file"></jsp:include> --%>	

									</table>
									
									<div class="changeMember" style="display: none;">
										<hr>
										<h4>
											<i class="fa fa-angle-right"></i> 修改会员
										</h4>
										<div class="container" style="max-width: 400px;">
											<form action="member.do" method="post">
												<table
													class="table table-bordered table-striped table-condensed">
													<thead>
														<tr>
															<th></th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>用户编号</td>
															<td><input type="text" name="memberNo"
																readonly="readonly" class='memberNo'></td>
														</tr>
														<tr>
															<td>用户账户</td>
															<td><input type="text" name="account"
																readonly="readonly" class='account'></td>
														</tr>
														<tr>
															<td>用户密码</td>
															<td><input type="text" name="password"
																class='password'></td>
														</tr>
														<tr>
															<td>用户昵称</td>
															<td><input type="text" name="name" class='name'>
															</td>
														</tr>
														<tr>
															<td>身分</td>

															<c:if test="${type.contains(\"1\") }">
																<td><select name="level">
																		<option value="总代理">总代理</option>
																		<option value="代理">代理</option>
																</select></td>
															</c:if>
															<c:if
																test="${type.contains(\"2\")||type.contains(\"3\") }">
																<td><select name="level">

																		<option value="代理">代理</option>
																</select></td>
															</c:if>

														</tr>
														<tr>
															<td><input type="hidden" name="url" value="menu29">
																<input type="hidden" name="action" value="memberUpdate">
															</td>
															<td><input type="submit" name="" value="送出">
															</td>
														</tr>
													</tbody>
												</table>
											</form>
										</div>
									</div>
									<hr>
									<h4>
										<i class="fa fa-angle-right"></i> 新增会员
									</h4>
									<div class="container" style="max-width: 400px;`">
										<form action="member.do" method="post">
											<table
												class="table table-bordered table-striped table-condensed">
												<thead>
													<tr>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>账户</td>
														<td>帐号系统会自行产生</td>
													</tr>
													<tr>
														<td>密码</td>
														<td><input type="password" name="password"></td>
													</tr>
													<tr>
														<td>名称</td>
														<td><input type="text" name="name"></td>
													</tr>
													<tr>
														<td>权限</td>
														<c:if test="${type.contains(\"1\") }">
															<td><select name="level">
																	<option value="总代理">总代理</option>
																	<option value="代理">代理</option>
															</select></td>
														</c:if>
														<c:if
															test="${type.contains(\"2\")||type.contains(\"3\") }">
															<td><select name="level">

																	<option value="代理">代理</option>
															</select></td>
														</c:if>
													</tr>
													<tr>
														<td><input
															type="hidden" name="superior"
															value="${memberVO.superior},"> <input
															type="hidden" name="acc" value="${memberVO.account}">
															<input type="hidden" name="action" value="memInsert">
															<input type="hidden" name="url" value="menu29">
														</td>
														<td><input type="submit" name="" value="新增">
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
								</div>
							</div></c:if>  
							<!-- ==================================系统管理=================================== -->
							<div id="menu30" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 用户权限
									</h4>
									<p>管理员 除提现核准其馀功能</p>
									<p>会计人员 提现核准</p>
									<p>总代理 业务流水</p>
									<p>大代理 业务流水 会员层级</p>
									<p>中代理 业务流水会员层级</p>
									<p>名词解释 管理员：后台操作人员 经营层：包含：公司，代理</p>
									<p>会员/用户：玩家</p>
								</div>
							</div>
							 <c:if test="${type.contains(\"3\")}">
							 
							 <div id="menu5" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
							 
							 
							 </c:if>
							 
							 <c:if test="${type.contains(\"2\")||type.contains(\"3\")}">
						 <div id="menu15" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
							<div id="menu18" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
							<div id="menu19" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
							<div id="menu20" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
							 	  
								</div>
							</div>
							<div id="menu21" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
						 
						 
						 <div id="menu22" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
						 <div id="menu23" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
						 <div id="menu24" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
						 <div id="menu26" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
						 <div id="menu27" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
							<div id="menu28" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i>权限不足
									</h4>
								
								</div>
							</div>
							<div id="menu29" class="tab-pane fade">
								<div class="model content-panel ">
									<h4>
										<i class="fa fa-angle-right"></i> 权限不足
									</h4>
								
								</div>
							</div>
						 </c:if>
						</div>
					</div>
					<!-- 結束 -->
				</div>
				<!-- 白色區域結束 -->
			</div>
		</div>
		</div>
		<!-- main35 -->
		</div>
		<!-- menu35 -->
		<!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content end-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				2017 - 元宝娱乐 <a href="index.jsp#" class="go-top"> <i
					class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery-1.8.3.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="assets/js/jquery.scrollTo.min.js"></script>
	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="assets/js/jquery.sparkline.js"></script>
	<script src="assets/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<!--common script for all pages-->
	<script src="assets/js/common-scripts.js"></script>
	<script type="text/javascript"
		src="assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
	<!--script for this page-->
	<script src="assets/js/sparkline-chart.js"></script>
	<script src="assets/js/zabuto_calendar.js"></script>
	<script src="assets/js/bow.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							// var mesBtncount = 0;
							$('.menu_arrow')
									.click(
											function() {
												// if(mesBtncount==0){
												if ($(this).children('img')
														.attr('src') != 'assets/img/up.png') {
													// mesBtncount++;  
													$(this)
															.children('img')
															.attr('src',
																	'assets/img/up.png');
													$(this)
															.parent()
															.siblings()
															.children()
															.children('img')
															.attr('src',
																	'assets/img/down.png');

												} else {
													// mesBtncount--;

													$(this)
															.children('img')
															.attr('src',
																	'assets/img/down.png');
													$(this)
															.parent()
															.siblings()
															.children()
															.children('img')
															.attr('src',
																	'assets/img/down.png');
												}

											});
						});
	</script>
	<script type="application/javascript">
		
		
                $(document).ready(function() {
                    $("#date-popover").popover({ html: true, trigger: "manual" });
                    $("#date-popover").hide();
                    $("#date-popover").click(function(e) {
                        $(this).hide();
                    });

                    $("#my-calendar").zabuto_calendar({
                        action: function() {
                            return myDateFunction(this.id, false);
                        },
                        action_nav: function() {
                            return myNavFunction(this.id);
                        },
                        ajax: {
                            url: "show_data.php?action=1",
                            modal: true
                        },
                        legend: [
                            { type: "text", label: "Special event", badge: "00" },
                            { type: "block", label: "Regular event", }
                        ]
                    });
                });


                function myNavFunction(id) {
                    $("#date-popover").hide();
                    var nav = $("#" + id).data("navigation");
                    var to = $("#" + id).data("to");
                    console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
                }
                
	
	</script>
</body>

</html>