package kr.koreait.SpringMVC_Mybatis.vo;

import java.util.Date;

public class MvcboardVO {

	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private int ref;
	private int lev;
	private int seq;
	private int readCount;
	private Date writeDate;
	
	public MvcboardVO() {
	}

	public MvcboardVO(String name, String password, String subject,
			String content) {
		this.name = name;
		this.password = password;
		this.subject = subject;
		this.content = content;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "MvcBoardVO [idx=" + idx + ", name=" + name + ", subject="
				+ subject + ", content=" + content + ", ref=" + ref + ", lev="
				+ lev + ", seq=" + seq + ", readCount=" + readCount
				+ ", writeDate=" + writeDate + "]";
	}
}
