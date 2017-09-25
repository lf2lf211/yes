package com.thirdpartypayment.model;

import java.util.List;

public class ThirdPartyPaymentSvc {

	private ThirdPartyPaymentDAO dao;

	public ThirdPartyPaymentSvc() {
		dao = new ThirdPartyPaymentDAO();
	}

	public ThirdPartyPaymentVO addThirdPartyPaymentVO(String openId, String name, String payType, int amt,
			int balance, String state, String loginIP, String loginTime, String requestTime, String responseTime) {

		ThirdPartyPaymentVO thirdPartyPaymentVO = new ThirdPartyPaymentVO();
		thirdPartyPaymentVO.setOpenId(openId);
		thirdPartyPaymentVO.setName(name);
		thirdPartyPaymentVO.setPayType(payType);
		thirdPartyPaymentVO.setAmt(amt);
		thirdPartyPaymentVO.setBalance(balance);
		thirdPartyPaymentVO.setState(state);
		thirdPartyPaymentVO.setLoginIP(loginIP);
		thirdPartyPaymentVO.setLoginTime(loginTime);
		thirdPartyPaymentVO.setRequestTime(requestTime);
		thirdPartyPaymentVO.setResponseTime(responseTime);
		dao.add(thirdPartyPaymentVO);
		return thirdPartyPaymentVO;

	}

	public ThirdPartyPaymentVO updateThirdPartyPaymentVO(String openId, String name, String payType, int amt,
			int balance, String state, String loginIP, String loginTime, String requestTime, String responseTime,int orderNo) {
		
		ThirdPartyPaymentVO thirdPartyPaymentVO = new ThirdPartyPaymentVO();
		thirdPartyPaymentVO.setOpenId(openId);
		thirdPartyPaymentVO.setName(name);
		thirdPartyPaymentVO.setPayType(payType);
		thirdPartyPaymentVO.setAmt(amt);
		thirdPartyPaymentVO.setBalance(balance);
		thirdPartyPaymentVO.setState(state);
		thirdPartyPaymentVO.setLoginIP(loginIP);
		thirdPartyPaymentVO.setLoginTime(loginTime);
		thirdPartyPaymentVO.setRequestTime(requestTime);
		thirdPartyPaymentVO.setResponseTime(responseTime);
		thirdPartyPaymentVO.setOrderNo(orderNo);
		dao.update(thirdPartyPaymentVO);
		return thirdPartyPaymentVO;

	}

	public void updateThirdPartyPaymentVO(ThirdPartyPaymentVO thirdPartyPaymentVO) {
		dao.update(thirdPartyPaymentVO);
	}

	public void deleteThirdPartyPaymentVO(Integer orderNo) {
		dao.delete(orderNo);
	}

	public ThirdPartyPaymentVO getOneThirdPartyPaymentVO(Integer orderNo) {
		return dao.findByPK(orderNo);
	}
	public ThirdPartyPaymentVO getOneThirdPartyPaymentVOByOpenId(String openId,String requestTime) {
		return dao.findByOpenIdAndRequestTime(openId, requestTime);
	}
	public List<ThirdPartyPaymentVO> getAll() {
		return dao.getAll();
	}

}
