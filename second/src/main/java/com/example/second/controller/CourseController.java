package com.example.second.controller;


import com.example.second.entity.Course;
import com.example.second.service.MenuService;
import com.example.second.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/course")//地址
@CrossOrigin(allowCredentials = "true")

public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有教师
     */
    @GetMapping("/findAllCourses")
    public List<Course> findAllCourses() {
        return this.courseService.findAllCourses();
    }

    /**
     * 增加教师
     */
    @PostMapping("/addCourse")
    public void addCourse(@RequestBody Course course, BindingResult result) {
        this.courseService.addCourse(course);
    }

//    public void addCourse(@RequestBody Course course) {
//        this.courseService.addCourse(course);
//    }

    /**
     * 根据教师id删除教师
     */
    @PostMapping("/deleteCourse")
    public void deleteCourseById(@RequestParam Long uid) {
        this.courseService.deleteCourseById(uid);
    }

    /**
     * 编辑教师
     */
    @PostMapping("/updateCourse")
    public void updateCourse(@RequestBody Course course, BindingResult result) {
        this.courseService.updateCourse(course);
    }

//    public void updateCourse(@RequestBody Course course) {
//        this.courseService.updateCourse(course);
//    }

    /**
     * 根据教师姓名查找教师
     */
    @GetMapping("/findCourseByName")
    public List<Course> findCourseByName(@RequestParam String name) {
        return this.courseService.findCourseByName(name);
    }

    /**
     * 批量删除教师
     */
    @PostMapping("/deleteCoursesByIds")
    public Integer deleteCoursesByIds(Integer[] ids) {
        return this.courseService.deleteCoursesByIds(ids);
    }
}
