package com.ycar.server.carpool.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.server.carpool.dao.DriverReservationDao;

@Service
public class updateService {

	@Autowired
	private SqlSessionTemplate template;
	private DriverReservationDao dao;
	
	//취소,거절
	public int cancleCarpool(int r_idx) {
		
		dao = template.getMapper(DriverReservationDao.class);
		
		System.out.println("거절,취소) r_idx  : " + r_idx);
		
		int cnt = 0;
		cnt = dao.cancleCarpool(r_idx);
		
		return cnt;
	}
	
		//승낙
		public int concentCarpool(int r_idx) {
			
			dao = template.getMapper(DriverReservationDao.class);
			
			System.out.println("승낙) r_idx  : " + r_idx);
			
			int cnt = 0;
			cnt = dao.concentCarpool(r_idx);
			
			return cnt;
		}
}
