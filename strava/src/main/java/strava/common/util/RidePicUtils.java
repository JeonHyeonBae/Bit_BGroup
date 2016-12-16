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

@Component("ridePicUtils")
public class RidePicUtils {
private static final String filePath = "C:\\dev\\uploadfiles\\";
	
	public List<Map<String, Object>> parseInsertRidePicInfo(Map<String, Object>map, HttpServletRequest request )
	throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = 
				(MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		
		Object memIdx = map.get("MEMBER_IDX");
		Object rideIdx = map.get("RIDE_IDX");
		
		File file = new File(filePath);
		if(file.exists()==false){
			file.mkdirs();
		}
		
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()==false){
				originalFileName = multipartFile.getOriginalFilename();
				System.out.println(originalFileName);
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				System.out.println(originalFileExtension);
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				System.out.println(storedFileName);
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("MEMBER_IDX",memIdx);
				listMap.put("RIDE_IDX",rideIdx);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
}
