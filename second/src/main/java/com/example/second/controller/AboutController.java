package com.example.second.controller;


import com.example.second.entity.About;
import com.example.second.service.AboutService;
import com.example.second.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/about")//地址
@CrossOrigin(allowCredentials = "true")

public class AboutController {

    @Autowired
    private AboutService aboutService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有书籍
     */
    @GetMapping("/findAllAbouts")
    public List<About> findAllAbouts() {
        return this.aboutService.findAllAbouts();
    }

    /**
     * 增加书籍
     */
    @PostMapping("/addAbout")
    public void addAbout(@RequestBody About about, BindingResult result) {
        this.aboutService.addAbout(about);
    }

//    public void addAbout(@RequestBody About about) {
//        this.aboutService.addAbout(about);
//    }

    /**
     * 根据书籍id删除书籍
     */
    @PostMapping("/deleteAbout")
    public void deleteAboutById(@RequestParam Long uid) {
        this.aboutService.deleteAboutById(uid);
    }

    /**
     * 编辑书籍
     */
    @PostMapping("/updateAbout")
    public void updateAbout(@RequestBody About about, BindingResult result) {
        this.aboutService.updateAbout(about);
    }

//    public void updateAbout(@RequestBody About about) {
//        this.aboutService.updateAbout(about);
//    }

    /**
     * 根据书籍姓名查找书籍
     */
    @GetMapping("/findAboutByName")
    public List<About> findAboutByName(@RequestParam String name) {
        return this.aboutService.findAboutByName(name);
    }

    /**
     * 批量删除书籍
     */
    @PostMapping("/deleteAboutsByIds")
    public Integer deleteAboutsByIds(Integer[] ids) {
        return this.aboutService.deleteAboutsByIds(ids);
    }
}
