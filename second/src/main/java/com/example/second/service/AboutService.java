package com.example.second.service;

import com.example.second.entity.About;

import java.util.List;


public interface AboutService {

    public List<About> findAllAbouts();

    public void addAbout(About about);

    public void deleteAboutById(Long uid);

    public void updateAbout(About about);

    List<About> findAboutByName(String name);

    public Integer deleteAboutsByIds(Integer[] ids);

}
