package com.example.second.service.impl;


import com.example.second.service.UploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class UploadServiceBean implements UploadService {

    public void uploadFile(MultipartFile file, HttpServletRequest request) {
        try {
            String oldName = file.getOriginalFilename();
            String realPath = "E:\\file_upload\\";
            String newName = UUID.randomUUID().toString() + "_" + oldName;
            File folder = new File(realPath, newName);
            if (!folder.exists()) {
                folder.mkdirs();
            }
            file.transferTo(folder);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
