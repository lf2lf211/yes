package com.member.model;

import java.util.List;

public class MemberService {
	private MemberDAO dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public MemberVO addMemberVO(String account, String password, String name, Double balance,
			String loginIP, String loginTime, String level, String state ,String superior,String superior2 , int commission) {
		MemberVO mem = new MemberVO();
		mem.setAccount(account);
		mem.setPassword(password);
		mem.setName(name);
		mem.setBalance(balance);
		mem.setLoginIP(loginIP);
		mem.setLoginTime(loginTime);
		mem.setLevel(level);
		mem.setState(state);
		mem.setSuperior(superior);	
		mem.setSuperior2(superior2);
		mem.setCommission(commission);
		dao.add(mem);
		return mem;

	}

	public MemberVO updateMemberVO(String account, String password, String name, Double balance,
			String loginIP, String loginTime, String level, String state , String superior , int commission) {
		MemberVO mem = new MemberVO();

		mem.setAccount(account);
		mem.setPassword(password);
		mem.setName(name);
		mem.setBalance(balance);
		mem.setLoginIP(loginIP);
		mem.setLoginTime(loginTime);
		mem.setLevel(level);
		mem.setState(state);
		mem.setSuperior(superior);
		mem.setCommission(commission);
		dao.update(mem);
		return mem;

	}
	
	public void updateMemberVO(MemberVO memberVO) {
		dao.update(memberVO);
	}
	

	public void deleteMemberVO(Integer mem_id) {
		dao.delete(mem_id);
	}

	public MemberVO getOneMemberVO(Integer mem_id) {
		return dao.findByPK(mem_id);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}
	public List<MemberVO> getAllSuperior(String account) {
		return dao.getAllSuperior(account);
	}
	public List<MemberVO> getAllSuperior2(String account) {
		return dao.getAllSuperior2(account);
	}
	public MemberVO CheckOneMemberVO(String mem_account) {
		return dao.findByAC(mem_account);
	}
	public List<MemberVO> getAllName(String name){
		return dao.getAllName(name);
	}
	
}
