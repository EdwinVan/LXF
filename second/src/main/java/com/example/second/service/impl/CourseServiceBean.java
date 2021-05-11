package com.example.second.service.impl;

import com.example.second.dao.CourseDao;
import com.example.second.entity.Course;
import com.example.second.entity.Student;
import com.example.second.exception.ValidateException;
import com.example.second.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class CourseServiceBean implements CourseService {

    @Autowired
    private CourseDao courseDao;

    public List<Course> findAllCourses() {
        return this.courseDao.findAllCourses();
    }

    //返回错误数组
    public List<String> errors(Course course) {
        List<String> errors = new ArrayList<>();
        if (course.getName() == null) {
            errors.add("名称不能为空");
        }
        if (course.getIntroduction() == null) {
            errors.add("课程简介不能为空");
        }
        if (course.getKind() == null) {
            errors.add("课程性质不能为空");
        }
        if (course.getCredit() == null) {
            errors.add("学分不能为空");
        }
        if (course.getUnit() == null) {
            errors.add("开课单位不能为空");
        }
        if (course.getTeacher() == null) {
            errors.add("授课老师不能为空");
        }

        return errors;
    }

    @Transactional
    public void addCourse(Course course) {
        if (errors(course).size() >0) {
            throw new ValidateException("-1", errors(course).toString());
        } else {
            this.courseDao.addCourse(course);
        }
//        this.courseDao.addCourse(course);
////        this.courseCopyDao.addCourse(course);
//        Integer count = this.courseDao.getCountCourses();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.courseCountDao.addCount(count);
    }

    public void deleteCourseById(Long uid) {
        this.courseDao.deleteCourseById(uid);
        Integer count = this.courseDao.getCountCourses();
//        this.courseCountDao.addCount(count);
    }
    @Transactional
    public void updateCourse(Course course) {
        if (errors(course).size() >0) {
            System.out.println(errors(course).toString());
            throw new ValidateException("500", errors(course).toString());
        } else {
            this.courseDao.updateCourse(course);
        }
    }

    public List<Course> findCourseByName(String name) {
        return this.courseDao.findCourseByName(name);
    }

    public Integer deleteCoursesByIds(Integer[] ids) {
        return this.courseDao.deleteCoursesByIds(ids);
    }
}

