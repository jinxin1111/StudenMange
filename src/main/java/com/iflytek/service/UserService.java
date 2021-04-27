package com.iflytek.service;

import com.iflytek.pojo.User;


public interface UserService {

	boolean register(User user);//注册
	User login(User user);//登陆校验看数据库中是否存在该用户，有就登陆成功
	User CheckSameUser(String username);//检验用户名重复
	
}
