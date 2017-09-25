package com.thirdpartypayment.model;

import java.util.List;

public interface ThirdPartyPaymentInterFace {

		void add(ThirdPartyPaymentVO thirdPartyPaymentVO);

		void update(ThirdPartyPaymentVO thirdPartyPaymentVO);

		void delete(Integer orderNo);

		ThirdPartyPaymentVO findByPK(Integer orderNo);
		
		ThirdPartyPaymentVO findByOpenIdAndRequestTime(String openId , String requestTime);

		List<ThirdPartyPaymentVO> getAll();


}
