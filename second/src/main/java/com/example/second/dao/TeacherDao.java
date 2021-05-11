package com.example.second.dao;

import com.example.second.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

//mapper提供数据库的兼容（在dao的底层访问数据库）
@Mapper
@Component(value = "TeacherDao")
public interface TeacherDao {

    List<Teacher> findAllTeachers();

    int deleteTeacherById(Long uid);

    int insert(Teacher teacher);

    int addTeacher(Teacher teacher);

    Teacher selectByPrimaryKey(Long uid);

    int updateTeacher(Teacher teacher);

    int updateByPrimaryKey(Teacher teacher);

    List<Teacher> findTeacherByName(String name);

    Integer deleteTeachersByIds(@Param("ids") Integer[] ids);

    int getCountTeachers();
}
