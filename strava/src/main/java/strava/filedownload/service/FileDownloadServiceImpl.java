package strava.filedownload.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import strava.filedownload.dao.FileDownloadDAO;

@Service("fileService")
public class FileDownloadServiceImpl implements FileDownloadService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "fileDAO")
	private FileDownloadDAO fileDAO;

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return fileDAO.selectFileInfo(map);
	}
	
	
}
