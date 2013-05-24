<%@ page language="java" contentType="text/html; charsetUTF-8" import="java.net.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
     String filepath = request.getParameter("filepath");
 	response.setContentType("application/x-download");//设置为下载application/x-download
      String filedownload = filepath;//"/index.html";//即将下载的文件的相对路径
      System.out.println(filepath);
      String filedisplay = filepath.substring(filepath.lastIndexOf("/")+1);//下载文件时显示的文件保存名称
      filedisplay = URLEncoder.encode(filedisplay,"UTF-8");
      System.out.println(filedisplay);
      response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);
    
      try
      {
          RequestDispatcher dis = request.getRequestDispatcher(filedownload);
          if(dis!= null)
          {
              dis.forward(request,response);
          }
          response.flushBuffer();
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      finally
      {
    
      } 

%>