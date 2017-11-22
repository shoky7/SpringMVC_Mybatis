package kr.koreait.SpringMVC_Mybatis.mapper;

import java.util.List;
import java.util.Map;

public interface EmployeeInfo {
	public List<Map<String, Object>> getWorkingStatus();
	public List<Map<String, Object>> getDispatch();
	public List<Map<String, Object>> getRank();
	public List<Map<String, Object>> getJob();
}
