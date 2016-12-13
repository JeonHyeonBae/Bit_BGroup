<%@page contentType="text/html;charset=euc-kr"%>
<%@page
	import="com.oreilly.servlet.MultipartRequest,
                      com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                      java.util.*,
                      java.io.*,
                      org.springframework.web.multipart.MultipartFile"%>
<%

	//���ǻ���. �������� ��Ȯ�� ��ξƷ��� ������ ������� �־���Ѵ�.
	//������ �ѱ涧 enctype="multipart/form-data"

	//��Ȯ�Ѱ���� ������ Ȯ�ι���� ������������...
	String realFolder = ""; //���ϰ�θ� �˾ƺ������� �ӽú����� �ϳ� �����,
	String saveFolder = "rideRecorde"; //�������� �������� ������ �ڿ�...
	String encType = "utf-8"; //���ڵ���ĵ� �Բ� ������ ��,
	int maxSize = 100 * 1024 * 1024; //���� �ִ�뷮���� ����������.(���� 100�ް�)
	ServletContext context = getServletContext();//������ �� ���پ��°�.
	realFolder = context.getRealPath(saveFolder);//...
	out.println("the realpath is : " + realFolder + "<br>");//�̷��� ��ü��θ� �ľ��ϸ� �Ǵ°��̴�.
	//���� ������ ��������� �˾ƺ���.
	try {
		//��Ƽ��Ʈ������ ���ÿ� ������ ������ �ǰ�...
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		//�� ���������� ������ �̹� ������ �Ǿ���.

		//������ �Ѿ�Դ����� �Ķ���͵��� ���������� �̷���.
		Enumeration params = multi.getParameterNames();

		//�׸��� ������ �Ķ���͸� ������ ���...
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();//�Ķ�����̸��� �����µ�
			String value = multi.getParameter(name);//�̸��� �̿���  ���������´�
			out.println(name + " = " + value + "<br>");
		}

		//�̹��� ���ϰ� ���õ� �Ķ���͸� �����´�.
		Enumeration files = multi.getFileNames();
		MultipartFile mFile = null;
		//�̹��� ���ϰ��� �Ķ���͸� ��������...
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();//�Ķ�����̸��� �����µ�
			String filename = multi.getFilesystemName(name);//�̸��� �̿��� ����� �����̸��� �����´�.
			String original = multi.getOriginalFileName(name);//�̸����̿��� ���� �����̸��� �����´�.
			String type = multi.getContentType(name);//����Ÿ�Ե� �����ü��ִ�.
			
			File file = multi.getFile(original+name);//���� �뷮�� �˾ƺ������ؼ��� �̷���...
			FileInputStream fis = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream("D:\\dev\\uploadfiles\\"+name);
			
			int data = 0;
			while((data=fis.read())!=-1){
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			
			out.println("�Ķ���� �̸� : " + name + "<br>");
			out.println("���� ���� �̸� : " + original + "<br>");
			out.println("����� ���� �̸� : " + filename + "<br>");
			out.println("���� Ÿ�� : " + type + "<br>");
			//if (file != null) {
			//	out.println("ũ�� : " + f.length());
			//	out.println("<br>");
			//}
		}
	
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}
%>