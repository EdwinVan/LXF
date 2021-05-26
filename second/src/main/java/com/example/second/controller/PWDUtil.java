package com.example.second.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PWDUtil {
    public static void main(String[] args)
    {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println( encoder.encode("123456"));
    }
}
