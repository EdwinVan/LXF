package com.example.second.service.impl;

import com.example.second.dao.AboutDao;
import com.example.second.entity.About;
import com.example.second.exception.ValidateException;
import com.example.second.service.AboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class AboutServiceBean implements AboutService {

    @Autowired
    private AboutDao aboutDao;

    public List<About> findAllAbouts() {
        return this.aboutDao.findAllAbouts();
    }

    //返回错误数组
    public List<String> errors(About about) {
        List<String> errors = new ArrayList<>();
        return errors;
    }

    @Transactional
    public void addAbout(About about) {
        if (errors(about).size() >0) {
            throw new ValidateException("-1", errors(about).toString());
        } else {
            this.aboutDao.addAbout(about);
        }
//        this.aboutDao.addAbout(about);
////        this.aboutCopyDao.addAbout(about);
//        Integer count = this.aboutDao.getCountAbouts();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.aboutCountDao.addCount(count);
    }

    public void deleteAboutById(Long uid) {
        this.aboutDao.deleteAboutById(uid);
        Integer count = this.aboutDao.getCountAbouts();
//        this.aboutCountDao.addCount(count);
    }
    @Transactional
    public void updateAbout(About about) {
        if (errors(about).size() >0) {
            System.out.println(errors(about).toString());
            throw new ValidateException("500", errors(about).toString());
        } else {
            this.aboutDao.updateAbout(about);
        }
    }

    public List<About> findAboutByName(String name) {
        return this.aboutDao.findAboutByName(name);
    }

    public Integer deleteAboutsByIds(Integer[] ids) {
        return this.aboutDao.deleteAboutsByIds(ids);
    }
}

