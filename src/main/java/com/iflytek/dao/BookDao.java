package com.iflytek.dao;

import com.iflytek.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;



public interface BookDao {

	List<Book> selectAllBook();//查询所有图书
	List<Book> selectAllBookPage(@Param("pageString") int pageString,@Param("a")  int a);//分页查询
	List<Book> selectBook(@Param("bookname")String bookname);//模糊查询图书
	int BookMod(Book book);//修改图书
    int DeleteBook(int id);//删除图书
	int BorrowBook(int id);//借阅图书
	int AddBook(Book book);//增加图书

}
