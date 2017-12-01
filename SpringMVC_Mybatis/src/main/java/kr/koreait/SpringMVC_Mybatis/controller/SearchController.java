package kr.koreait.SpringMVC_Mybatis.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Controller
@RequestMapping("/employee/")
public class SearchController {
	private final static Logger logger = LoggerFactory.getLogger(SearchController.class);
	@Autowired
	
	
	
	@RequestMapping(value="searchCtrl", method=RequestMethod.POST, name="searchCtrl")
	public String searchCtrl(EmployeeVO employeeVO){
		logger.info("searchCtrl");
		
		
		return "HumanResourceManagement/search";
	}
}
