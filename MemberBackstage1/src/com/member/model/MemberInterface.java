package com.member.model;

import java.util.List;


public interface MemberInterface {
	void add(MemberVO memberVO);
	void update(MemberVO memberVO);
	void delete(Integer memberNO);
	MemberVO findByPK(Integer memberNO);
	MemberVO findByAC(String account);
	List<MemberVO> getAll();
	List<MemberVO> getAllSuperior(String account);
	List<MemberVO> getAllSuperior2(String account);
	List<MemberVO> getAllName(String name);
}
