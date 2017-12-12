package kr.koreait.SpringMVC_Mybatis.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.SpringMVC_Mybatis.services.EmployeeDeleteService;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Controller
@RequestMapping("/employee/")
public class EmployeeDeleteController {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeDeleteController.class);
	@Autowired
	private EmployeeDeleteService deleteService;
	@RequestMapping(value= "employeeDelete", method = RequestMethod.POST, name="EmployeeDeleteCtrl")
	public String EmployeeDeleteCtrl(EmployeeVO employeeVO,Model model){
		logger.info("EmployeeDeleteCtrl");
		deleteService.employeeDeleteSVC(employeeVO.getUpdateSabun());
		model.addAttribute("sabun",employeeVO.getUpdateSabun());
		return "HumanResourceManagement/DeleteComplete";
	}
	
}
