package com.ycar.server.par.passenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.server.par.domain.Review;
import com.ycar.server.par.passenger.dao.PassengerReviewDao;

@Service("deleteReviewByPassenger")
public class DeleteReviewByPassengerService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private PassengerReviewDao dao;
	
	public int deleteReview(int rv_idx, int p_idx) {
		dao = template.getMapper(PassengerReviewDao.class);
		int rscnt = 0; //반환값 
		
		//1. rv_idx 에 해당하는 리뷰가 존재하는지 확인
		Review review = dao.selectByRvIdx(rv_idx);
		System.out.println("후기 삭제 03  "+review.toString());
		
		//일치하는 리뷰 내역이 있고 + 그 작성자가 현재 삭제요청한 사람과 같다면, 삭제처리 
		if(review != null && review.getP_idx() == p_idx){
			rscnt = dao.deletePassengerReview(rv_idx);
			System.out.println("후기 삭제 04-1  "+rscnt);
		} else { //그 밖의 예외상황들 
			rscnt = 0;
		}
		
		System.out.println("후기 삭제 05  "+rscnt);
		return rscnt;
	}
}
