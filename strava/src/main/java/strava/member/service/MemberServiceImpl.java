package strava.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import strava.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public List<Map<String, Object>> selectFriendList(Map<String, Object> map) throws Exception {
		return memberDAO.selectFriendList(map);
	}

	@Override
	public Map<String, Object> selectFriendDetail(Map<String, Object> map) throws Exception {
		return memberDAO.selectFriendDetail(map);
	}

}
