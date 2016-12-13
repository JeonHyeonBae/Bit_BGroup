package strava.login.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import strava.common.util.PicUtils;
import strava.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Resource(name="picUtils")
	private PicUtils picUtils;
	
	@Override
	public int loginIdentify(Map<String, Object> map) throws Exception {
		return loginDAO.loginIdentify(map);
	}

	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		loginDAO.insertMember(map);
		
		List<Map<String,Object>> list = picUtils.parseInsertFileInfo(map, request);
		for(int i = 0, size = list.size(); i<size; i++){
			loginDAO.insertPicFile(list.get(i));
		}
		
	}

	@Override
	public String overlapCheck(Map<String, Object> map) throws Exception {
		return loginDAO.overlapCheck(map);
	}
	
}
