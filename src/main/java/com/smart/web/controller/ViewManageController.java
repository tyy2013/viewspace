package com.smart.web.controller;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import com.smart.util.*;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.smart.cons.CommonConstant;
import com.smart.domain.CommentLog;
import com.smart.domain.User;
import com.smart.domain.UserFile;
import com.smart.domain.ViewPoint;
import com.smart.domain.ViewSpace;
import com.smart.domain.json.ViewPointJson;
import com.smart.domain.json.ViewSpaceJson;
import com.smart.service.ViewSpaceService;
import com.smart.service.exception.IpCommentedException;

/**
 *<pre>
 *   景区管理控制器，这部分功能由景区管理操作，包括：景区、景点增删改查控制转发处理
 * </pre>
 */
@Controller
public class ViewManageController extends BaseController{
	@Autowired
	private ViewSpaceService viewSpaceService;
	private static final String UPLOADDIR = "uploads/";
	protected static final Logger log = Logger.getLogger(ViewManageController.class);

	// 显示所有景区的列表
	@RequestMapping(value = "/index", method = RequestMethod.GET)  
	public String listViewSpaces(HttpServletRequest request) {
		List<ViewSpace> viewSpaces = viewSpaceService.getAllViewSpaces();
		request.getSession().setAttribute("viewSpaces", viewSpaces);
		return "/listViewSpaces";
	}

	// 显示用户管理的所有景区的列表
	@RequestMapping(value = "/admin", method = RequestMethod.GET)  
	public String listUserViewSpaces(HttpServletRequest request) {
		int userId = super.getSessionUser(request).getUserId();
		List<ViewSpace> viewSpaces = viewSpaceService
				.queryViewSpaceByUserId(userId);
		request.getSession().setAttribute("viewSpaces", viewSpaces);
		return "/listUserViewSpaces";
	}
	
	// 获取用户管理的所有景区的列表
	@RequestMapping(value = "/getViewSpaceList", method = RequestMethod.POST)
	@ResponseBody
	public Object getViewSpaceList(HttpServletRequest request) {
		log.info("/getViewSpaceList");
		int userId = super.getSessionUser(request).getUserId();
		List<ViewSpace> viewSpaces = viewSpaceService
				.queryViewSpaceByUserId(userId);
		request.getSession().setAttribute("viewSpaces", viewSpaces);

		List<ViewSpaceJson> jsonList = new ArrayList<ViewSpaceJson>();
		for(ViewSpace vs :viewSpaces){
			ViewSpaceJson vsj = new ViewSpaceJson();
			try {
				BeanUtils.copyProperties(vsj, vs);
				jsonList.add(vsj);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		JSONObject result = new JSONObject();
//		result.put("total", jsonList.size());
//		result.put("rows", JSONHelper.collection2json(jsonList));
		return jsonList;
	}
	
	

	// 根据名称模糊查询景区
	@RequestMapping(value = "/search",method=RequestMethod.PUT)
	public String queryViewSpaces(HttpServletRequest request) {
		String spaceName = request.getParameter("spaceName");
		List<ViewSpace> viewSpaces = viewSpaceService
				.queryViewSpaceByName(spaceName);
		request.setAttribute("viewSpaces", viewSpaces);
		return "/listViewSpaces";
	}

	// 显示景区的详细信息
	@RequestMapping(value = "/vs/{id}", method = RequestMethod.GET)
	public String showViewSpace(@PathVariable Integer id,HttpServletRequest request) {
		ViewSpace viewSpace = viewSpaceService.getFullViewSpace(id);
		request.setAttribute("viewSpace", viewSpace);
		return "/showViewSpace";
	}

	// 打开新添景区页面
	@RequestMapping(value = "/vs/add", method = RequestMethod.GET)
	public String addViewSpacePage() {
		return "/addViewSpace";
	}

	//新添景区
	@RequestMapping(value = "/vs/save", method=RequestMethod.PUT)  
	public String addViewSpace(HttpServletRequest request,ViewSpace viewSpace) {
		viewSpace.setUser(getSessionUser(request));
		viewSpaceService.addViewSpace(viewSpace);
		String targetUrl = "/admin.do";
		return "redirect:"+targetUrl;
	}

	// 打开更改景区页面
	@RequestMapping(value="/vs/{id}/edit")  
	public String updateViewSpacePage(@PathVariable Integer id, HttpServletRequest request) {
		ViewSpace viewSpace = viewSpaceService.getFullViewSpace(id);
		request.setAttribute("viewSpace", viewSpace);
		return "/updateViewSpace";
	}
	
	// 获取景区的所有景点的列表
	@RequestMapping(value = "/vs/{id}/getViewPointList", method = RequestMethod.POST)
	@ResponseBody
	public Object getViewPointList(@PathVariable Integer id, HttpServletRequest request) {
		log.info("/getViewPointList");
		ViewSpace vs = viewSpaceService.getFullViewSpace(id);
		if(vs==null || vs.getViewPoints()==null)
			return null;
		List<ViewPointJson> jsonList = new ArrayList<ViewPointJson>();
		for (ViewPoint vp : vs.getViewPoints()) {
			ViewPointJson vpj = new ViewPointJson();
			try {
				BeanUtils.copyProperties(vpj, vp);
				jsonList.add(vpj);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return jsonList;
	}

	// 更改景区
	@RequestMapping(value="/vs/{id}/update",method=RequestMethod.PUT)  
	public String updateViewSpace(@PathVariable Integer id,HttpServletRequest request, ViewSpace vs) {
		vs.setUser(getSessionUser(request));
		vs.setSpaceId(id);
		viewSpaceService.updateViewSpace(vs);
		String targetUrl = "/admin.do";
        return "redirect:"+targetUrl;
	}

	// 删除景区
	@RequestMapping(value="/vs/{id}/delete",method=RequestMethod.GET)  
	public String deleteViewSpace(@PathVariable Integer id) {
		viewSpaceService.deleteViewSpace(id);
		String targetUrl = "/admin.do";
        return "redirect:"+targetUrl;
	}

	// 对景区的评论
	@RequestMapping(value="/vs/comment/{id}/{commentType}",method=RequestMethod.GET)  
	public String commentViewSpace(@PathVariable Integer id,@PathVariable Integer commentType,HttpServletRequest request) {
		if(id == null){
		   return "/fail";	
		}
		CommentLog cl = new CommentLog();
		cl.setIp(request.getRemoteAddr());
		cl.setCommentType(commentType);
		ViewSpace vs = new ViewSpace();
		vs.setSpaceId(Integer.valueOf(id));
		cl.setViewSpace(vs);
		try {
			viewSpaceService.addCommentLog(cl);
		} catch (IpCommentedException ice) {
			request.setAttribute(ERROR_MSG_KEY, "您已经评论过该景区了。");
			return "/fail";
		}
        String targetUrl = "/vs/" + id+".do";
        return "redirect:"+targetUrl;
	}
	
	// 显示景点的详细信息
	@RequestMapping(value = "/vp/{id}", method = RequestMethod.GET)
	public String showViewPoint(@PathVariable Integer id,
			HttpServletRequest request) {
		ViewPoint vp = viewSpaceService.getFullViewPoint(id);
		ViewSpace viewSpace = vp.getViewSpace();
		request.setAttribute("viewSpace", viewSpace);
		request.setAttribute("viewPoint", vp);
		
		return "/showViewPoint";
	}

	// 打开添加景区的景点的页面
	@RequestMapping(value = "/vp/{id}/add", method = RequestMethod.GET)
	public String addViewPointPage(@PathVariable Integer id,HttpServletRequest request) {
		ViewSpace vs = new ViewSpace();
		vs.setSpaceId(id);
		request.setAttribute("viewSpace", vs);
		return "/addViewPoint";
	}

	// 添加景区的景点
	@RequestMapping(value = "/vp/save", method = RequestMethod.POST)
	public String addViewPoint(MultipartHttpServletRequest request, @RequestParam("spaceId") int spaceId,
			@RequestParam("pointName") String pointName,
			@RequestParam("ticketPrice") String ticketPrice,
			@RequestParam("description") String description) {
		ViewPoint vp = new ViewPoint();
		vp.getViewSpace().setSpaceId(spaceId);
		vp.setPointName(pointName);
		vp.setTicketPrice(ticketPrice);
		vp.setDescription(description);
		try {
			List<MultipartFile> files = request.getFiles("imgFile");
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).isEmpty()) {
					byte[] bytes = files.get(i).getBytes();
					String srcFileName = files.get(i).getOriginalFilename();
					String fileExt = srcFileName.substring(srcFileName
							.lastIndexOf('.'));
					String fileName = srcFileName;//getNewFileName() + fileExt;
					String fullFilePath = request.getSession()
							.getServletContext().getRealPath(
									"/uploads/" + fileName);
					FileOutputStream fos = new FileOutputStream(fullFilePath); // 写入文件
					fos.write(bytes);
					fos.close();
					vp.setImgFile(fileName);
				}
			}

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		viewSpaceService.addViewPoint(vp);
        String targetUrl = "/vs/" + spaceId  + "/edit.do";
        return "redirect:"+targetUrl;
	}

	// 产生一个由UUID生成的文件名
	private String getNewFileName() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().toUpperCase();
	}

	// 删除景区的景点
	@RequestMapping(value="/vp/{id}/delete",method=RequestMethod.GET)  
	public String deleteViewPoint(@PathVariable Integer id) {
		ViewPoint vp = viewSpaceService.getFullViewPoint(id);
		int spaceId = vp.getViewSpace().getSpaceId();
		viewSpaceService.deleteViewPoint(id);
        String targetUrl = "/vs/" + spaceId  + "/edit.do";
        return "redirect:"+targetUrl;
	}

	//更改景点的页面
	@RequestMapping(value="/vp/{id}/edit",method=RequestMethod.GET) 
	public String updateViewPointPage(@PathVariable Integer id,HttpServletRequest request) {
		ViewPoint vp = viewSpaceService.getFullViewPoint(id);
		request.setAttribute("viewPoint", vp);
		return "/updateViewPoint";
	}
	

	//更改景点
	@RequestMapping(value = "/vp/{id}/update", method = RequestMethod.POST)
	public String updateViewPoint(@PathVariable Integer id,MultipartHttpServletRequest request,
		    @RequestParam("spaceId") int spaceId,
			@RequestParam("pointName") String pointName,
			@RequestParam("ticketPrice") String ticketPrice,
			@RequestParam("description") String description) {
		ViewPoint vp = new ViewPoint();
		vp.setPointId(id);
		vp.getViewSpace().setSpaceId(spaceId);
		vp.setPointName(pointName);
		vp.setTicketPrice(ticketPrice);
		vp.setDescription(description);
		try {
			List<MultipartFile> files = request.getFiles("imgFile");
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).isEmpty()) {
					byte[] bytes = files.get(i).getBytes();
					String srcFileName = files.get(i).getOriginalFilename();
					String fileExt = srcFileName.substring(srcFileName
							.lastIndexOf('.'));
					String fileName = getNewFileName() + fileExt;
					String fullFilePath = request.getSession().getServletContext()
							.getRealPath(CommonConstant.UPLOAD_IMG_DIR + fileName);
					FileOutputStream fos = new FileOutputStream(fullFilePath); // 写入文件
					fos.write(bytes);
					fos.close();
					vp.setImgFile(fileName);
				}
			}

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		viewSpaceService.updateViewPoint(vp);
        String targetUrl = "/vs/" + vp.getViewSpace().getSpaceId()  + "/edit.do";
        return "redirect:"+targetUrl;
	}
	
	// 打开文件管理页面
	@RequestMapping(value = "/showFileManage", method = RequestMethod.GET)
	public String showFileManagePage() {
		return "/shareFile";
	}
		
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest request,
			@RequestParam("description") String description){
		User user = getSessionUser(request);
		if(user==null)
			return "forward:/login.jsp";
//		UserFile uf = new UserFile();
//		uf.setFileName(fileName);
//		uf.setUserId(user.getUserId());
//		uf.setDescription(description);
		
		try {
			List<MultipartFile> files = request.getFiles("file");
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).isEmpty()) {
					String uploadPath = request.getSession().getServletContext()
							.getRealPath(CommonConstant.UPLOAD_DIR);
					File uploadDir = new File(uploadPath+"/"+user.getUserName());
					if(!uploadDir.exists())
						uploadDir.mkdir();
					
					byte[] bytes = files.get(i).getBytes();
					String srcFileName = files.get(i).getOriginalFilename();
//					String fileExt = srcFileName.substring(srcFileName
//							.lastIndexOf('.'));
					String fullFilePath = request.getSession().getServletContext().
							getRealPath(CommonConstant.UPLOAD_DIR +"/"+user.getUserName()+"/"+srcFileName);
					log.info("fullFilePath="+fullFilePath);
					FileOutputStream fos = new FileOutputStream(fullFilePath); // 写入文件
					fos.write(bytes);
					fos.close();
				}
			}

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
//		viewSpaceService.addViewPoint(vp);
//        String targetUrl = "/vs/" + spaceId  + "/edit.do";
        return "/shareFile";
	
	}
	
	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public void downloadFile(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");//只对post中参数编码有效，而get中的参数是在URI中，默认为ISO-8859-1

		String filePath =request.getParameter("filepath");
		filePath = new String(filePath.getBytes("ISO-8859-1"),"utf-8");//将默认URI中的编码转换成需要的编码
		String fileName = filePath.substring(filePath.lastIndexOf("/")+1);
		log.info(filePath);
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

//		String ctxPath = request.getSession().getServletContext()
//				.getRealPath("/")+CommonConstant.UPLOAD_DIR;
//		String downLoadPath = ctxPath + fileName;

		long fileLength = new File(filePath).length();
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Content-disposition", "attachment; filename="
				+ new String(fileName.getBytes("utf-8"), "ISO-8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));

		bis = new BufferedInputStream(new FileInputStream(filePath));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
	}
}