package com.yunpan.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.yunpan.db.DBUtil;
import com.yunpan.entity.User;
import com.yunpan.util.ConstantUtils;
import com.yunpan.util.FileStorage;

/**
 * 用户注册，初始化一些信息
 * 
 * @author pamgo
 * 
 */
public class RegisterTransaction {
	/**
	 * 用户注册初始化一些信息
	 * 
	 * @param user
	 * @param initSize
	 */
	public static boolean register(User user, long initSize) {
		Connection conn = DBUtil.getConnection();
		try {
			conn.setAutoCommit(false);
			String sql1 = "insert into users(email,username,password) values(?,?,?)";
			String sql2 = "insert into yp_folderinfo(foldername,create_userid,path,parent_path) values(?,?,?,?)";
			String sql3 = "insert into yp_diskinfo(disk_userid,total_size,used_size,filenumber,diskuser) values(?,?,0,0,?)";
			String uidsql = null;
			Object uid = null;
			if (DBUtil.executeUpdate(sql1, user.getEmail(), user.getUsername(),
					user.getPassword()) > 0) {
				uidsql = "SELECT MAX(id) FROM users";
				uid = DBUtil.executeQuery(uidsql);
			}
			DBUtil.executeUpdate(sql2, user.getUsername() + ConstantUtils.INITSIZE + "KB",
					Integer.parseInt(uid.toString()),
					FileStorage.getRealPath(), FileStorage.getFileRealPath());
			if (initSize != 0) {
				DBUtil.executeUpdate(sql3, Integer.parseInt(uid.toString()),
						initSize);
			} else {
				DBUtil.executeUpdate(sql3, Integer.parseInt(uid.toString()), 0,user.getUsername());
			}
			conn.commit();
			return true;
		} catch (SQLException e) {
			try {
				conn.rollback();
				throw new RuntimeException();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			return false;
		}
	}
}
