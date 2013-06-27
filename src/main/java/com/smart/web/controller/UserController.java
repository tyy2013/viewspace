package com.smart.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smart.domain.User;
import com.smart.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	protected static final Logger log = Logger.getLogger(UserController.class);
	
	// 打开用户管理页面
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String userManagePage() {
		return "/userManage";
	}
	
	// 获取所有用户的列表
	@RequestMapping(value = "/getUserList")
	@ResponseBody
	public Object getUserList(HttpServletRequest request) {
		log.info("/user/getUserList");
		List<User> userList = userService.getAllUserList();
		return userList;
	}
	
	@RequestMapping(value = "/add")
	public String addUserPage() {
        return "/addUser";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveUser(HttpServletRequest request, User user) {
		log.info("/saveUser");
		userService.addUser(user);
		return "redirect:"+"/user/manage.do";
	}
	
	@RequestMapping(value = "/{id}/edit")
	public String updateUserPage(@PathVariable Integer id, HttpServletRequest request) {
		log.info("/updateUserPage");
		User user = userService.getUserById(id);
		request.setAttribute("user", user);
		return "/addUser";
	}
	
	@RequestMapping(value = "/{id}/update", method = RequestMethod.PUT)
	public String updateUser(@PathVariable Integer id, HttpServletRequest request, User user) {
		log.info("/updateUser");
		user.setUserId(id);
		userService.updateUser(user);
		return "redirect:"+"/user/manage.do";
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer id) {
		log.info("/deleteUser");		
		userService.deleteUser(id);
		return "redirect:"+"/user/manage.do";
	}
}
