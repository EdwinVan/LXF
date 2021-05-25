package com.example.second.controller;


import com.example.second.entity.Book;
import com.example.second.service.BookService;
import com.example.second.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/book")//地址
@CrossOrigin(allowCredentials = "true")

public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有教师
     */
    @GetMapping("/findAllBooks")
    public List<Book> findAllBooks() {
        return this.bookService.findAllBooks();
    }

    /**
     * 增加教师
     */
    @PostMapping("/addBook")
    public void addBook(@RequestBody Book book, BindingResult result) {
        this.bookService.addBook(book);
    }

//    public void addBook(@RequestBody Book book) {
//        this.bookService.addBook(book);
//    }

    /**
     * 根据教师id删除教师
     */
    @PostMapping("/deleteBook")
    public void deleteBookById(@RequestParam Long uid) {
        this.bookService.deleteBookById(uid);
    }

    /**
     * 编辑教师
     */
    @PostMapping("/updateBook")
    public void updateBook(@RequestBody Book book, BindingResult result) {
        this.bookService.updateBook(book);
    }

//    public void updateBook(@RequestBody Book book) {
//        this.bookService.updateBook(book);
//    }

    /**
     * 根据教师姓名查找教师
     */
    @GetMapping("/findBookByName")
    public List<Book> findBookByName(@RequestParam String name) {
        return this.bookService.findBookByName(name);
    }

    /**
     * 批量删除教师
     */
    @PostMapping("/deleteBooksByIds")
    public Integer deleteBooksByIds(Integer[] ids) {
        return this.bookService.deleteBooksByIds(ids);
    }
}
