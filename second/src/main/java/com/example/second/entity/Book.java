package com.example.second.entity;


public class Book {
    private Long uid;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBookinc() {
        return bookinc;
    }

    public void setBookinc(String bookinc) {
        this.bookinc = bookinc;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    private String bookname;

    private String bookinc;

    private String publisher;

    private String author;




}
