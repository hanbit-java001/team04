//package com.hanbit.team04.twitter;
//
//import java.util.*;
//
//import org.apache.http.client.HttpClient;
//import org.apache.http.HttpEntity;
//import org.apache.http.util.EntityUtils;
//import org.apache.http.NameValuePair;
//import org.apache.http.message.BasicNameValuePair;
//import org.apache.http.client.entity.UrlEncodedFormEntity;
//
//import org.apache.http.HttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.client.methods.HttpGet;
//import org.apache.http.client.methods.HttpDelete;
//import org.apache.http.impl.client.BasicResponseHandler;
//import org.apache.http.impl.client.DefaultHttpClient;
//
//import oauth.signpost.*;
//
//import org.apache.log4j.Logger;
//import org.apache.commons.lang.*;
//
//public class SnsAuthHttp {
//	private Logger log = Logger.getLogger(SnsAuthHttp.class);
//
//	// OAuth 인증으로 GET 요청
//	public String getHttpGet(String http_url, OAuthConsumer consumerHttp) throws Exception {
//		HttpGet http_get = new HttpGet(http_url);
//
//		if (consumerHttp != null) {
//			consumerHttp.sign(http_get);
//		}
//
//		HttpClient httpclient = new DefaultHttpClient();
//		HttpResponse response = httpclient.execute(http_get);
//
//		HttpEntity entity = response.getEntity();
//		return EntityUtils.toString(entity); // String return
//	}
//
//	// HTTP GET 요청
//	public String getHttpGet(String http_url) throws Exception {
//		HttpGet http_get = new HttpGet(http_url);
//		HttpClient httpclient = new DefaultHttpClient();
//		HttpResponse response = httpclient.execute(http_get);
//
//		HttpEntity entity = response.getEntity();
//		return EntityUtils.toString(entity);
//	}
//
//	// HTTP POST 요청
//	HttpPost http_post = new HttpPost(http_url);http_post.setEntity(formentity);
//
//	if(consumerHttp!=null)
//	{
//		consumerHttp.sign(http_post);
//	}
//
//	HttpClient httpclient = new DefaultHttpClient();
//	HttpResponse response = httpclient.execute(http_post);
//
//HttpEntity entity = response.getEntity();
//
//	return EntityUtils.toString(entity);
//}
//
//}