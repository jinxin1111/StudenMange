package com.iflytek.dao;

import com.iflytek.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;



public interface BookDao {

	List<Book> selectAllBook();//��ѯ����ͼ��
	List<Book> selectAllBookPage(@Param("pageString") int pageString,@Param("a")  int a);//��ҳ��ѯ
	List<Book> selectBook(@Param("bookname")String bookname);//ģ����ѯͼ��
	int BookMod(Book book);//�޸�ͼ��
    int DeleteBook(int id);//ɾ��ͼ��
	int BorrowBook(int id);//����ͼ��
	int AddBook(Book book);//����ͼ��

}
