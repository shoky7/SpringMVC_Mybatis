package kr.koreait.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.koreait.SpringMVC_Mybatis.vo.MvcboardVO;

public interface MybatisDAO {

	void insert(MvcboardVO mvcboardVO);
	int selectCount();
	ArrayList<MvcboardVO> selectList(HashMap<String, Integer> hmap);
	void increment(int idx);
	MvcboardVO selectByIdx(int idx);
	void delete(int idx);
	void update(MvcboardVO vo);

}
