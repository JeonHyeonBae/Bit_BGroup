package strava.login.dao;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import strava.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	public String overlapCheck(Map<String, Object> map) {
		Set<String> key = map.keySet();
		Iterator<String> iter = key.iterator();
		String keyName = (String) iter.next();
		
		if(keyName.equals("MEMBER_ID")) {
			return (String)selectOne("login.idOverlapCheck", map);
		} else {
			return (String)selectOne("login.nickOverlapCheck", map);
		}
	}

	public void insertMember(Map<String, Object> map) {
		insert("login.insertMember", map);
	}
	
	public void insertPicFile(Map<String, Object> map) throws Exception{
		insert("login.insertPicFile",map);
	}
	public int loginIdentify(Map<String, Object> map) {
		return (int)selectOne("login.loginIdentify", map);
	}

}
