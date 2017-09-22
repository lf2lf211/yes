package com.member.model;
public class MemberVO {

	private int memberNo;
	private String account;
	private String password;
	private String name;
	private double balance;
	private String loginIP;
	private String loginTime;
	private String level;
	private String state;
	private String superior;
	private String superior2;
	private int commission ; 

	
	public MemberVO() {
		super();
	}
	
	public MemberVO(int memberNo, String account, String password, String name, double balance, String loginIP, String loginTime, String level, String state, String superior,String 
			superior2, int commission) {
		super();
		this.memberNo = memberNo;
		this.account = account;
		this.password = password;
		this.name = name;
		this.balance = balance;
		this.loginIP = loginIP;
		this.loginTime = loginTime;
		this.level = level;
		this.state = state;
		this.superior = superior;
		this.superior = superior2;
		this.commission = commission;
	}

	public String getSuperior2() {
		return superior2;
	}

	public void setSuperior2(String superior2) {
		this.superior2 = superior2;
	}

	public int getCommission() {
		return commission;
	}

	public void setCommission(int commission) {
		this.commission = commission;
	}

	

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int i) {
		this.memberNo = i;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSuperior() {
		return superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}

	
}
