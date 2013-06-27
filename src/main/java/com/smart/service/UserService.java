package com.smart.service;

import java.util.List;

import com.smart.dao.LoginLogDao;
import com.smart.dao.UserDao;
import com.smart.domain.LoginLog;
import com.smart.domain.User;
import com.smart.domain.ViewSpace;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private LoginLogDao loginLogDao;
	
	public List<User> getAllUserList() {
		// TODO Auto-generated method stub
		return userDao.loadAll();
	}
	
	public void addUser(User user) {
		userDao.save(user);
	}

	public void deleteUser(int userId) {
		User user = userDao.load(userId);
		userDao.remove(user);

	}

	public void updateUser(User user) {
		userDao.update(user);
	}
	
	public User findUserByUserName(String userName) {
		return userDao.getUserByUserName(userName);
	}

    public User getUserById(int userId) {
        return userDao.get(userId);
    }

    public void saveLoginInfo(User user) {
        LoginLog loginLog = new LoginLog();
        loginLog.setUser(user);
        loginLog.setIp(user.getLastIp());
        loginLog.setLoginDate(user.getLastVisit());
        userDao.update(user);
        loginLogDao.save(loginLog);
    }

}
