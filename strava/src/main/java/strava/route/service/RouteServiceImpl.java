package strava.route.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import strava.common.util.FileUtils;
import strava.route.dao.RouteDAO;

@Service("routeService")
public class RouteServiceImpl implements RouteService{

	@Resource(name="routeDAO")
	private RouteDAO routeDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectAllRouteList(Map<String, Object> commandMap) throws Exception{
		return routeDAO.selectAllRouteList(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectMyRouteList(Map<String, Object> map) throws Exception {
		return routeDAO.selectMyRouteList(map);
	}

	@Override
	public void uploadRoute(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i = 0; i<list.size(); i++ ){
			routeDAO.uploadRoute(map);
			routeDAO.insertFile(list.get(i));
		}
		
	}

	@Override
	public Map<String, Object> openRouteDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = routeDAO.openRouteDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> list = routeDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}


	@Override
	public void updateMyRoute(Map<String, Object> map) throws Exception {
		routeDAO.updateMyRoute(map);
		
	}

	@Override
	public void deleteMyRoute(Map<String, Object> map) throws Exception {
		routeDAO.deleteMyRoute(map);
	}


	
	

}
