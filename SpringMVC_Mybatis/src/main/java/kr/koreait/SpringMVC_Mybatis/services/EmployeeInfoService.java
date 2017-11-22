package kr.koreait.SpringMVC_Mybatis.services;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.koreait.SpringMVC_Mybatis.mapper.EmployeeInfo;

@Service
public class EmployeeInfoService {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeInfoService.class);
	
	@Autowired
	private EmployeeInfo employeeInfo;
	
	public List<Map<String, Object>> getWorkingStatusSVC(){
		logger.info("getWorkingStatusSVC");
		return employeeInfo.getWorkingStatus();
	}
	
	public List<Map<String, Object>> getDispatchSVC(){
		logger.info("getDispatchSVC");
		return employeeInfo.getDispatch();
	}
	
	public List<Map<String, Object>> getRankSVC(){
		logger.info("getRankSVC");
		return employeeInfo.getRank();
	}
	
	public List<Map<String, Object>> getJobSVC(){
		logger.info("getJobSVC");
		return employeeInfo.getJob();
	}
	
	
	
}
