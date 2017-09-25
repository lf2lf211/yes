package com.UpPoints.model;
import java.util.List;



public class UpPointsService {
	private UpPointsDAO dao;
	
	
	
	public UpPointsService() {
		dao = new UpPointsDAO();
	}
	
	
	public  UpPointsVO addUpPointsVO(int memberNo,String name,String loginIP, String level,int points,String status,String time) {
		UpPointsVO upPoints = new UpPointsVO();
		upPoints.setMemberNo(memberNo);
		upPoints.setName(name);
		upPoints.setLoginIP(loginIP);
		upPoints.setPoints(points);
		upPoints.setLevel(level);
		upPoints.setStatus(status);
		upPoints.setTime(time);
		dao.add(upPoints);
		return upPoints;

	}

	public UpPointsVO updateUpPointsVO(String name,String loginIP, String level,int points) {
		UpPointsVO upPoints = new UpPointsVO();


		upPoints.setName(name);
		upPoints.setLoginIP(loginIP);
		upPoints.setPoints(points);
		upPoints.setLevel(level);
		dao.update(upPoints);
		return upPoints;

	}
	
	public void addUpPointsVO(UpPointsVO upPoints) {
		dao.update(upPoints);
	}
	

	public void deleteMemberVO(Integer mem_id) {
		dao.delete(mem_id);
	}

	public UpPointsVO getOneUpPointsVO(Integer mem_id) {
		return dao.findByPK(mem_id);
	}

	public List<UpPointsVO> getAll() {
		return dao.getAll();
	}
	
	
	
	
	
	
	
	
}
