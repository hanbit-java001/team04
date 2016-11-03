package com.hanbit.team04.twitter;

import java.util.*;
 
import org.apache.http.client.HttpClient;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
 
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
 
import oauth.signpost.*;
 
import org.apache.log4j.Logger;
import org.apache.commons.lang.*;
 
public class SnsAuthHttp {
private Logger log = Logger.getLogger(SnsAuthHttp.class);
 
// OAuth 인증으로 GET 요청
public String getHttpGet(String http_url,OAuthConsumer consumerHttp) throws Exception {
HttpGet http_get = new HttpGet(http_url);
 
if (consumerHttp != null) {
41.
consumerHttp.sign(http_get);
42.
}
43.
 
44.
HttpClient httpclient = new DefaultHttpClient();
45.
HttpResponse response = httpclient.execute(http_get);
46.
 
47.
HttpEntity entity = response.getEntity();
48.
return EntityUtils.toString(entity); // String return
49.
}
50.
 
51.
// HTTP GET 요청
52.
public String getHttpGet(String http_url) throws Exception {
53.
HttpGet http_get = new HttpGet(http_url);
54.
HttpClient httpclient = new DefaultHttpClient();
55.
HttpResponse response = httpclient.execute(http_get);
56.
 
57.
HttpEntity entity = response.getEntity();
58.
return EntityUtils.toString(entity);
59.
}
60.
 
61.
// HTTP POST 요청
62.
public String getHttpPost(String http_url,UrlEncodedFormEntity formentity,OAuthConsumer consumerHttp) throws Exception {
63.
HttpPost http_post = new HttpPost(http_url);
64.
http_post.setEntity(formentity);
65.
 
66.
if (consumerHttp != null) {
67.
consumerHttp.sign(http_post);
68.
}
69.
 
70.
HttpClient httpclient = new DefaultHttpClient();
71.
HttpResponse response = httpclient.execute(http_post);
72.
 
73.
HttpEntity entity = response.getEntity();
74.
 
75.
return EntityUtils.toString(entity);
76.
}
77.
 
78.
}