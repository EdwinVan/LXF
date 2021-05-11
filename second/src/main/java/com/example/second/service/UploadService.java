package com.example.second.service;


import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface UploadService {

    public void uploadFile(MultipartFile file, HttpServletRequest request);

}
