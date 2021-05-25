package com.example.second.controller;


import com.example.second.entity.Announcement;
import com.example.second.service.AnnouncementService;
import com.example.second.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/announcement")//地址
@CrossOrigin(allowCredentials = "true")

public class AnnouncementController {

    @Autowired
    private AnnouncementService announcementService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有书籍
     */
    @GetMapping("/findAllAnnouncements")
    public List<Announcement> findAllAnnouncements() {
        return this.announcementService.findAllAnnouncements();
    }

    /**
     * 增加书籍
     */
    @PostMapping("/addAnnouncement")
    public void addAnnouncement(@RequestBody Announcement announcement, BindingResult result) {
        this.announcementService.addAnnouncement(announcement);
    }

//    public void addAnnouncement(@RequestBody Announcement announcement) {
//        this.announcementService.addAnnouncement(announcement);
//    }

    /**
     * 根据书籍id删除书籍
     */
    @PostMapping("/deleteAnnouncement")
    public void deleteAnnouncementById(@RequestParam Long uid) {
        this.announcementService.deleteAnnouncementById(uid);
    }

    /**
     * 编辑书籍
     */
    @PostMapping("/updateAnnouncement")
    public void updateAnnouncement(@RequestBody Announcement announcement, BindingResult result) {
        this.announcementService.updateAnnouncement(announcement);
    }

//    public void updateAnnouncement(@RequestBody Announcement announcement) {
//        this.announcementService.updateAnnouncement(announcement);
//    }

    /**
     * 根据书籍姓名查找书籍
     */
    @GetMapping("/findAnnouncementByName")
    public List<Announcement> findAnnouncementByName(@RequestParam String name) {
        return this.announcementService.findAnnouncementByName(name);
    }

    /**
     * 批量删除书籍
     */
    @PostMapping("/deleteAnnouncementsByIds")
    public Integer deleteAnnouncementsByIds(Integer[] ids) {
        return this.announcementService.deleteAnnouncementsByIds(ids);
    }
}
