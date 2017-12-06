package kr.koreait.SpringMVC_Mybatis.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

public interface EmployeeSearch {

	int EmployeeCount(EmployeeVO employeeVO);
	ArrayList<EmployeeVO> EmployeeSearch(HashMap<String, Object> hmap);
}
