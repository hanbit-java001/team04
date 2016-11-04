package com.hanbit.team04.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.vo.IdeaVO;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.api.HelpResources;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

@Controller
public class WelcomeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);

	@RequestMapping("/")
	public String welcome() throws TwitterException, IOException {
		return "mainHome";
	}
	@RequestMapping("/t")
	public String welcomet() throws TwitterException, IOException {
		Twitter twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer("kUJT4hz3RnC5rntcPmHNHzDUu", "Mj8VDLGqhh4KBYtC7lTOqk7xo6G0HNljVqV8FgUUWKu98VkPzF");
		RequestToken requestToken = twitter.getOAuthRequestToken();
		AccessToken accessToken = new AccessToken("794128135511941120-IjDU7mWH7FRtwFTByrKuiVhISd76rAK",
				"ZN9sr5YLMpgks2xndxA8cvLbY742OrHkThPaHBk6KVAHC");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		while (null == accessToken) {
			System.out.println("Open the following URL and grant access to your account:");
			System.out.println(requestToken.getAuthorizationURL());
			System.out.print("Enter the PIN(if aviailable) or just hit enter.[PIN]:");
			String pin = br.readLine();
			try {
				if (pin.length() > 0) {
					accessToken = twitter.getOAuthAccessToken(requestToken, pin);
				} else {
					accessToken = twitter.getOAuthAccessToken();
				}
			} catch (TwitterException te) {
				if (401 == te.getStatusCode()) {
					System.out.println("Unable to get the access token.");
				} else {
					te.printStackTrace();
				}
			}
		}
		twitter.setOAuthAccessToken(accessToken);
		 List<Status> statuses = twitter.getHomeTimeline();
		 System.out.println("Showing home timeline.");
		 for (Status status : statuses) {
		 System.out.println("retweet : "+status.getRetweetCount()+" ,favorite : "+status.getFavoriteCount()+"인데 몇개나 "+status.getUser().getName() + ":" +
		 status.getText());
		 }
		// 향후에 참조용으로 accessToken 을 지속시킨다.

		// Status status = twitter.updateStatus(args[0]);
		storeAccessToken(twitter.verifyCredentials().getId(), accessToken);
		Status status = twitter.updateStatus("뭐한거야");

		System.out.println("Successfully updated the status to [" + status.getText() + "].");
		System.exit(0);

		return "mainHome";
	}

	@RequestMapping("/list")
	public String list() {
		LOGGER.info(">>>>>>>>>> WelcomeController :: name :: start");

		LOGGER.info(">>>>>>>>>> WelcomeController :: name :: end");

		return "list";
	}

	private static void storeAccessToken(long l, AccessToken accessToken) {
		// accessToken.getToken() 을 보존
		// accessToken.getTokenSecret() 을 보존
	}

}
