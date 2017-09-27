package com.UpPoints.model;

import java.util.List;


public interface UpPointsInterface  {
		
	void add(UpPointsVO uppointsVO);
	void update(UpPointsVO uppointsVO);
	void updateStatus(UpPointsVO uppointsVO);
	void delete(int addPointsNo);
	UpPointsVO findByPK(int addPointsNo);
	List<UpPointsVO> getAll_By_Up();
	List<UpPointsVO> getAll_By_Down();
	List<UpPointsVO> getAll();
}
