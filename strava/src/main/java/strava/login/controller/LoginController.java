package strava.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import strava.common.commandmap.CommandMap;
import strava.login.service.*;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@RequestMapping(value = "/login/loginMain.do")
	public ModelAndView openLoginMain() {
		ModelAndView mav = new ModelAndView("/login/loginMain");
		return mav;
	}
	
	@RequestMapping(value = "/login/login.do")
	@ResponseBody
	public int login(CommandMap commandMap, HttpSession session) throws Exception {
		
		int loginIdentify = 0;
		
		loginIdentify = loginService.loginIdentify(commandMap.getMap());
		if (loginIdentify != 0){
			session.setAttribute("MEMBER_IDX", loginIdentify);
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping(value = "/login/loginSuccess.do")
	public ModelAndView loginSuccess() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/mainPage");
		return mav;
	}
	
	@RequestMapping(value = "/logout/logout.do")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView("/login/loginMain");
		
		String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
		
		log.info("logout 현재시간 : "+curTime);
		
		session.invalidate(); //session 종료(안에있는 데이터 전부 삭제)
		
		return mav;
	}

	@RequestMapping(value = "/login/memberJoin.do")
	public ModelAndView memberJoin() {
		ModelAndView mav = new ModelAndView("/login/memberJoin");
		return mav;
	}
	
	@RequestMapping(value = "/login/memberJoinForm.do")
	public ModelAndView memberJoinForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/login/loginMain");
		loginService.insertMember(commandMap.getMap(), request);
		return mav;
	}
	
	@RequestMapping(value = "/login/overlapCheck.do")
	@ResponseBody
	public int overlapCheck(CommandMap commandMap) throws Exception {
		String result = null;
		result = loginService.overlapCheck(commandMap.getMap());
		
		if(result == null) {
			return 0;
		} else {
			return 1;
		}
	}

}
