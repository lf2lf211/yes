package com.UpPoints.model;

import java.util.List;


public interface UpPointsInterface  {
		
	void add(UpPointsVO uppointsVO);
	void update(UpPointsVO uppointsVO);
	void delete(Integer memberNO);
	UpPointsVO findByPK(Integer memberNO);
	List<UpPointsVO> getAll();
}
