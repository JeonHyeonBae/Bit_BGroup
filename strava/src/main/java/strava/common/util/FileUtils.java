package strava.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "D:\\dev\\uploadfiles\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = mRequest.getFileNames();
		
		MultipartFile mFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		String ride_idx = (String)map.get("RIDE_IDX");
		
		File file = new File(filePath);
		if(file.exists()==false){
			file.mkdirs();
		}
		
		while(iterator.hasNext()){
			mFile = mRequest.getFile(iterator.next());
			if(mFile.isEmpty()==false){
				originalFileName = mFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				file = new File (filePath + storedFileName);
				mFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("RIDE_IDX", ride_idx);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", mFile.getSize());
				list.add(listMap);
				
			}
		}
		
		return list;
		
	}
	
}
