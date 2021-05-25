package com.example.second.service.impl;

import com.example.second.dao.BookDao;
import com.example.second.entity.Book;
import com.example.second.exception.ValidateException;
import com.example.second.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class BookServiceBean implements BookService {

    @Autowired
    private BookDao bookDao;

    public List<Book> findAllBooks() {
        return this.bookDao.findAllBooks();
    }

    //返回错误数组
    public List<String> errors(Book book) {
        List<String> errors = new ArrayList<>();
        return errors;
    }

    @Transactional
    public void addBook(Book book) {
        if (errors(book).size() >0) {
            throw new ValidateException("-1", errors(book).toString());
        } else {
            this.bookDao.addBook(book);
        }
//        this.bookDao.addBook(book);
////        this.bookCopyDao.addBook(book);
//        Integer count = this.bookDao.getCountBooks();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.bookCountDao.addCount(count);
    }

    public void deleteBookById(Long uid) {
        this.bookDao.deleteBookById(uid);
        Integer count = this.bookDao.getCountBooks();
//        this.bookCountDao.addCount(count);
    }
    @Transactional
    public void updateBook(Book book) {
        if (errors(book).size() >0) {
            System.out.println(errors(book).toString());
            throw new ValidateException("500", errors(book).toString());
        } else {
            this.bookDao.updateBook(book);
        }
    }

    public List<Book> findBookByName(String name) {
        return this.bookDao.findBookByName(name);
    }

    public Integer deleteBooksByIds(Integer[] ids) {
        return this.bookDao.deleteBooksByIds(ids);
    }
}

