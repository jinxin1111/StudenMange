package com.iflytek.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable{//�û���
	private int id;// ���
	private String username;// �û���
	private String password;// ����
}
