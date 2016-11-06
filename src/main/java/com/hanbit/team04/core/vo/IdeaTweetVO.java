package com.hanbit.team04.core.vo;

public class IdeaTweetVO {
	private int ideaIDX;
	private long tweetId;
	private int reTweet;
	private int favorite;
	private String fileId;

	public IdeaTweetVO(int ideaIDX, long tweetId, int reTweet, int favorite, String fileId) {
		super();
		this.ideaIDX = ideaIDX;
		this.tweetId = tweetId;
		this.reTweet = reTweet;
		this.favorite = favorite;
		this.fileId = fileId;
	}

	public IdeaTweetVO() {
		super();
	}

	public int getIdeaIDX() {
		return ideaIDX;
	}

	public long getTweetId() {
		return tweetId;
	}

	public int getReTweet() {
		return reTweet;
	}

	public int getFavorite() {
		return favorite;
	}

	public String getFileId() {
		return fileId;
	}

	public void setIdeaIDX(int ideaIDX) {
		this.ideaIDX = ideaIDX;
	}

	public void setTweetId(long tweetId) {
		this.tweetId = tweetId;
	}

	public void setReTweet(int reTweet) {
		this.reTweet = reTweet;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	@Override
	public String toString() {
		return "IdeaTweet [ideaIDX=" + ideaIDX + ", tweetId=" + tweetId + ", reTweet=" + reTweet + ", favorite="
				+ favorite + ", fileId=" + fileId + "]";
	}

}
