<%@ page language="java" contentType="text/html; charset=gb2312" import="java.io.*"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
<a href="/viewspace/filetree/t.jsp?filepath=login.jsp" rel="/apache-tomcat-7.0.27/wtpwebapps/viewspace/login.jsp">login.jsp</a>

��ǰWEBӦ�õ�����·����<%=application.getRealPath("/")%><BR> 
��ǰ�������JSP�ļ�������·����<%=application.getRealPath(request.getRequestURI())%><BR> 
application.getContextPath:<%=application.getContextPath() %><BR> 
request.getServletPath:<%=request.getServletPath() %><BR> 
request.getContextPath:<%=request.getContextPath() %><BR> 
request.getRequestURL():<%=request.getRequestURL() %><BR> 
request.getRequestURI():<%=request.getRequestURI() %><BR> 
request.getServletContext.getRealPath(/):<%=request.getServletContext().getRealPath("/") %><BR> 
request.getServletContext.getRealPath(request.getRequestURI());<%=request.getServletContext().getRealPath(request.getRequestURI()) %><BR> 


request.getLocalAddr:<%=request.getLocalAddr() %><BR> 
request.getRemoteAddr:<%=request.getRemoteAddr() %><BR> 

<BR>
<BR>
<BR>
<% 
String path=application.getRealPath(request.getRequestURI()); 
String dir=new File(path).getParent(); 
out.println("��ǰJSP�ļ�����Ŀ¼������·��"+dir+"</br>"); 
String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1); 
out.println("web URL ·��:"+realPath1+"</br>");

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
out.println("basePath"+basePath+"</br>");
%>
 
</body>
</html>