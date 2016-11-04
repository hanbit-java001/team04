package com.hanbit.team04.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

public class TwitterController {

	private String 	AccessToken = "794120751624269824-TJMGfk4Ji5p9GQ5xLIilwA5tlWW5S61";
	private String AccessTokenSecret ="Jdi9ToNHTfcu4s2p8wytK0Bv0Ah00WN1mOBiZpFRVpCPq";
	private String ConsumerKey = "u5X62WknsxBFP255T5gd2gY49";
	private String ConsumerSecret ="s58ZsQ4OKPEZq4fonZDUqnOXYpBpLxdWXSirgyvXYRZfHJnblC";

	public static void main(String ar[]) {
	    try {
	        AccessToken accesstoken = new AccessToken("794120751624269824-TJMGfk4Ji5p9GQ5xLIilwA5tlWW5S61", "Jdi9ToNHTfcu4s2p8wytK0Bv0Ah00WN1mOBiZpFRVpCPq");
	        Twitter twitter = TwitterFactory.getSingleton();
	        twitter.setOAuthConsumer("u5X62WknsxBFP255T5gd2gY49", "s58ZsQ4OKPEZq4fonZDUqnOXYpBpLxdWXSirgyvXYRZfHJnblC");
	        twitter.setOAuthAccessToken(accesstoken);
	        User user = twitter.verifyCredentials();

//	        Status status1 = twitter.updateStatus("ㅇㅅㅇ22");

	        List<Status> list = twitter.getUserTimeline();
	        System.out.println("타임라인 계정:"+user.getScreenName());
	        for(Status status : list) {
	            System.out.println("작성자:"+status.getUser().getScreenName());
	            System.out.println("타임라인내용:"+status.getText());
	            System.out.println("페이보릿:"+status.getFavoriteCount());
	        }

//	        Twitter twitter1 = TwitterFactory.getSingleton();
//	        Query query = new Query("졸려");
//	        QueryResult result = twitter.search(query);
//	        for (Status status : result.getTweets()) {
//	            System.out.println("@" + status.getUser().getScreenName() + ":" + status.getText());
//	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}

