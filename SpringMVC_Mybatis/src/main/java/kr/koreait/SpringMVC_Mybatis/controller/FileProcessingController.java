package kr.koreait.SpringMVC_Mybatis.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.koreait.SpringMVC_Mybatis.vo.FileUploadVO;
@Controller
@RequestMapping("/fileProcessing/")
public class FileProcessingController {
	private final static Logger logger = LoggerFactory.getLogger(FileProcessingController.class);
	private static final String UPLOAD_DIRECTORY = "D://myGit/SpringMVC_Mybatis/src/main/webapp/resources/uploadFiles";
	@RequestMapping(value="upload",method=RequestMethod.POST ,name="uploadCtrl")
	public @ResponseBody String uploadCtrl(FileUploadVO fileUploadVO)throws Exception{
		logger.info("uploadCtrl");
		File updFile = multipartToFile(fileUploadVO.getHumanImageUpload());
		String path = updFile.getPath();
		path = path.replace("D:\\myGit\\SpringMVC_Mybatis\\src\\main\\webapp", "").replace("\\", "/");
		Map<String, String> map = new HashMap<>();
		map.put("message","success");
		map.put("filePath", path);
		return new Gson().toJson(map);
	}
	private File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException{
		File convFile = new File(UPLOAD_DIRECTORY, multipart.getOriginalFilename());
	    multipart.transferTo(convFile);
	    return convFile;
	}
}
