package strava.route.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import strava.common.dao.AbstractDAO;

@Repository("routeDAO")
public class RouteDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllRouteList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("route.selectAllRouteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyRouteList(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("route.selectMyRouteList",map);
	}

	public void uploadRoute(Map<String, Object> map) {
		insert("route.uploadRoute",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String,Object> openRouteDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("route.openRouteDetail", map);
	}

	public void updateMyRoute(Map<String, Object> map) {
		update("route.updateMyRoute", map);
	}
	
	public void deleteMyRoute(Map<String, Object> map){
		delete("route.deleteMyRoute", map);
	}

	public void insertFile(Map<String, Object> map) {
		insert("route.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("route.selectFileList",map);
	}

	public void insertFile2(Map<String, Object> map) {
		insert("route.insertFile2",map);
		
	}



	
}
