package kr.koreait.SpringMVC_Mybatis.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.SpringMVC_Mybatis.services.EmployeeInquiryService;
import kr.koreait.SpringMVC_Mybatis.services.EmployeeUpdateService;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Controller
@RequestMapping("/employee/")
public class EmployeeUpdateController {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeUpdateController.class);
	@Autowired
	private EmployeeUpdateService employeeUpdateService;
	@Autowired
	private EmployeeInquiryService employeeInquiryService;
	
	@RequestMapping(value="employeeUpdate", method = RequestMethod.POST, name="employeeUpdate")
	public String EmployeeUpdateCtrl(EmployeeVO employeeVO,Model model) throws Exception{
		logger.info("employeeUpdateCtrl");
		employeeUpdateService.employeeUpdateSVC(employeeVO);
		employeeVO = employeeInquiryService.employeeInquiryBySabunSVC(employeeVO.getSabun());
		model.addAttribute("employeeVO",employeeVO);
		return "HumanResourceManagement/updateComplete";
	}
	
}
