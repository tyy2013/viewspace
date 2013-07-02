package com.smart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

/**
 * 异常处理
 */
public class ViewSpaceHandlerExceptionResolver extends
		SimpleMappingExceptionResolver {
	 protected ModelAndView doResolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
	        httpServletRequest.setAttribute("errorMsg",  e.getMessage());
	        return super.doResolveException(httpServletRequest, httpServletResponse, o, e);
	    }
}
