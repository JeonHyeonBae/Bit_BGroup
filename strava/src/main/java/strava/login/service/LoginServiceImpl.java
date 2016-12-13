package strava.login.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import strava.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public int loginIdentify(Map<String, Object> map) throws Exception {
		return loginDAO.loginIdentify(map);
	}

	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		loginDAO.insertMember(map);
	}

	@Override
	public String overlapCheck(Map<String, Object> map) throws Exception {
		return loginDAO.overlapCheck(map);
	}
	
}
