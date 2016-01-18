package com.yunpan.dao;

import com.yunpan.entity.User;

/**
 * 用户管理DAO接口
 * @author pamgo
 *
 */
public interface IUserDao {
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public String login(String username,String password);
	
	/**
	 * 用户注册
	 * @param user 用户信息
	 * @param initSize 分配硬盘空间大小
	 * @return
	 */
	public boolean save(User user);
	
	/**
	 * 根据用户查询用户id
	 * @param username
	 * @return
	 */
	public Integer getUserIdByUsername(String username);
	
	/**
	 * 根据用户id查询用户名
	 * @param username
	 * @return
	 */
	public String getUserNameByUserid(int userid);
	
	/**
	 * 通过用户名和邮箱验证用户是否存在
	 * @param email
	 * @param username
	 * @return 1代表存在；2代表不存在
	 */
	public String confirm(String email,String username);
	
	/**
	 * 验证用户名是否可用
	 * @param username
	 * @return 1:代表可用；2:代表不可用
	 */
	public String confirmUsername(String username);
	
	/**
	 * 通过用户名查询用户身份
	 * @param username
	 * @return
	 */
	public String findRoleByUsername(String username);
	
}
