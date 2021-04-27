package com.iflytek.service.impl;

import com.iflytek.dao.BookDao;
import com.iflytek.pojo.Book;
import com.iflytek.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookServiceimpl implements BookService {

    @Autowired
    private BookDao bookDao;


    @Override//查询所有图书
    public List<Book> selectAllBook() {
        return bookDao.selectAllBook();
    }

    @Override
    public List<Book> selectAllBookPage(int pageString,int a) {
        System.out.println(pageString);
        return bookDao.selectAllBookPage(pageString,a);
    }

    @Override
    public List<Book> selectBook(String bookname) {

        return bookDao.selectBook(bookname);
    }

    @Override
    public int BookMod(Book book) {
        return bookDao.BookMod(book);
    }

    @Override
    public int DeleteBook(int id) {
        return bookDao.DeleteBook(id);
    }

    @Override
    public int BorrowBook(int id) {
        return bookDao.BorrowBook(id);
    }

    @Override
    public int AddBook(Book book) { return bookDao.AddBook(book); }
}
