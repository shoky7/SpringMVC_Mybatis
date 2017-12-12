package kr.koreait.SpringMVC_Mybatis.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.koreait.SpringMVC_Mybatis.mapper.EmployeeUpdate;
import kr.koreait.SpringMVC_Mybatis.vo.EmployeeVO;

@Service
public class EmployeeUpdateService {
	private final static Logger logger = LoggerFactory.getLogger(EmployeeUpdateService.class);
	
	@Autowired
	private EmployeeUpdate employeeUadate;
	public void employeeUpdateSVC(EmployeeVO employeeVO) throws Exception {
		logger.info("employeeUpdateSVC");
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
		employeeUadate.employeeUpdateByVO(employeeVO);
	}
	
	private Date getConvertDate(String convertDate) throws ParseException{
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		return transFormat.parse(convertDate);
	}
}
