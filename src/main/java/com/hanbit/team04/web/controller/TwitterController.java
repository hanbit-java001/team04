package com.hanbit.team04.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

public class TwitterController {

	public static void main(String ar[]) {
	    try {
	        AccessToken accesstoken = new AccessToken("TJMGfk4Ji5p9GQ5xLIilwA5tlWW5S61", "Jdi9ToNHTfcu4s2p8wytK0Bv0Ah00WN1mOBiZpFRVpCPq");
	        Twitter twitter = TwitterFactory.getSingleton();
	        twitter.setOAuthConsumer("Consumer Key (u5X62WknsxBFP255T5gd2gY49)", "Consumer Secret (s58ZsQ4OKPEZq4fonZDUqnOXYpBpLxdWXSirgyvXYRZfHJnblC)");
	        twitter.setOAuthAccessToken(accesstoken);
	        User user = twitter.verifyCredentials();

	        List<Status> list = twitter.getUserTimeline();
	        System.out.println("타임라인 계정:"+user.getScreenName());
	        for(Status status : list) {
	            System.out.println("작성자:"+status.getUser().getScreenName());
	            System.out.println("타임라인내용:"+status.getText());
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}

