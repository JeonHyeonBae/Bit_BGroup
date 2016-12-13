package strava.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface LoginService {

	int loginIdentify (Map<String, Object> map) throws Exception;
	
	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;

	String overlapCheck(Map<String, Object> map) throws Exception;

}
