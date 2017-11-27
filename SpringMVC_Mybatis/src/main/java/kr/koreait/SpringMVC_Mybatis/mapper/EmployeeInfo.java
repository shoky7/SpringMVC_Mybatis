package kr.koreait.SpringMVC_Mybatis.mapper;

import java.util.List;
import java.util.Map;

import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

public interface EmployeeInfo {
	public void setRegistration(EmployeeVO employeeVO);
	public List<Map<String, Object>> getEmail();
	public List<Map<String, Object>> getJob_type();
	public List<Map<String, Object>> getSex();
	public List<Map<String, Object>> getPos_gbn_code();
	public List<Map<String, Object>> getDept_code();
	public List<Map<String, Object>> getJoin_gbn_code();
	public List<Map<String, Object>> getGart_level();
	public List<Map<String, Object>> getPut_yn();
	public List<Map<String, Object>> getMil_yn();
	public List<Map<String, Object>> getMil_type();
	public List<Map<String, Object>> getMil_level();
	public List<Map<String, Object>> getKosa_reg_yn();
	public List<Map<String, Object>> getKosa_class_code();
	public String getSabun();
}
