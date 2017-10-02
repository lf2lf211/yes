package com.UpPoints.model;

import java.util.List;
import java.util.Map;


public interface UpPointsInterface  {
		
	void add(UpPointsVO uppointsVO);
	void update(UpPointsVO uppointsVO);
	void updateStatus(UpPointsVO uppointsVO);
	void delete(int addPointsNo);
	UpPointsVO findByPK(int addPointsNo);
	List<UpPointsVO> getAll_By_Up();
	List<UpPointsVO> getAll_By_Down();
	List<UpPointsVO> getAll_By_Up2(String account,int memberNo);
	List<UpPointsVO> getAll_By_Down2(String acount,int memberNo);
	List<UpPointsVO> getAll();
	List<UpPointsVO> getAll(Map<String, String[]> map);
}
