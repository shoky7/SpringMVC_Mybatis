package kr.koreait.SpringMVC_Mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadVO {
	private String name;
	private MultipartFile humanImageUpload;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getHumanImageUpload() {
		return humanImageUpload;
	}
	public void setHumanImageUpload(MultipartFile humanImageUpload) {
		this.humanImageUpload = humanImageUpload;
	}
	
	
}
