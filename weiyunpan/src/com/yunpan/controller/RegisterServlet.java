package com.yunpan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.yunpan.dao.RegisterTransaction;
import com.yunpan.entity.User;
import com.yunpan.service.IUserService;
import com.yunpan.service.impl.UserServiceImpl;
import com.yunpan.util.BaseServlet;
import com.yunpan.util.ConstantUtils;
import com.yunpan.util.FileStorage;
import com.yunpan.util.StringHelper;

/**
 * 注册类
 * 
 * @author pamgo
 * 
 */
public class RegisterServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	Logger logging = Logger.getLogger(RegisterServlet.class);

	/**
	 * 用户注册，初始化一些信息
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void regist(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logging.warn("***************>进入注册<***************");
		PrintWriter out = response.getWriter();
		User user = new User();
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		user.setEmail(email);
		user.setUsername(username);
		user.setPassword(StringHelper.MD5(password));
		boolean result = RegisterTransaction.register(user,
				ConstantUtils.INITSIZE);
		if (result) {
			logging.warn("***************>注册成功<***************");
			// 为注册用户新建一个文件夹
			logging.warn("***************>为注册用户新建文件夹以及初始化信息<***************");
			String path = FileStorage.getFileRealPath() + "/"
					+ user.getUsername() + ConstantUtils.INITSIZE + "KB";
			File folder = new File(path);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			logging.warn("***************>新建文件夹完成<***************");
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	
	/*
	 * Ajax请求用户名是否可用
	 */
	public void checkNameExist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		PrintWriter out = response.getWriter();
		logging.warn("***************>检查用户名<***************");	
		IUserService userService = new UserServiceImpl();
		String result = userService.confirmUsername(username);
		if(result == "2"){
			out.write("<font color='red'>此用户名已存在!请登录</font>");
		} else {
			out.write("<font color='blue'>此用户可用!</font>");
		}
	} 

}
