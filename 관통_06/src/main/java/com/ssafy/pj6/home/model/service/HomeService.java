package com.ssafy.pj6.home.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.pj6.home.model.HomeDto;

public interface HomeService {
	List<HomeDto> listDeal(Map<String, String> map) throws Exception;
	
	HomeDto findApt(String deal_no) throws SQLException;
}
