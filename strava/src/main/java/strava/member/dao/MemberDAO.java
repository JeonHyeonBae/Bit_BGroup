package strava.member.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import strava.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFriendList(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("member.selectFriendList",map);
		
		}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyInfo(Map<String, Object> map) {
	
		return (Map<String, Object>)selectOne("member.selectMyInfo",map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyPic(Map<String, Object> map) {
		
		return (Map<String, Object>)selectOne("selecProfilePic",map);
	}

	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFriendDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("member.selectFriendDetail", map);
	}
	
	
}
