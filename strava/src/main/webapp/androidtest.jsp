<%@page contentType="text/html;charset=euc-kr"%>
<%@page
	import="com.oreilly.servlet.MultipartRequest,
                      com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                      java.util.*,
                      java.io.*,
                      org.springframework.web.multipart.MultipartFile"%>
<%

	//주의사항. 파일저장 정확한 경로아래에 폴더가 만들어져 있어야한다.
	//폼에서 넘길때 enctype="multipart/form-data"

	//정확한경로의 설정및 확인방법은 다음과같으며...
	String realFolder = ""; //파일경로를 알아보기위한 임시변수를 하나 만들고,
	String saveFolder = "rideRecorde"; //파일저장 폴더명을 설정한 뒤에...
	String encType = "utf-8"; //인코딩방식도 함께 설정한 뒤,
	int maxSize = 100 * 1024 * 1024; //파일 최대용량까지 지정해주자.(현재 100메가)
	ServletContext context = getServletContext();//문법은 걍 갖다쓰는것.
	realFolder = context.getRealPath(saveFolder);//...
	out.println("the realpath is : " + realFolder + "<br>");//이렇게 전체경로를 파악하면 되는것이다.
	//이제 파일의 저장과정을 알아보자.
	try {
		//멀티파트생성과 동시에 파일은 저장이 되고...
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		//이 시점을기해 파일은 이미 저장이 되었다.

		//폼에서 넘어왔던파일 파라메터들을 가져오려면 이렇게.
		Enumeration params = multi.getParameterNames();

		//그리고 가져온 파라메터를 꺼내는 방법...
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();//파라메터이름을 가져온뒤
			String value = multi.getParameter(name);//이름을 이용해  값을가져온다
			out.println(name + " = " + value + "<br>");
		}

		//이번엔 파일과 관련된 파라메터를 가져온다.
		Enumeration files = multi.getFileNames();
		MultipartFile mFile = null;
		//이번엔 파일관련 파라메터를 꺼내본다...
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();//파라메터이름을 가져온뒤
			String filename = multi.getFilesystemName(name);//이름을 이용해 저장된 파일이름을 가져온다.
			String original = multi.getOriginalFileName(name);//이름을이용해 본래 파일이름도 가져온다.
			String type = multi.getContentType(name);//파일타입도 가져올수있다.
			
			File file = multi.getFile(original+name);//파일 용량을 알아보기위해서는 이렇게...
			FileInputStream fis = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream("D:\\dev\\uploadfiles\\"+name);
			
			int data = 0;
			while((data=fis.read())!=-1){
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			
			out.println("파라메터 이름 : " + name + "<br>");
			out.println("실제 파일 이름 : " + original + "<br>");
			out.println("저장된 파일 이름 : " + filename + "<br>");
			out.println("파일 타입 : " + type + "<br>");
			//if (file != null) {
			//	out.println("크기 : " + f.length());
			//	out.println("<br>");
			//}
		}
	
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}
%>