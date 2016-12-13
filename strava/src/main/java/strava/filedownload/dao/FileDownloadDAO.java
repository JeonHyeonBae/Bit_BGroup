package strava.filedownload.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import strava.common.dao.AbstractDAO;

@Repository("fileDAO")
public class FileDownloadDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		return (Map<String,Object>)selectOne("file.selectFileInfo", map);
	}

}
