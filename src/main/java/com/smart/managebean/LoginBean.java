package com.smart.managebean;

import org.springframework.beans.factory.annotation.Autowired;

import com.smart.service.UserService;

public class LoginBean {
	@Autowired
	private UserService userService;
	
	public String login(){
		return null;
		
	}
}
