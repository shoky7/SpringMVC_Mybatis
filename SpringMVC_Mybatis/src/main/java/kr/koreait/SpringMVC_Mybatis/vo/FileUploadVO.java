package kr.koreait.SpringMVC_Mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadVO {
	private String name;
	private MultipartFile imageUpload;
	private MultipartFile carrierUpload;
	private MultipartFile cmp_reg_imageUpload;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getImageUpload() {
		return imageUpload;
	}
	public void setImageUpload(MultipartFile imageUpload) {
		this.imageUpload = imageUpload;
	}
	public MultipartFile getCarrierUpload() {
		return carrierUpload;
	}
	public void setCarrierUpload(MultipartFile carrierUpload) {
		this.carrierUpload = carrierUpload;
	}
	public MultipartFile getCmp_reg_imageUpload() {
		return cmp_reg_imageUpload;
	}
	public void setCmp_reg_imageUpload(MultipartFile cmp_reg_imageUpload) {
		this.cmp_reg_imageUpload = cmp_reg_imageUpload;
	}
}
