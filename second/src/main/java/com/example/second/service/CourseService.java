package com.example.second.service;

import com.example.second.entity.Course;

import java.util.List;


public interface CourseService {

    public List<Course> findAllCourses();

    public void addCourse(Course course);

    public void deleteCourseById(Long uid);

    public void updateCourse(Course course);

    List<Course> findCourseByName(String name);

    public Integer deleteCoursesByIds(Integer[] ids);

}
