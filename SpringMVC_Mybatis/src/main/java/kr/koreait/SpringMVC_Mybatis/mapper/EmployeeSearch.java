package kr.koreait.SpringMVC_Mybatis.mapper;

import java.util.ArrayList;

import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

public interface EmployeeSearch {

	ArrayList<EmployeeVO> EmployeeSearch(EmployeeVO employeeVO);

}
