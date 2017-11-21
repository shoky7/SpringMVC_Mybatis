package kr.koreait.SpringMVC_Mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HumanResourceManagementController {
	@RequestMapping("/index")
	public String homeCtrl() {
		return "HumanResourceManagement/index";
	}
	

}
