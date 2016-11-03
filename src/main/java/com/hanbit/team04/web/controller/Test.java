package com.hanbit.team04.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

public class Test {


//	 public static void main(String args[]) throws Exception{
//		    // 이 팩토리인스턴스는 재이용가능하고 thread safe합니다.
//		    Twitter twitter = TwitterFactory.getSingleton();
//		    twitter.setOAuthConsumer("u5X62WknsxBFP255T5gd2gY49", "s58ZsQ4OKPEZq4fonZDUqnOXYpBpLxdWXSirgyvXYRZfHJnblC");
//		    RequestToken requestToken = twitter.getOAuthRequestToken();
//		    AccessToken accessToken = null;
//		    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//		    while (null == accessToken) {
//		      System.out.println("Open the following URL and grant access to your account:");
//		      System.out.println(requestToken.getAuthorizationURL());
//		      System.out.print("Enter the PIN(if aviailable) or just hit enter.[PIN]:");
//		      String pin = br.readLine();
//		      try{
//		         if(pin.length() > 0){
//		           accessToken = twitter.getOAuthAccessToken(requestToken, pin);
//		         }else{
//		           accessToken = twitter.getOAuthAccessToken();
//		         }
//		      } catch (TwitterException te) {
//		        if(401 == te.getStatusCode()){
//		          System.out.println("Unable to get the access token.");
//		        }else{
//		          te.printStackTrace();
//		        }
//		      }
//		    }
//		    //향후에 참조용으로 accessToken 을 지속시킨다.
//		    storeAccessToken(twitter.verifyCredentials().getId() , accessToken);
//		    Status status = twitter.updateStatus(args[0]);
//		    System.out.println("Successfully updated the status to [" + status.getText() + "].");
//		    System.exit(0);
//		  }
//		  private static void storeAccessToken(long l, AccessToken accessToken){
//		    //accessToken.getToken() 을 보존
//		    //accessToken.getTokenSecret() 을 보존
//		  }

	public static void main(String args[]) throws Exception{
	    // 이 팩토리인스턴스는 재이용가능하고 thread safe합니다.
	    TwitterFactory factory = new TwitterFactory();
	    AccessToken accessToken = loadAccessToken(Integer.parseInt("9NqGUQAAAAAAxydUAAABWCpK_Ok"));
	    Twitter twitter = factory.getInstance();
	    twitter.setOAuthConsumer("u5X62WknsxBFP255T5gd2gY49", "s58ZsQ4OKPEZq4fonZDUqnOXYpBpLxdWXSirgyvXYRZfHJnblC");
	    twitter.setOAuthAccessToken(accessToken);
	    Status status = twitter.updateStatus(args[1]);
	    System.out.println("Successfully updated the status to [" + status.getText() + "].");
	    System.exit(0);
	  }
	  private static AccessToken loadAccessToken(int useId){
	    String token =null; // load from a persistent store
	    String tokenSecret = null;// load from a persistent store
	    return new AccessToken(token, tokenSecret);
	  }
}
