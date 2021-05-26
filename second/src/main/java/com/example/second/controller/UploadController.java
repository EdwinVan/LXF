package com.example.second.controller;


import com.example.second.entity.RespBean;
import com.example.second.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@RestController
public class UploadController {

    @Autowired
    private UploadService uploadService;


    @PostMapping("/upload")
    public void uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        this.uploadService.uploadFile(file, request);
    }
}
