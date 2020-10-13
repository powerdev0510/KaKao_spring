package com.ycar.server.par.passenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.server.par.domain.Review;
import com.ycar.server.par.passenger.dao.PassengerReviewDao;

@Service("reviewInsertPassengerService")
public class ReviewInsertPassengerService {

	@Autowired
	private SqlSessionTemplate template;
	
	private PassengerReviewDao dao;
	
	//original : 탑승자와 운전자 겹치는 코드가 많아서 1개의 서비스에서 분기처리함 
	//2019.09.19 : 탑승자 - 운전자 서비스 분리
	public int insertReview(Review review) {
		dao = template.getMapper(PassengerReviewDao.class);
		
		System.out.println("리뷰 등록 03  "+review.toString());
		
		//반환할 결과값 
		int rscnt = 0;
		
		//writer 정의  + d_idx 정의 
		if(review != null 
				&& review.getP_idx()>0 
				&& review.getD_idx()==0) {
			review.setWriter("탑승자");
			review.setD_idx(dao.selectD_idx(review.getPayidx()));
			System.out.println("리뷰 등록 04  "+review.toString());
			
			//기존에 payidx + 탑승자 라는 작성자로 등록된 리뷰 내역이 있는지 확인 --> 없다면 등록처리, 있다면 rscnt 자동으로 0
			if(dao.selectReviewRecordByPayidx(review.getPayidx(), review.getWriter())==null) {
				rscnt = dao.insertReview(review);
			}
		}
		System.out.println("리뷰 등록 05  "+rscnt);
		return rscnt;
	}
}