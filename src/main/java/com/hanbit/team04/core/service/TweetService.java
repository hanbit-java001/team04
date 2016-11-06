package com.hanbit.team04.core.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.FileDAO;
import com.hanbit.team04.core.dao.TweetDAO;
import com.hanbit.team04.core.vo.FileVO;
import com.hanbit.team04.core.vo.IdeaBoardVO;
import com.hanbit.team04.core.vo.IdeaTweetVO;

import twitter4j.Status;
import twitter4j.StatusUpdate;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.UploadedMedia;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

@Service
public class TweetService {
	private static final Logger LOGGER = LoggerFactory.getLogger(TweetService.class);
	@Autowired
	private TweetDAO tweetDAO;
	@Autowired
	private FileDAO fileDAO;
	private Twitter twitter;

	private void init() throws TwitterException {
		twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer("kUJT4hz3RnC5rntcPmHNHzDUu", "Mj8VDLGqhh4KBYtC7lTOqk7xo6G0HNljVqV8FgUUWKu98VkPzF");
		RequestToken requestToken = twitter.getOAuthRequestToken();
		AccessToken accessToken = new AccessToken("794128135511941120-IjDU7mWH7FRtwFTByrKuiVhISd76rAK",
				"ZN9sr5YLMpgks2xndxA8cvLbY742OrHkThPaHBk6KVAHC");
		twitter.setOAuthAccessToken(accessToken);
		LOGGER.debug("tweet init ------------------");
	}

	public boolean addTweet(IdeaBoardVO boardVO) throws TwitterException {
		boolean result = false;
		Status status;
		try {
			init();
			LOGGER.debug("check init board VO : " + boardVO);
			String insertString = "";
			insertString += "Title : " + boardVO.getTitle() + "\nRegDate : " + boardVO.getRegDate() + "\nUserId : "
					+ boardVO.getUserId() + "\nContents : " + boardVO.getContents();
			// if(boardVO.getFileId()!="NULL"||boardVO.getFileId()!="null"||boardVO.getFileId()!=null||boardVO.getFileId()!="{null}"){
			// insertString+="\nimage\n </p><img class='reflected select-img'
			// src='http://203.236.209.179:8180/file/"+boardVO.getFileId()+"'>";}
			if (insertString.length() > 130) {
				insertString = insertString.substring(0, 130);
				insertString += "...";
			}
			insertString += "\n -내가씀-";
			LOGGER.debug("tweet String Length : " + insertString.length());
			FileVO fileVO = fileDAO.selectFile(boardVO.getFileId());
			if (fileVO != null) {
				LOGGER.debug("tweet file vo : " + fileVO);
				String filePath = fileVO.getFilePath();
				File imagefile = new File(filePath);

				// long[] mediaIds = new long[2];
				UploadedMedia media1 = twitter.uploadMedia(imagefile);
				LOGGER.debug("tweet uploadMedia ----- ");
				// long[] mediaIds = new long[2];
				// UploadedMedia media1 = twitter.uploadMedia(imagefile1);
				// mediaIds[0] = media1.getMediaId();
				// UploadedMedia media2 = twitter.uploadMedia(imagefile2);
				// mediaIds[1] = media2.getMediaId();
				// long[] mediaIds = new long[3];
				// mediaIds[0]=media1.getMediaId();
				// mediaIds[1]=media1.getMediaId();
				// mediaIds[2]=media1.getMediaId();
				StatusUpdate statusUpdate = new StatusUpdate(insertString);
				statusUpdate.setMediaIds(media1.getMediaId());
				// statusUpdate.setMediaIds(mediaIds);
				status = twitter.updateStatus(statusUpdate);
				LOGGER.debug("tweet update image ");
			} else {
				status = twitter.updateStatus(insertString);
			}
			result = true;
			LOGGER.debug("TWEET add result and ID : " + result + " , " + status.getId());
			int insertRsult = insertTweet(boardVO, status);
			LOGGER.debug("TWEET add result : " + result + " , " + status.getText() + ", insertRsult : " + insertRsult);

		} catch (Exception e) {
			// twitter.destroyStatus(status.getId());
			// TODO: handle exception
			LOGGER.debug("TWEET add result : 망했어");
		}

		return result;
	}

	public Map selectRetweetAndFavorit(String tweetId) throws TwitterException {
		init();
		Map map = new HashMap<>();
		List<Status> statuses = twitter.getHomeTimeline();
		for (Status status : statuses) {
			if (status.getId() == Long.parseLong(tweetId)) {
				map.put("Retweet", status.getRetweetCount());
				map.put("Favorite", status.getFavoriteCount());
				map.put("tweetId", tweetId);
				LOGGER.debug("retweet : " + status.getRetweetCount() + " ,favorite : " + status.getFavoriteCount()
						+ "인데 몇개나 " + status.getUser().getName() + ", text : " + status.getText());
			} else {
				break;
			}
		}

		return map;
	}

	public List<IdeaTweetVO> selectTweet() {
		List list = tweetDAO.selectTweet();
		return list;
	}

	public List<Map> selectUpdate(List<IdeaTweetVO> list) throws TwitterException {
		init();
		List resultList = new ArrayList<>();
		List<Status> statuses = twitter.getHomeTimeline();
		if (list.size() > 0)
			for (Status status : statuses) {
				for (IdeaTweetVO tweetVO : list) {
					if (status.getId() > tweetVO.getTweetId()) {
						break;
					} else {
						if (status.getId() == tweetVO.getTweetId()&&(status.getRetweetCount()!=tweetVO.getReTweet()||status.getFavoriteCount()!=tweetVO.getFavorite())) {
							Map map = new HashMap<>();
							map.put("Retweet", status.getRetweetCount());
							map.put("Favorite", status.getFavoriteCount());
							map.put("tweetId", tweetVO.getTweetId());
							resultList.add(map);
						}
					}
				}

			}
		LOGGER.debug("select update tweet : " + resultList);
		return resultList;

	}

	public int updateRetweetAndFavorit() throws TwitterException {
		int result = -1;
		LOGGER.debug("start update -----");
		List allTweet = selectTweet();
		if (allTweet.size() > 0) {
			LOGGER.debug("update check : " + allTweet);
			List selectUpdateList = selectUpdate(allTweet);
			result = tweetDAO.updateTweet(selectUpdateList);
			LOGGER.debug("update tweet info : " + selectUpdateList + " , result : " + result);
		}
		return result;
	}

	public int insertTweet(IdeaBoardVO boardVO, Status status) {
		IdeaTweetVO ideaTweet = new IdeaTweetVO(boardVO.getBoardIdx(), status.getId(), status.getRetweetCount(),
				status.getFavoriteCount(), boardVO.getFileId());
		int result = tweetDAO.insertTweet(ideaTweet);
		LOGGER.debug("insert tweet : " + ideaTweet + " , " + result);
		return result;
	}
}
