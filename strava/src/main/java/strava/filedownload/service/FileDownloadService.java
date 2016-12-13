package strava.filedownload.service;

import java.util.Map;

public interface FileDownloadService {

	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
}
