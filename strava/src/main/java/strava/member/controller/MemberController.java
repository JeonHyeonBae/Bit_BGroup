package strava.member.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.plexus.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import strava.common.commandmap.CommandMap;
import strava.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	ServletContext context;
	Logger log = Logger.getLogger(this.getClass());
	
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
		
//		// 1.웹사이트의 photo 폴더의 경로를 알아냄
//		String photoPath = context.getRealPath("/photo");
//		// 2. 1의 폴더에 대한 정보를 알아내는 File 객체 생성
//		File photoDirectory = new File(photoPath);
//		
//		File originalPicture = null;
//		File copyPicture = null;
//		
//		// 3.해당 폴더가 존재 하지 않으면 (exists()==false)
//		if (photoDirectory.exists() == false) {
//			// 해당 폴더를 생성
//			photoDirectory.mkdir();
//		}
//
//		for (int i = 0; i < list.size(); i++) {
//			// 4.업로드한 파일의 폴더와 파일명을 저장하는 File객체
//			originalPicture = new File("C:/dev/uploadfiles/" + list.get(i).get("STORED_FILE_NAME"));
//			// 5. 4의 파일을 복사할 폴더(1의 폴더) 파일명을 저장하고 있는 객체
//			copyPicture = new File(photoPath + "/" + list.get(i).get("STORED_FILE_NAME"));
//			// 6. 4의 파일을 5의 폴더로 복사
//			FileUtils.copyFile(originalPicture, copyPicture);
//		}

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
	

	@RequestMapping(value = "/member/memberprofile.do")
	public ModelAndView profileMain(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("member/profileMain");
		int member_idx = (int)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", member_idx);
		
		//개인 프로필의 이름, 닉네임, 주소를 불러옴
		Map<String, Object> map = memberService.selectMyInfo(commandMap.getMap());
		mav.addObject("MYINFO",map);
		
		//개인 프로필의 사진 불러옴
		Map<String, Object> pmap = memberService.selectMyPic(commandMap.getMap());
		mav.addObject("MYPIC",pmap);
		
		//1.웹사이트의 photo 폴더의 경로를 알아냄
		String photoPath=context.getRealPath("/photo");
		//2. 1의 폴더에 대한 정보를 알아내는 File 객체 생성
		File photoDirectory=new File(photoPath);
		//3.해당 폴더가 존재 하지 않으면 (exists()==false)
		if(photoDirectory.exists()==false){
			//해당 폴더를 생성
			photoDirectory.mkdir();
		}
		//4.업로드한 파일의 폴더와 파일명을 저장하는 File객체		
		File originalPicture=new File("C:/dev/uploadfiles/"+pmap.get("STORED_FILE_NAME"));
		//5. 4의 파일을 복사할 폴더(1의 폴더) 파일명을 저장하고 있는 객체
		File copyPicture=new File(photoPath+"/"+pmap.get("STORED_FILE_NAME"));
		//6. 4의 파일을 5의 폴더로 복사
		FileUtils.copyFile(originalPicture,copyPicture);
		
//		//내 주행기록 사진 불러오기
		List<Map<String, Object>> rpmap = memberService.selectMyRidePic(commandMap.getMap());
		mav.addObject("MY_RIDE_PIC",rpmap);
		
		//업로드한 주행기록의 사진 파일의 폴더와 파일명을 저장하는 File객체
//		File originalPicture2 = new File("C:/dev/uploadfiles/"+rpmap.get("STORED_FILE_NAME"));
//		
		
		
		
		
		return mav;
	}
	
}
