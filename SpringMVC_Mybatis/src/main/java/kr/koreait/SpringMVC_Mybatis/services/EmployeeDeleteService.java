package kr.koreait.SpringMVC_Mybatis.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.koreait.SpringMVC_Mybatis.mapper.EmployeeDelete;

@Service
public class EmployeeDeleteService {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeSearchService.class);
	@Autowired
	private EmployeeDelete employeeDelete;
	public void employeeDeleteSVC(String sabun) {
		employeeDelete.EmployeeDelete(sabun);
	}
	
}
