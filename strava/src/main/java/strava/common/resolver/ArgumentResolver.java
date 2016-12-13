package strava.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import strava.common.commandmap.CommandMap;

public class ArgumentResolver implements HandlerMethodArgumentResolver{

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer container, NativeWebRequest webRequest,
			WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();
		
		HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
		Enumeration<?> paraNames = request.getParameterNames();
		
		String key = null;
		String[] values = null;
		while(paraNames.hasMoreElements()){
			key = (String)paraNames.nextElement();
			values = request.getParameterValues(key);
			if(values != null){
				if(values.length>1){
					commandMap.put(key, values);
				}else{
					commandMap.put(key, values[0]);
				}
				//commandMap.put(key, (values.length > 1) ? values:values[0] );
			}
		}
		return commandMap;
		
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// TODO Auto-generated method stub
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

}
