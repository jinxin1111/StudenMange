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

	@Override//ע��У��
	public boolean register(User user) {
		// TODO Auto-generated method stub
	return userDao.register(user);
	}

	@Override//��½У��
	public User login(User user) {
		// TODO Auto-generated method stub
	return userDao.login(user);
	}

	@Override//�û����ظ�У��
	public User CheckSameUser(String username) {
		// TODO Auto-generated method stub
		return userDao.CheckSameUser(username);
	}

	
}
