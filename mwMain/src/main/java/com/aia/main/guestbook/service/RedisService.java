package com.aia.main.guestbook.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import com.aia.main.guestbook.domain.LoginInfo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;


@Service
public class RedisService {

	//private Logger logger = LoggerFactory.getLogger(this.getClass().getName());

	//private String TAG = this.getClass().getName();

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	/**
	 * Redis 에 사용자 정보를 등록한다.
	 * 
	 * @param LoginInfo
	 */

	public void setUserInformation(LoginInfo loginInfo, HttpSession session ) {
		//public void setUserInformation(LoginInfo loginInfo, String jsessionId ) {

		//logger.debug("> setUserInformation", TAG);

		
		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.setValueSerializer(new StringRedisSerializer());
		
		String key = session.getId();
		//String key = jsessionId;

		Map<String, Object> mapMemberInfo = new HashMap<String, Object>();
		mapMemberInfo.put("memIdx", loginInfo.getMemIdx());
		mapMemberInfo.put("memName", loginInfo.getMemName());
		mapMemberInfo.put("memLoc", loginInfo.getMemLoc());
		redisTemplate.opsForHash().putAll(key, mapMemberInfo);

	}

	/**
	 * Redis 에서 사용자 정보를 가져온다.
	 * @param loginInfo
	 * @return
	 */
	public LoginInfo getUserInformation(String sessionId) {

		String key = sessionId;
		LoginInfo result = null;
		
		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.setValueSerializer(new StringRedisSerializer());
		
		String jsonString = (String) redisTemplate.opsForValue().get(key);
		
		if(jsonString != null) {
			Gson gson =  new GsonBuilder().create();
			result = gson.fromJson(jsonString, LoginInfo.class);	
		}
		
		return result;

	}

	
	
}