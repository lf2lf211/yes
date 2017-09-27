package com.UpPoints.model;

public class UpPointsVO {

	private int memberNo;
	private String account;
	private String name;
	private String loginIP;
	private String level;
	private int points;
	private String status;
	private String time;
	private int addPointsNo;
	private String type;
	
	
	public UpPointsVO() {
		super();
	}
	
	public UpPointsVO(int memberNo,String name, String loginIP, String level,int points,String status,String time, int addPointsNo,String type,String account) {
		super();
		this.memberNo = memberNo;
		this.name = name;
		this.loginIP = loginIP;	
		this.level = level;
		this.points=points;
		this.status = status;
		this.time=time;
		this.addPointsNo= addPointsNo;
		this.type=type;
		this.account=account;
	}

	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getAddPointsNo() {
		return addPointsNo;
	}

	public void setAddPointsNo(int addPointsNo) {
		this.addPointsNo = addPointsNo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginIP() {
		return loginIP;
	}

	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}
	
	
	
	
	
	
	
}
