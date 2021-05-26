package com.example.second.service.impl;

//import com.example.second.dao.TeacherCopyDao;
//import com.example.second.dao.TeacherCountDao;
import com.example.second.dao.TeacherDao;
import com.example.second.entity.Teacher;
import com.example.second.exception.ValidateException;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class TeacherServiceBean implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

//    @Autowired
//    private TeacherCountDao teacherCountDao;
//
//    @Autowired
//    TeacherCopyDao teacherCopyDao;

    public List<Teacher> findAllTeachers() {
        return this.teacherDao.findAllTeachers();
    }

    //返回错误数组
    public List<String> errors(Teacher teacher) {
        List<String> errors = new ArrayList<>();
        if (teacher.getUid() == null || teacher.getUid() > 1000 || teacher.getUid() < 1) {
            errors.add("ID输入错误");
        }
        if (teacher.getName() == null) {
            errors.add("名字不能为空");
        }
        if (!(teacher.getName().matches("^[\\u4E00-\\u9FA5A-Za-z]+$"))) {
            errors.add("请输入正确的名字");
        }
        if (teacher.getName().length() < 2 || teacher.getName().length() > 12) {
            errors.add("名字长度在 2 到 12 个字符");
        }
        if (teacher.getSex() == null) {
            errors.add("性别不能为空");
        }
        if (teacher.getNation() == null) {
            errors.add("民族不能为空");
        }
        if (teacher.getAge() == null) {
            errors.add("年龄不能为空");
        }
        if (teacher.getParty() == null) {
            errors.add("党员选择不能为空");
        }
        if (teacher.getArea() == null) {
            errors.add("地区选择不能为空");
        }
        if (teacher.getAddress() == null) {
            errors.add("住址不能为空");
        }
        if (teacher.getPhone() == null) {
            errors.add("手机号不能为空");
        }
        if (!(teacher.getPhone().matches("^1[0-9]{10}$"))) {
            errors.add("请输入正确的手机号");
        }
        if (teacher.getEmail() == null) {
            errors.add("邮箱不能为空");
        }
        if (!(teacher.getEmail().matches("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$"))) {
            errors.add("请输入正确的邮箱");
        }
        if (teacher.getSchool() == null) {
            errors.add("毕业学校不能为空");
        }
        if (teacher.getSpeciality() == null) {
            errors.add("专业不能为空");
        }
        if (teacher.getQualification() == null) {
            errors.add("学历不能为空");
        }
        if (teacher.getWorkDate() == null) {
            errors.add("入职时间不能为空");
        }
        if (teacher.getCollege() == null) {
            errors.add("所属学院不能为空");
        }
        if (teacher.getCourse() == null) {
            errors.add("任课不能为空");
        }
        if (teacher.getTitle() == null) {
            errors.add("职称不能为空");
        }
        if (teacher.getHobby() == null) {
            errors.add("爱好不能为空");
        }
        if (teacher.getRate() == null) {
            errors.add("评分不能为空");
        }
        if (teacher.getAbility() == null) {
            errors.add("能力不能为空");
        }
        if (teacher.getEvaluate() == null) {
            errors.add("个人评价不能为空");
        }

        return errors;
    }

    @Transactional
    public void addTeacher(Teacher teacher) {
        if (errors(teacher).size() >0) {
            throw new ValidateException("-1", errors(teacher).toString());
        } else {
            this.teacherDao.addTeacher(teacher);
        }
//        this.teacherDao.addTeacher(teacher);
////        this.teacherCopyDao.addTeacher(teacher);
//        Integer count = this.teacherDao.getCountTeachers();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.teacherCountDao.addCount(count);
    }

    public void deleteTeacherById(Long uid) {
        this.teacherDao.deleteTeacherById(uid);
        Integer count = this.teacherDao.getCountTeachers();
//        this.teacherCountDao.addCount(count);
    }
    @Transactional
    public void updateTeacher(Teacher teacher) {
        if (errors(teacher).size() >0) {
            System.out.println(errors(teacher).toString());
            throw new ValidateException("500", errors(teacher).toString());
        } else {
            this.teacherDao.updateTeacher(teacher);
        }
    }

    public List<Teacher> findTeacherByName(String name) {
        return this.teacherDao.findTeacherByName(name);
    }

    public Integer deleteTeachersByIds(Integer[] ids) {
        return this.teacherDao.deleteTeachersByIds(ids);
    }


}

