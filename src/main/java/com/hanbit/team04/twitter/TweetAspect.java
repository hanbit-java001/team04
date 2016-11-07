package com.hanbit.team04.twitter;

import javax.annotation.PostConstruct;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.hanbit.team04.core.service.TweetService;

import twitter4j.TwitterException;

@Component
@Aspect
public class TweetAspect extends Thread {
	private static final Logger LOGGER = LoggerFactory.getLogger(TweetAspect.class);
	@Autowired
	private TweetService tweetservice;
	
	private TweetAspect tweetAspect;
	@Autowired
	private ApplicationContext applicationContext;

//	@PostConstruct
//	public void TweetAspect() {
//		LOGGER.info("check init tweet aop constructor");
//		tweetAspect = this;
////		applicationContext.getBean(TweetAspect.class)
//	}

	@After("@annotation(com.hanbit.team04.twitter.UpdateTweet)")
	public void UpdateTweet() throws Throwable {

		int result;
		LOGGER.debug("start thread ----");
		tweetservice=applicationContext.getBean(TweetService.class);
		result = tweetservice.updateRetweetAndFavorit();
		LOGGER.debug("Aop - tweet update result : " + result);

	}
//	@Around("@annotation(com.hanbit.team04.twitter.UpdateTweet)")
//	public Object UpdateTweet(ProceedingJoinPoint pjp) throws Throwable {
//		tweetAspect=new TweetAspect();
//		LOGGER.debug("여기 들어오나???" + tweetAspect);
//		tweetAspect.start();
//		if(!tweetAspect.isAlive()){
//			tweetAspect.start();
//		}
//		
//		return pjp.proceed();
//		
//	}

	@Override
	public void run() {
		int result;
		try {
			LOGGER.debug("start thread ----");
			tweetservice=applicationContext.getBean(TweetService.class);
			result = tweetservice.updateRetweetAndFavorit();
			LOGGER.debug("Aop - tweet update result : " + result);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Thread thread = new Thread(){
		// private void Runnable() throws TwitterException {
		// int result =tweetservice.updateRetweetAndFavorit();
		// LOGGER.debug("Aop - tweet update result : "+result);
		// }
		// };
		// thread.start();
	}
}
