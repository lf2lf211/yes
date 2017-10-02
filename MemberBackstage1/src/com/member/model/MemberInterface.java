package com.member.model;

import java.util.List;
import java.util.Map;

import com.UpPoints.model.UpPointsVO;


public interface MemberInterface {
	void add(MemberVO memberVO);
	void update(MemberVO memberVO);
	void delete(Integer memberNO);
	MemberVO findByPK(Integer memberNO);
	MemberVO findByAC(String account);
	List<MemberVO> getAll();
	List<MemberVO> getAll(Map<String, String[]> map);
	List<MemberVO> getAllSuperior(String account);
	List<MemberVO> getAllSuperior2(String account);
	List<MemberVO> getAllName(String name);
}
