package kr.koreait.SpringMVC_Mybatis.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		employeeVO.setSalary(employeeVO.getSalary().replace(",", ""));
		employeeVO.setEmail(employeeVO.getEmail()+ "@" +employeeVO.getEmail2());
		employeeVO.setConvertJoin_day(getConvertDate(employeeVO.getJoin_day()));
		employeeVO.setConvertRetire_day(getConvertDate(employeeVO.getRetire_day()));
		if(employeeVO.getMil_yn().equals("2")){
			employeeVO.setMil_type("");
			employeeVO.setMil_level("");
			employeeVO.setMil_startdate("");
			employeeVO.setMil_enddate("");
		}
		employeeInfo.setRegistration(employeeVO);
	}
	
	private Date getConvertDate(String convertDate) throws Exception{
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		return transFormat.parse(convertDate);
	}
	public String getSabunSVC() {
		return employeeInfo.getSabun();
	}
}
