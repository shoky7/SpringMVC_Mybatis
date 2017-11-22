package kr.koreait.SpringMVC_Mybatis.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.SpringMVC_Mybatis.services.EmployeeInfoService;

@Controller
@RequestMapping("/employee/")
public class EmployeeController {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeInfoService employeeInfoService;
	
	@RequestMapping(value = "search", method = RequestMethod.GET, name="employee Search searchCtrl")
	public String searchCtrl(Model model) {
		logger.info("searchCtrl");
		List<Map<String, Object>> wslist = employeeInfoService.getWorkingStatusSVC();
		List<Map<String, Object>> dlist = employeeInfoService.getDispatchSVC();
		List<Map<String, Object>> rlist = employeeInfoService.getRankSVC();
		List<Map<String, Object>> jlist = employeeInfoService.getJobSVC();

		model.addAttribute("workStatus", wslist);
		model.addAttribute("dispatch", dlist);
		model.addAttribute("rank", rlist);
		model.addAttribute("job", jlist);
		return "HumanResourceManagement/search";
	}
}
