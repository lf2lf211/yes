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

	public UpPointsVO updateUpPointsVO(int addPointsNo, String name,String loginIP, String level,int points) {
		UpPointsVO upPoints = new UpPointsVO();

		upPoints.setAddPointsNo(addPointsNo);
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
	
	
	public UpPointsVO updateStatus(String status,int addPointsNo){
		UpPointsVO uppointsVO = new UpPointsVO();
		uppointsVO.setStatus(status);
		uppointsVO.setAddPointsNo(addPointsNo);
		dao.updateStatus(uppointsVO);
		return uppointsVO;
	}
	

	public void deleteMemberVO(int addPointsNo) {
		dao.delete(addPointsNo);
	}

	public UpPointsVO getOneUpPointsVO(int addPointsNo) {
		return dao.findByPK(addPointsNo);
	}

	public List<UpPointsVO> getAll() {
		return dao.getAll();
	}
	
	
	
	
	
	
	
	
}
