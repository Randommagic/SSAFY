package com.ssafy.pj6.home.model.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.pj6.home.model.HomeDto;

public interface HomeRepo {
	List<HomeDto> listDeal(Map<String, String> map) throws SQLException;
	HomeDto findByDealCode(String apt_code) throws SQLException; // 아파트 한개 검색
}
