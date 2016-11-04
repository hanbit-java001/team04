package com.hanbit.team04.core.vo;

import java.util.Date;

public class BongCommentVO {
	private int bcId;
	private int bId;
	private String bcWriter;
	private String bcContent;
	private Date bcDate;

	public BongCommentVO() {
	}

	public BongCommentVO(int bcId, int bId, String bcWriter,String bcContent, Date bcDate) {
		this.bcId = bcId;
		this.bId = bId;
		this.bcWriter = bcWriter;
		this.bcDate = bcDate;
	}

	public int getBcId() {
		return bcId;
	}

	public void setBcId(int bcId) {
		this.bcId = bcId;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getBcWriter() {
		return bcWriter;
	}

	public void setBcWriter(String bcWriter) {
		this.bcWriter = bcWriter;
	}

	public String getBcContent() {
		return bcContent;
	}
	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}
	public Date getBcDate() {
		return bcDate;
	}

	public void setBcDate(Date bcDate) {
		this.bcDate = bcDate;
	}

	@Override
	public String toString() {
		return "BongCommentVO [bcId=" + bcId + ", bId=" + bId + ", bcWriter=" + bcWriter + ", bcContent=" + bcContent
				+ ", bcDate=" + bcDate + "]";
	}

}
