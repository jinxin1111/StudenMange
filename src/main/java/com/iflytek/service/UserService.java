package com.iflytek.service;

import com.iflytek.pojo.User;


public interface UserService {

	boolean register(User user);//ע��
	User login(User user);//��½У�鿴���ݿ����Ƿ���ڸ��û����о͵�½�ɹ�
	User CheckSameUser(String username);//�����û����ظ�
	
}
