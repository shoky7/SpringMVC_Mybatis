package kr.koreait.SpringMVC_Mybatis.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.koreait.SpringMVC_Mybatis.mapper.EmployeeInquiry;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Service
public class EmployeeInquiryService {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeInfoService.class);
	
	@Autowired
	private EmployeeInquiry employeeInquiry;

	public EmployeeVO employeeInquiryBySabunSVC(String sabun) {
		logger.info("employeeInquiryBySabunSVC");
		return employeeInquiry.employeeInquiryBySabun(sabun);
	}




	
}