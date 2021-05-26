package com.example.second.dao;

import com.example.second.entity.Announcement;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

//mapper提供数据库的兼容（在dao的底层访问数据库）
@Mapper
@Component(value = "AnnouncementDao")
public interface AnnouncementDao {

    List<Announcement> findAllAnnouncements();

    int deleteAnnouncementById(Long uid);

    int insert(Announcement announcement);

    int addAnnouncement(Announcement announcement);

    Announcement selectByPrimaryKey(Long uid);

    int updateAnnouncement(Announcement announcement);

    int updateByPrimaryKey(Announcement announcement);

    List<Announcement> findAnnouncementByName(String name);

    Integer deleteAnnouncementsByIds(@Param("ids") Integer[] ids);

    int getCountAnnouncements();
}
