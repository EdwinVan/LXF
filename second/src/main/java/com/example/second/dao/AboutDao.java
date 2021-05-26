package com.example.second.dao;

import com.example.second.entity.About;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

//mapper提供数据库的兼容（在dao的底层访问数据库）
@Mapper
@Component(value = "AboutDao")
public interface AboutDao {

    List<About> findAllAbouts();

    int deleteAboutById(Long uid);

    int insert(About about);

    int addAbout(About about);

    About selectByPrimaryKey(Long uid);

    int updateAbout(About about);

    int updateByPrimaryKey(About about);

    List<About> findAboutByName(String name);

    Integer deleteAboutsByIds(@Param("ids") Integer[] ids);

    int getCountAbouts();
}
