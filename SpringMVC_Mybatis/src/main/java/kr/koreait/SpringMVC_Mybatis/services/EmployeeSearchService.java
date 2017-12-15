package kr.koreait.SpringMVC_Mybatis.services;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.koreait.SpringMVC_Mybatis.mapper.EmployeeSearch;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Service
public class EmployeeSearchService {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeSearchService.class);
	@Autowired
	private EmployeeSearch employeeSearch;
	public ArrayList<EmployeeVO> employeeSearchSVC(HashMap<String, Object> hmap) {
		logger.info("employeeSearchSVC()");
		System.out.println(hmap.get("employeeVO"));
		return employeeSearch.EmployeeSearch(hmap);
	}
	public int SearchCount(EmployeeVO employeeVO) {
		logger.info("SearchCount");
		return employeeSearch.EmployeeCount(employeeVO);
	}
}
