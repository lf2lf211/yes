package com.thirdpartypayment.model;

public class ThirdPartyPaymentVO {
	
	private long orderNo ;
	private String openId ;
	private String name ; 
	private String payType ;
	private int amt ;
	private int balance ; 
	private String state ;
	private String loginIP ; 
	private String loginTime;
	private String requestTime;
	private String responseTime ;
	public ThirdPartyPaymentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThirdPartyPaymentVO(long orderNo, String openId, String name, String payType, int amt, int balance, String state, String loginIP, String loginTime, String requestTime, String responseTime) {
		super();
		this.orderNo = orderNo;
		this.openId = openId;
		this.name = name;
		this.payType = payType;
		this.amt = amt;
		this.balance = balance;
		this.state = state;
		this.loginIP = loginIP;
		this.loginTime = loginTime;
		this.requestTime = requestTime;
		this.responseTime = responseTime;
	}
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getAmt() {
		return amt;
	}
	public void setAmt(int amt) {
		this.amt = amt;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLoginIP() {
		return loginIP;
	}
	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	public String getResponseTime() {
		return responseTime;
	}
	public void setResponseTime(String responseTime) {
		this.responseTime = responseTime;
	}

	
	
	
}
