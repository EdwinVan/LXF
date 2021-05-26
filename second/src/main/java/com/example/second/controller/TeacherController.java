package com.example.second.controller;


import com.example.second.entity.Teacher;
import com.example.second.service.MenuService;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/teacher")//地址
@CrossOrigin(allowCredentials = "true")

public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有教师
     */
    @GetMapping("/findAllTeachers")
    public List<Teacher> findAllTeachers() {
        return this.teacherService.findAllTeachers();
    }

    /**
     * 增加教师
     */
    @PostMapping("/addTeacher")
    public void addTeacher(@RequestBody Teacher teacher, BindingResult result) {
        this.teacherService.addTeacher(teacher);
    }

//    public void addTeacher(@RequestBody Teacher teacher) {
//        this.teacherService.addTeacher(teacher);
//    }

    /**
     * 根据教师id删除教师
     */
    @PostMapping("/deleteTeacher")
    public void deleteTeacherById(@RequestParam Long uid) {
        this.teacherService.deleteTeacherById(uid);
    }

    /**
     * 编辑教师
     */
    @PostMapping("/updateTeacher")
    public void updateTeacher(@RequestBody Teacher teacher, BindingResult result) {
        this.teacherService.updateTeacher(teacher);
    }
//    public void updateTeacher(@RequestBody Teacher teacher) {
//        this.teacherService.updateTeacher(teacher);
//    }

    /**
     * 根据教师姓名查找教师
     */
    @GetMapping("/findTeacherByName")
    public List<Teacher> findTeacherByName(@RequestParam String name) {
        return this.teacherService.findTeacherByName(name);
    }

    /**
     * 批量删除教师
     */
    @PostMapping("/deleteTeachersByIds")
    public Integer deleteTeachersByIds(Integer[] ids) {
        return this.teacherService.deleteTeachersByIds(ids);
    }
}
