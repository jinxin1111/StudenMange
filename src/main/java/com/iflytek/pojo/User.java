package com.iflytek.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable{//用户表
	private int id;// 序号
	private String username;// 用户名
	private String password;// 密码
}
