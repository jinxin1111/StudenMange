package com.iflytek.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iflytek.dao.UserDao;
import com.iflytek.pojo.User;
import com.iflytek.service.UserService;

@Service
public class UserServiceimpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override//注册校验
	public boolean register(User user) {
		// TODO Auto-generated method stub
	return userDao.register(user);
	}

	@Override//登陆校验
	public User login(User user) {
		// TODO Auto-generated method stub
	return userDao.login(user);
	}

	@Override//用户名重复校验
	public User CheckSameUser(String username) {
		// TODO Auto-generated method stub
		return userDao.CheckSameUser(username);
	}

	
}
