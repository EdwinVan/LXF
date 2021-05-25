package com.example.second.service.impl;

import com.example.second.dao.AnnouncementDao;
import com.example.second.entity.Announcement;
import com.example.second.exception.ValidateException;
import com.example.second.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class AnnouncementServiceBean implements AnnouncementService {

    @Autowired
    private AnnouncementDao announcementDao;

    public List<Announcement> findAllAnnouncements() {
        return this.announcementDao.findAllAnnouncements();
    }

    //返回错误数组
    public List<String> errors(Announcement announcement) {
        List<String> errors = new ArrayList<>();
        return errors;
    }

    @Transactional
    public void addAnnouncement(Announcement announcement) {
        if (errors(announcement).size() >0) {
            throw new ValidateException("-1", errors(announcement).toString());
        } else {
            this.announcementDao.addAnnouncement(announcement);
        }
//        this.announcementDao.addAnnouncement(announcement);
////        this.announcementCopyDao.addAnnouncement(announcement);
//        Integer count = this.announcementDao.getCountAnnouncements();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.announcementCountDao.addCount(count);
    }

    public void deleteAnnouncementById(Long uid) {
        this.announcementDao.deleteAnnouncementById(uid);
        Integer count = this.announcementDao.getCountAnnouncements();
//        this.announcementCountDao.addCount(count);
    }
    @Transactional
    public void updateAnnouncement(Announcement announcement) {
        if (errors(announcement).size() >0) {
            System.out.println(errors(announcement).toString());
            throw new ValidateException("500", errors(announcement).toString());
        } else {
            this.announcementDao.updateAnnouncement(announcement);
        }
    }

    public List<Announcement> findAnnouncementByName(String name) {
        return this.announcementDao.findAnnouncementByName(name);
    }

    public Integer deleteAnnouncementsByIds(Integer[] ids) {
        return this.announcementDao.deleteAnnouncementsByIds(ids);
    }
}

