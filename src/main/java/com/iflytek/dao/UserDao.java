package com.iflytek.dao;


import com.iflytek.pojo.User;

public interface UserDao {
	boolean register(User user);//注册
	User login(User user);//登陆校验
	User CheckSameUser(String username);//注册的时候和数据库里面的用户名匹配，检验用户名重复的问题
	
	
}
