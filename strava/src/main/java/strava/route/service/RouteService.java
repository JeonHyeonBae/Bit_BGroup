package strava.route.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RouteService {

	List<Map<String, Object>> selectAllRouteList(Map<String, Object> commandMap) throws Exception;

	List<Map<String, Object>> selectMyRouteList(Map<String, Object> map) throws Exception;

	void uploadRoute(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> openRouteDetail(Map<String, Object> map) throws Exception;

	void updateMyRoute(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteMyRoute(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMyRidePic(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMyRidePicOther(Map<String, Object> map);


	

}
