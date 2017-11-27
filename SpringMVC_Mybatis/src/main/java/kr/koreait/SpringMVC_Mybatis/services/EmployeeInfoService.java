package kr.koreait.SpringMVC_Mybatis.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.ServletContextLiveBeansView;

import kr.koreait.SpringMVC_Mybatis.mapper.EmployeeInfo;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Service
public class EmployeeInfoService {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeInfoService.class);
	
	@Autowired
	private EmployeeInfo employeeInfo;

	public List<Map<String, Object>> getEmailSVC() {
		return employeeInfo.getEmail();
	}

	public List<Map<String, Object>> getJob_typeSVC() {
		logger.info("getJob_typeSVC");
		return employeeInfo.getJob_type();
	}

	public List<Map<String, Object>> getSexSVC() {
		return employeeInfo.getSex();
	}

	public List<Map<String, Object>> getPos_gbn_codeSVC() {
		return employeeInfo.getPos_gbn_code();
	}

	public List<Map<String, Object>> getDept_codeSVC() {
		return employeeInfo.getDept_code();
	}

	public List<Map<String, Object>> getJoin_gbn_codeSVC() {
		return employeeInfo.getJoin_gbn_code();
	}

	public List<Map<String, Object>> getGart_levelSVC() {
		return employeeInfo.getGart_level();
	}

	public List<Map<String, Object>> getPut_ynSVC() {
		return employeeInfo.getPut_yn();
	}

	public List<Map<String, Object>> getMil_ynSVC() {
		return employeeInfo.getMil_yn();
	}

	public List<Map<String, Object>> getMil_typeSVC() {
		return employeeInfo.getMil_type();
	}

	public List<Map<String, Object>> getMil_levelSVC() {
		return employeeInfo.getMil_level();
	}

	public List<Map<String, Object>> getKosa_reg_ynSVC() {
		return employeeInfo.getKosa_reg_yn();
	}

	public List<Map<String, Object>> getKosa_class_codeSVC() {
		return employeeInfo.getKosa_class_code();
	}
	public void setRegistrationSVC(EmployeeVO employeeVO) throws Exception{
		logger.info("setRegistrationSVC");
		employeeVO.setConvertJoin_day(getConvertDate(employeeVO.getJoin_day()));
		employeeVO.setConvertRetire_day(getConvertDate(employeeVO.getRetire_day()));
		employeeInfo.setRegistration(employeeVO);
		
	}
	
	private Date getConvertDate(String convertDate) throws ParseException{
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		return transFormat.parse(convertDate);
	}
	public String getSabunSVC() {
		return employeeInfo.getSabun();
	}
}
