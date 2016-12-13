package strava.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import strava.common.commandmap.CommandMap;
import strava.member.service.MemberService;

@Controller
public class MemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	ServletContext context;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	/* 작성자 : 전현배 
	 * 내  용  : 친구 목록을 가져온 뒤 친구 목록 뷰 페이지로 이동  */
	@RequestMapping(value = "/member/friendListView.do")
	public ModelAndView friendListView(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("/member/friendListView");
		
		int member_idx = (int)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", member_idx);
		
		List <Map<String, Object>> list = memberService.selectFriendList(commandMap.getMap());

		mav.addObject("FRIEND_LIST", list);
		return mav;
	}

	/* 작성자 : 전현배 
	 * 내  용  : 친구 목록에서 친구의 닉네임을 선택했을 때,
	 *        친구의 정보를 가져오고, 뷰 페이지로 이동  */
	@RequestMapping(value = "/member/friendDetail.do")
	public ModelAndView friendView(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/member/friendDetail");
		Map<String, Object> map = memberService.selectFriendDetail(commandMap.getMap());
		mav.addObject("FRIEND_DETAIL", map);
		return mav;
	}

	/* 작성자 : 전현배 
	 * 내  용  : 검색, 친구 추가 기능  */
	@RequestMapping(value = "/member/addFriend.do")
	public ModelAndView addFriend() {
		ModelAndView mav = new ModelAndView("/member/addFriend");
		return mav;
	}
	
}
