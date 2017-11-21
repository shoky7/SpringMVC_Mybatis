package kr.koreait.SpringMVC_Mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/employee/")
public class EmployeeController {
	
	@RequestMapping(value = "search", method = RequestMethod.GET, name="employee Search searchCtrl")
	public String searchCtrl() {
		
		return "HumanResourceManagement/search";
	}
}
