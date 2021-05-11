package com.example.second.dao;

import com.example.second.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

//mapper提供数据库的兼容（在dao的底层访问数据库）
@Mapper
@Component(value = "StudentDao")
public interface StudentDao {

    List<Student> findAllStudents();

    int deleteStudentById(Long uid);

    int insert(Student student);

    int addStudent(Student student);

    Student selectByPrimaryKey(Long uid);

    int updateStudent(Student student);

    int updateByPrimaryKey(Student student);

    List<Student> findStudentByName(String name);

    Integer deleteStudentsByIds(@Param("ids") Integer[] ids);

    int getCountStudents();
}
