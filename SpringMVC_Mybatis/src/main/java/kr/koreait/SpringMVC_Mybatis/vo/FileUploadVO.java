package kr.koreait.SpringMVC_Mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadVO {
	private String name;
	private MultipartFile fileUpload;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(MultipartFile fileUpload) {
		this.fileUpload = fileUpload;
	}
	
	
	
}
