package kr.koreait.SpringMVC_Mybatis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.koreait.SpringMVC_Mybatis.services.EmployeeInfoService;
import kr.koreait.SpringMVC_Mybatis.services.EmployeeInquiryService;
import kr.koreait.SpringMVC_Mybatis.services.EmployeeSearchService;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeePage;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Controller
@RequestMapping("/employee/")
public class SearchController {
	private final static Logger logger = LoggerFactory.getLogger(SearchController.class);
	@Autowired
	private EmployeeSearchService employeeSearchService;
	@Autowired
	private EmployeeInfoService employeeInfoService;
	@Autowired
	private EmployeeInquiryService employeeInquiryService;
	
	private void modelData(Model model){
		// TODO:
		// 셀렉트박스들의 기본적인 데이터를 DB를 조회하여, 페이지에 데이터를 넘겨준다.
		List<Map<String, Object>> email_list = employeeInfoService.getEmailSVC();	// 이메일 selectbox
		List<Map<String, Object>> job_type_list = employeeInfoService.getJob_typeSVC();			// 직종체크
		List<Map<String, Object>> sex_list = employeeInfoService.getSexSVC();			// 성별
		List<Map<String, Object>> pos_gbn_code_list = employeeInfoService.getPos_gbn_codeSVC();			// 직위
		List<Map<String, Object>> dept_code_list = employeeInfoService.getDept_codeSVC();		// 부서
		List<Map<String, Object>> join_gbn_code_list = employeeInfoService.getJoin_gbn_codeSVC();			// 입사구분
		List<Map<String, Object>> gart_level_list = employeeInfoService.getGart_levelSVC();			// 등급
		List<Map<String, Object>> put_yn_list = employeeInfoService.getPut_ynSVC();			// 투입여부
		List<Map<String, Object>> mil_yn_list = employeeInfoService.getMil_ynSVC();		// 군필여부
		List<Map<String, Object>> mil_type_list = employeeInfoService.getMil_typeSVC();			// 군별
		List<Map<String, Object>> mil_level_list = employeeInfoService.getMil_levelSVC();			// 계급
		List<Map<String, Object>> kosa_reg_yn_list = employeeInfoService.getKosa_reg_ynSVC();			// KOSA등록
		List<Map<String, Object>> kosa_class_code_list = employeeInfoService.getKosa_class_codeSVC();			// KOSA등급
		
		model.addAttribute("email", email_list);
		model.addAttribute("job_type", job_type_list);
		model.addAttribute("sex", sex_list);
		model.addAttribute("pos_gbn_code", pos_gbn_code_list);
		model.addAttribute("dept_code", dept_code_list);
		model.addAttribute("join_gbn_code", join_gbn_code_list);
		model.addAttribute("gart_level", gart_level_list);
		model.addAttribute("put_yn", put_yn_list);
		model.addAttribute("mil_yn", mil_yn_list);
		model.addAttribute("mil_type", mil_type_list);
		model.addAttribute("mil_level", mil_level_list);
		model.addAttribute("kosa_reg_yn", kosa_reg_yn_list);
		model.addAttribute("kosa_class_code", kosa_class_code_list);
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET, name="employee Search searchCtrl")
	public String searchForm(Model model) {
		logger.info("searchForm");
		modelData(model);
		return "HumanResourceManagement/search";
	}
	@RequestMapping(value="searchCtrl", method=RequestMethod.POST, name="searchCtrl")
	public String searchCtrl(EmployeeVO employeeVO,Model model,HttpServletRequest request){
		logger.info("searchCtrl");
		modelData(model);
		model.addAttribute("employeeVO",employeeVO);
//		테이블에 검색된 글의 갯수를 total해서 가져온다.
		int totalCount =  employeeSearchService.SearchCount(employeeVO);
//		글 갯수
		int pageSize = 10;
//		현재페이지
		int currentPage = 1;
		try{
			currentPage =Integer.parseInt(request.getParameter("currentPage"));
		}catch (Exception e) {}

		EmployeePage EmployeeVOList = new EmployeePage(pageSize, totalCount, currentPage);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startNo", EmployeeVOList.getStartNo());
		hmap.put("endNo", EmployeeVOList.getEndNo());
		hmap.put("employeeVO", employeeVO);
		EmployeeVOList.setList(employeeSearchService.employeeSearchSVC(hmap));
		model.addAttribute("EmployeeVOList",EmployeeVOList);
		return "HumanResourceManagement/search";
	}
	@RequestMapping(value="searchUpdate", method=RequestMethod.POST, name="searchUpdate")
	public String SearchCtrlCtrl(EmployeeVO employeeVO,Model model){
		logger.info("searchUpdate");
		employeeVO = employeeInquiryService.employeeInquiryBySabunSVC(employeeVO.getUpdateSabun());
        employeeVO.setJoin_day(employeeVO.getJoin_day().substring(0, 10));
        employeeVO.setRetire_day(employeeVO.getRetire_day().substring(0, 10));
		model.addAttribute("employeeVO",employeeVO);
		modelData(model);
		return "HumanResourceManagement/employeeUpdate";
	}
}
