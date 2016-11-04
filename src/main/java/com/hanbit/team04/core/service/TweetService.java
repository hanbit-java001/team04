package com.hanbit.team04.core.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.vo.IdeaBoardVO;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

@Service
public class TweetService {
	private static final Logger LOGGER = LoggerFactory.getLogger(TweetService.class);
	private Twitter twitter;
	private void init() throws TwitterException {
		twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer("kUJT4hz3RnC5rntcPmHNHzDUu", "Mj8VDLGqhh4KBYtC7lTOqk7xo6G0HNljVqV8FgUUWKu98VkPzF");
		RequestToken requestToken = twitter.getOAuthRequestToken();
		AccessToken accessToken = new AccessToken("794128135511941120-IjDU7mWH7FRtwFTByrKuiVhISd76rAK",
				"ZN9sr5YLMpgks2xndxA8cvLbY742OrHkThPaHBk6KVAHC");
		twitter.setOAuthAccessToken(accessToken);
	}
	public boolean addTweet(IdeaBoardVO boardVO) throws TwitterException{
		boolean result = false;
		Status status;
		try {
			init();

			status = twitter.updateStatus("Title : "+boardVO.getTitle()+
										  "\nregDate"+boardVO.getRegDate()+
										  "\nuserId"+boardVO.getUserId()+
										  "\ncontents"+boardVO.getContents()+
										  "\n -내가씀-");
			result=true;
			LOGGER.debug("TWEET add result : "+result +" , "+status.getText());
		} catch (Exception e) {
			// TODO: handle exception
			LOGGER.debug("TWEET add result : 망했어");
		}


		return result;
	}
	public Map selectRetweetAndFavorit(String tweetId) throws TwitterException{
		Map map = new HashMap<>();
		List<Status> statuses = twitter.getHomeTimeline();
		 for (Status status : statuses) {
			 if(status.getId()==Long.parseLong(tweetId)){
				 map.put("Retweet", status.getRetweetCount());
				 map.put("Favorit", status.getFavoriteCount());
				 LOGGER.debug("retweet : "+status.getRetweetCount()+" ,favorite : "+status.getFavoriteCount()+"인데 몇개나 "+status.getUser().getName()+", text : "+status.getText());
			 }else{
				 break;
			 }
		 }

		return map;
	}
	public boolean insertTweet(){
		return false;
	}
}
