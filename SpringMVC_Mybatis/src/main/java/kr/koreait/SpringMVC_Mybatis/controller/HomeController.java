package kr.koreait.SpringMVC_Mybatis.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import kr.koreait.DAO.MybatisDAO;
import kr.koreait.SpringMVC_Mybatis.vo.MvcboardList;
import kr.koreait.SpringMVC_Mybatis.vo.MvcboardVO;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	mybatis를 사용하기 위해 SqlSession 객체를 생성한다.
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, Model model){
		System.out.println("insert()");
		return "insert";
	}
	
	@RequestMapping("/insertOK")
	public String insertOK(HttpServletRequest request,Model model){
		System.out.println("insertOK");
		MybatisDAO dao = sqlSession.getMapper(MybatisDAO.class);
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		dao.insert(new MvcboardVO(name,password,subject,content));
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request,Model model){
		System.out.println("list");
		MybatisDAO dao = sqlSession.getMapper(MybatisDAO.class);
//		한 페이지에 표시할 메인 글의 개수를 결정한다.
		int pageSize = 10;
//		테이블에 저장된 전체 메인 글의 개수를 얻어온다.
		int totalCount = dao.selectCount(); 
		int currentPage = 1;
		try{
			currentPage =Integer.parseInt(request.getParameter("currentPage"));
		}catch(Exception e){
		}
		MvcboardList list = new MvcboardList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		list.setList(dao.selectList(hmap));
		model.addAttribute("list", list);
		return "list";
	}
	
	@RequestMapping("/increment")
	public String increment(HttpServletRequest request, Model model){
		System.out.println("increment");
		MybatisDAO dao = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.increment(idx);
		model.addAttribute("idx",idx);
		return "redirect:contentView";
	}
	
	@RequestMapping("/contentView")
	public String contentView(HttpServletRequest request,Model model){
		System.out.println("contentView()");
		MybatisDAO dao = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		model.addAttribute("vo",dao.selectByIdx(idx));
		return "contentView";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request,Model model){
		System.out.println("delete()");
		MybatisDAO dao = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		String password = request.getParameter("password");
		MvcboardVO vo = dao.selectByIdx(idx);
		System.out.println(vo.getPassword());
		System.out.println(password);
		
		if(vo.getPassword().trim().equals(password.trim())){
			dao.delete(idx);
			model.addAttribute("msg", "삭제완료!!!!"); 
			model.addAttribute("url", "list"); 
			return "passwordcheak";
		}else{
			model.addAttribute("msg", "비밀번호가 틀렸습니다."); 
			model.addAttribute("url", "contentView?idx="+idx); 
			return "passwordcheak";
		}
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request,Model model){
		System.out.println("update()");
		MybatisDAO dao = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		String password = request.getParameter("password");
		MvcboardVO vo = dao.selectByIdx(idx);
		vo.setIdx(idx);
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		if(vo.getPassword().trim().equals(password.trim())){
			dao.update(vo);
			model.addAttribute("msg", "수정완료!!!!"); 
			model.addAttribute("url", "list"); 
			return "passwordcheak";
		}else{
			model.addAttribute("msg", "비밀번호가 틀렸습니다."); 
			model.addAttribute("url", "contentView?idx="+idx); 
			return "passwordcheak";
		}
	}
}
