package com.iflytek.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.pojo.Book;
import com.iflytek.pojo.User;
import com.iflytek.service.BookService;
import com.iflytek.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//ע��ķ�ʽ������spring����ȥ����
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private BookService bookService;
	//��ת����½ҳ��
	@RequestMapping("/login2")
	public String Login2() {
		return "adminLogin";
	}

	@RequestMapping("/home")
	public String home() {
		return "Console";
	}

	@RequestMapping("/ViewIndexServlet")
	public String Success() {
		return "success";
	}
	@RequestMapping("/SelectBookList")
	public String search() {
		return "search";
	}

	@RequestMapping("/showSelectBookList")
	public String search1() {
		return "search1";
	}

	// ��½�ɹ���ת���ɹ�ҳ�� ���ڼ����½��תһ��
	@RequestMapping(value ="/login",method = RequestMethod.GET,produces="text/html;charset=GBK")
	@ResponseBody
	public String Login(User user, HttpSession session) {
		Map<String, Object> usermap=new HashMap<String, Object>();
		user=userService.login(user);
		if(user!=null) {//���ݿ���������
			usermap.put("code",0);
			usermap.put("msg", "SUCCESS");
			usermap.put("count", 1);
			usermap.put("data", user);

		}else {
			usermap.put("code",1);
			usermap.put("msg", "FAIL!!!");
			usermap.put("count", 1);
			usermap.put("data", user);
		}
		session.setAttribute("usermap", usermap);
		return JSONArray.toJSONString(usermap);
	}

	// ע����淵�ص����ı������ж�ע���Ƿ�ɹ�
	@ResponseBody
	@RequestMapping(value = "/register")
	public String register(User user) {
		if(userService.register(user)) {
			return "suc";
		}
		else {
			return "fail";
		}

	}

	//ע���û���ʱҪ�������ݿ���������ֲ����ظ�
	@ResponseBody
	@RequestMapping("/checkSameUser")
	public String checkSameUser(String username) {
		User user=userService.CheckSameUser(username);
		if(user !=null) {//����������治�ǿյģ��Ǿ�˵���Ѿ����ڸ��û�������ʧ��
			return "fail";
		}
		else {
			return "Success";
		}
	}

	//��ѯ���е���
	@ResponseBody
	@RequestMapping(value ="/BookAllList",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public  String selectALL()
	{
		List<Book> list=bookService.selectAllBook();
		HashMap<String, Object> map = new HashMap<>();
		map.put("code","0");
		map.put("msg","success");
		map.put("count",10);
		map.put("data",list);
		String o = JSONObject.toJSONString(map);
		System.out.println(o);
		return  o;

	}
	//��ҳ��ѯ
	@ResponseBody
	@RequestMapping(value ="/BookAllListPage",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public  String selectALLPage(int page,int limit)
	{

		int pageString=page-1;
		int a=limit;
		List<Book> list=bookService.selectAllBookPage(pageString,a);

		System.out.println(list);
		HashMap<String, Object> map = new HashMap<>();
		map.put("code","0");
		map.put("msg","success");
		map.put("count",10);
		map.put("data",list);
		String o = JSONObject.toJSONString(map);
		return  o;

	}

    //�޸�ͼ��
	@ResponseBody
	@RequestMapping(value ="/BookModification",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public  String BookMod(int id,String bookName,String bookType, String editor)
	{
		System.out.println(id+bookName+bookType+editor);
		Book book=new Book();
        book.setId(id);
        book.setBookname(bookName);
        book.setBooktype(bookType);
        book.setEditor(editor);
		System.out.println(book);
        int i=bookService.BookMod(book);
		System.out.println(i);
		if(i!=0) {

			return "success";
		}
		else {
			return "fail";
		}
	}
	//����ͼ��
	@ResponseBody
	@RequestMapping(value ="/Bookadd",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public  String Bookadd(int id,String bookName,String bookType, String editor)
	{
		System.out.println(id+bookName+bookType+editor);
		Book book=new Book();
		book.setId(id);
		book.setBookname(bookName);
		book.setBooktype(bookType);
		book.setEditor(editor);
		System.out.println(book);

		int i=bookService.AddBook(book);
		System.out.println(i);
		if(i!=0) {

			return "success";
		}
		else {
			return "fail";
		}
	}

	//ɾ��ͼ��
	@ResponseBody
	@RequestMapping(value ="/DeleteBook",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public  String DeleteBook(int id)
	{

		int i=bookService.DeleteBook(id);
		System.out.println(i);
		if(i!=0) {

			return "success";
		}
		else {
			return "fail";
		}
	}

	//����ͼ��
	@ResponseBody
	@RequestMapping(value ="/BorrowBook",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	public  String BorrowBook(int id)
	{

		int i=bookService.BorrowBook(id);
		System.out.println(i);
		if(i!=0) {

			return "success";
		}
		else {
			return "fail";
		}
	}

	//ģ����ѯ
	@ResponseBody
	@RequestMapping(value ="/finds",method = RequestMethod.GET,produces="text/html;charset=UTF-8")
	public  String select(@RequestParam String bookname)
	{
		System.out.println(bookname);
		System.out.println("11111111111111");
		List<Book> list=bookService.selectBook(bookname);
		HashMap<String, Object> map = new HashMap<>();
		map.put("code","0");
		map.put("msg","success");
		map.put("count",10);
		map.put("data",list);
		String o = JSONObject.toJSONString(map);
		System.out.println(o);
		return  o;

	}

}
