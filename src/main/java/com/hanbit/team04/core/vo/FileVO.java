package com.hanbit.team04.core.vo;

import java.util.Arrays;

public class FileVO {

	private String fileId;
	private String filePath;
	private String contentType;
	private long fileSize;
	private String fileName;
	private byte[] fileData;

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getFileData() {
		return fileData;
	}

	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	@Override
	public String toString() {
		return "FileVO [fileId=" + fileId + ", filePath=" + filePath + ", contentType=" + contentType + ", fileSize="
				+ fileSize + ", fileName=" + fileName + ", fileData=" + Arrays.toString(fileData) + "]";
	}

}
