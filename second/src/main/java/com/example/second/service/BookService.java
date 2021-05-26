package com.example.second.service;

import com.example.second.entity.Book;

import java.util.List;


public interface BookService {

    public List<Book> findAllBooks();

    public void addBook(Book book);

    public void deleteBookById(Long uid);

    public void updateBook(Book book);

    List<Book> findBookByName(String name);

    public Integer deleteBooksByIds(Integer[] ids);

}
