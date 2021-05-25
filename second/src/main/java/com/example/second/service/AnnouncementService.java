package com.example.second.service;

import com.example.second.entity.Announcement;

import java.util.List;


public interface AnnouncementService {

    public List<Announcement> findAllAnnouncements();

    public void addAnnouncement(Announcement announcement);

    public void deleteAnnouncementById(Long uid);

    public void updateAnnouncement(Announcement announcement);

    List<Announcement> findAnnouncementByName(String name);

    public Integer deleteAnnouncementsByIds(Integer[] ids);

}
