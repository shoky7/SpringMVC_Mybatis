package kr.koreait.SpringMVC_Mybatis.services;

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
	
	public EmployeeVO employeeSearchSVC(EmployeeVO employeeVO){
		logger.info("employeeSearchSVC");
		
		return employeeSearch.employeeSearchSVC(employeeVO);
	}
}
