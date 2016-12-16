package strava.route.controller;


import java.io.File;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;
import org.codehaus.plexus.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import strava.common.commandmap.CommandMap;
import strava.route.service.RouteService;

@Controller
public class RouteController {
	
	@Autowired
	ServletContext context;
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "routeService")
	private RouteService routeService;

	@RequestMapping(value = "/route/map/openMap.do")		
	public ModelAndView openMap(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("/route/basicmap");
        return mav;
    }
		
	@RequestMapping(value = "/route/openAllRouteList.do")		
	public ModelAndView openAllRouteList(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("/route/allRouteList");
        List <Map<String,Object>> list = routeService.selectAllRouteList(commandMap.getMap()) ;
        mav.addObject("list",list);
        return mav;
    }
	
	@RequestMapping(value = "/route/openMyRouteList.do")		
	public ModelAndView openMyRouteList(CommandMap commandMap, HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("/route/myRouteList");
        Object member_idx = session.getAttribute("MEMBER_IDX");
        commandMap.put("MEMBER_IDX", member_idx);
        List <Map<String, Object>> list = routeService.selectMyRouteList(commandMap.getMap());
        mav.addObject("list",list);
        return mav;
    }
		
	@RequestMapping(value = "/route/openRouteUpload.do")		
	public ModelAndView routeRouteForm(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("/route/uploadRoute");
        return mav;
    }
		
	@RequestMapping(value = "/route/uploadRoute.do")		
	public ModelAndView routeUpload(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("redirect:/route/openMyRouteList.do");
        Object member_idx =session.getAttribute("MEMBER_IDX");
        commandMap.put("MEMBER_IDX", member_idx);
        routeService.uploadRoute(commandMap.getMap(), request);
        return mav;
    }
	
	@RequestMapping(value = "/route/openUpdateMyRoute.do")		
	public ModelAndView openUpdateMyRoute(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("/route/updateMyRoute");
        System.out.println(commandMap.getMap());
        mav.addObject("map",commandMap.getMap());
        
        return mav;
    }
	
	@RequestMapping(value = "/route/updateMyRoute.do")		
	public ModelAndView updateMyRoute(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("redirect:/route/openMyRouteList.do");
        System.out.println(commandMap.getMap().get("RIDE_IDX"));
    
        System.out.println(commandMap.getMap());
        
        Object member_idx =session.getAttribute("MEMBER_IDX");
        commandMap.put("MEMBER_IDX", member_idx);
        routeService.updateMyRoute(commandMap.getMap(), request);
        return mav;
    }
	
	@RequestMapping(value = "/route/deleteMyRoute.do")		
	public ModelAndView deleteMyRoute(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("redirect:/route/openMyRouteList.do");
        routeService.deleteMyRoute(commandMap.getMap());
        return mav;
    }
	
	@RequestMapping(value = "/route/openRouteDetail.do")
	public ModelAndView openRouteDetail(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("/route/routeDetail");
		System.out.println(commandMap.getMap());
		Map<String, Object> map = routeService.openRouteDetail(commandMap.getMap());
		mav.addObject("list", map.get("list"));
		mav.addObject("map", map.get("map"));
		
		int member_idx = (int)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", member_idx);
	
		
		//주행기록의 사진 불러옴
		List <Map<String, Object>> pmapList = routeService.selectMyRidePic(commandMap.getMap());
		mav.addObject("MYRIDEPIC",pmapList);
		
			
		// 1.웹사이트의 photo 폴더의 경로를 알아냄
		String photoPath = context.getRealPath("/photo");
		// 2. 1의 폴더에 대한 정보를 알아내는 File 객체 생성
		File photoDirectory = new File(photoPath);
		
		File originalPicture = null;
		File copyPicture = null;
		
		// 3.해당 폴더가 존재 하지 않으면 (exists()==false)
		if (photoDirectory.exists() == false) {
			// 해당 폴더를 생성
			photoDirectory.mkdir();
		}

		for (int i = 0; i < pmapList.size(); i++) {
			System.out.println("stored:"+pmapList.get(i).get("STORED_FILE_NAME")+":");
			// 4.업로드한 파일의 폴더와 파일명을 저장하는 File객체
			originalPicture = new File("C://dev/uploadfiles/" + pmapList.get(i).get("STORED_FILE_NAME"));
			// 5. 4의 파일을 복사할 폴더(1의 폴더) 파일명을 저장하고 있는 객체
			copyPicture = new File(photoPath + "/" + pmapList.get(i).get("STORED_FILE_NAME"));
			
			// 6. 4의 파일을 5의 폴더로 복사
			FileUtils.copyFile(originalPicture, copyPicture);
		}
		return mav;
	}
			
}
