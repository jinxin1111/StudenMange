package com.iflytek.dao;


import com.iflytek.pojo.User;

public interface UserDao {
	boolean register(User user);//ע��
	User login(User user);//��½У��
	User CheckSameUser(String username);//ע���ʱ������ݿ�������û���ƥ�䣬�����û����ظ�������
	
	
}
