package com.hanbit.team04.core.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BongBoardVO {
	private int bId;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private int bReadCount;
	private String bPassword;
	private Date bDate;
	private int bRef;
	private int bReStep;
	private int bReLevel;
	private List<BongCommentVO> commentList;
	private List<MultipartFile> myFiles;
	private List<BongFileVO> fileInfoList;
	
	private int commentCount;
	private String lastCommentWriter; 
	////////////////////////////////////////////////////////

	public BongBoardVO(int bId, String bTitle, String bWriter, String bContent, int bReadCount, String bPassword,
			Date bDate, int bRef, int bReStep, int bReLevel) {
		this.bId = bId;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bReadCount = bReadCount;
		this.bPassword = bPassword;
		this.bDate = bDate;
		this.bRef = bRef;
		this.bReStep = bReStep;
		this.bReLevel = bReLevel;
	}
	public BongBoardVO(){
	}
///////////////////////////////////////////////////////////////////////
	
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbReadCount() {
		return bReadCount;
	}

	public void setbReadCount(int bReadCount) {
		this.bReadCount = bReadCount;
	}

	public String getbPassword() {
		return bPassword;
	}

	public void setbPassword(String bPassword) {
		this.bPassword = bPassword;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getbRef() {
		return bRef;
	}

	public void setbRef(int bRef) {
		this.bRef = bRef;
	}

	public int getbReStep() {
		return bReStep;
	}

	public void setbReStep(int bReStep) {
		this.bReStep = bReStep;
	}

	public int getbReLevel() {
		return bReLevel;
	}

	public void setbReLevel(int bReLevel) {
		this.bReLevel = bReLevel;
	}
	
	public List<BongCommentVO> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<BongCommentVO> commentList) {
		this.commentList = commentList;
	}

	public List<MultipartFile> getMyFiles() {
		return myFiles;
	}
	public void setMyFiles(List<MultipartFile> myFiles) {
		this.myFiles = myFiles;
	}
	public List<BongFileVO> getFileInfoList() {
		return fileInfoList;
	}
	public void setFileInfoList(List<BongFileVO> fileInfoList) {
		this.fileInfoList = fileInfoList;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getLastCommentWriter() {
		return lastCommentWriter;
	}
	public void setLastCommentWriter(String lastCommentWriter) {
		this.lastCommentWriter = lastCommentWriter;
	}
	@Override
	public String toString() {
		return "BongBoardVO [bId=" + bId + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bReadCount=" + bReadCount + ", bPassword=" + bPassword + ", bDate=" + bDate + ", bRef=" + bRef
				+ ", bReStep=" + bReStep + ", bReLevel=" + bReLevel + ", commentList=" + commentList + ", myFiles="
				+ myFiles + ", fileInfoList=" + fileInfoList + ", commentCount=" + commentCount + ", lastCommentWriter="
				+ lastCommentWriter + "]";
	}
	
}
