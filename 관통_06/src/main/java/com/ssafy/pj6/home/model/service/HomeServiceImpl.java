package com.ssafy.pj6.home.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.pj6.home.model.HomeDto;
import com.ssafy.pj6.home.model.repo.HomeRepo;

@Service
public class HomeServiceImpl implements HomeService {

	HomeRepo homeRepo;

	@Autowired
	public HomeServiceImpl(HomeRepo homeRepo) {
		this.homeRepo = homeRepo;
	}

	@Override
	public List<HomeDto> listDeal(Map<String, String> map) throws Exception {
		return homeRepo.listDeal(map);
	}

	@Override
	public HomeDto findApt(String deal_no) throws SQLException {
		return homeRepo.findByDealCode(deal_no);
	}

}
