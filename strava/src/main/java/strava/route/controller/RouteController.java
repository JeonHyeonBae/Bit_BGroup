package strava.route.controller;


import java.util.List;
import java.util.Map;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import strava.common.commandmap.CommandMap;
import strava.route.service.RouteService;

@Controller
public class RouteController {
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
	public ModelAndView openMyRouteList(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("/route/myRouteList");
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
	public ModelAndView routeUpload(CommandMap commandMap, HttpServletRequest request) throws Exception{
        ModelAndView mav = new ModelAndView("redirect:/route/openMyRouteList.do");
        routeService.uploadRoute(commandMap.getMap(), request);
        return mav;
    }
	
	@RequestMapping(value = "/route/openUpdateMyRoute.do")		
	public ModelAndView openUpdateMyRoute(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("/route/updateMyRoute");
        mav.addObject("map",commandMap.getMap());
        return mav;
    }
	
	@RequestMapping(value = "/route/updateMyRoute.do")		
	public ModelAndView updateMyRoute(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("redirect:/route/openMyRouteList.do");
        System.out.println(commandMap.getMap().get("RIDE_IDX"));
        routeService.updateMyRoute(commandMap.getMap());
        return mav;
    }
	
	@RequestMapping(value = "/route/deleteMyRoute.do")		
	public ModelAndView deleteMyRoute(CommandMap commandMap) throws Exception{
        ModelAndView mav = new ModelAndView("redirect:/route/openMyRouteList.do");
        routeService.deleteMyRoute(commandMap.getMap());
        return mav;
    }
	
	@RequestMapping(value = "/route/openRouteDetail.do")
	public ModelAndView openRouteDetail(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("/route/routeDetail");
		Map<String, Object> map = routeService.openRouteDetail(commandMap.getMap());
		mav.addObject("list", map.get("list"));
		mav.addObject("map", map.get("map"));
		return mav;
	}
		
}
