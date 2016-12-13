package strava.member.service;

import java.util.List;
import java.util.Map;

public interface MemberService {

	List<Map<String, Object>> selectFriendList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMyInfo(Map<String, Object> map);

	Map<String, Object> selectMyPic(Map<String, Object> map);

	List<Map<String, Object>> selectMyRidePic(Map<String, Object> map);

	Map<String, Object> selectFriendDetail(Map<String, Object> map) throws Exception;

}
