package com.example.second.entity;


import javax.validation.constraints.*;

public class Teacher {
    private Long uid;

//    @NotBlank(message = "请输入名字")
//    @Pattern(regexp="^[\\u4E00-\\u9FA5A-Za-z]+$",message = "请输入正确的名字")
//    @Size(min = 6, message = "姓名长度在 6 到 16 个字符")
//    @Size(max = 16, message = "姓名长度在 6 到 16 个字符")
    private String name;

//    @NotNull(message = "年龄不能为空")
    private Integer age;

//    @NotBlank(message = "性别不能为空")
    private String sex;

//    @NotBlank(message = "民族不能为空")
    private String nation;

//    @NotBlank(message = "党员选择不能为空")
    private String party;

//    @NotBlank(message = "地区选择不能为空")
    private String area;

//    @NotBlank(message = "地址不能为空")
    private String address;

//    @NotBlank(message = "手机号不能为空")
//    @Pattern(regexp = "^^1[0-9]{10}$",message = "请输入正确的手机号码")
    private String phone;

//    @NotBlank(message = "邮箱不能为空")
//    @Email
    private String email;

//    @NotBlank(message = "毕业学校不能为空")
    private String school;

//    @NotBlank(message = "专业不能为空")
    private String speciality;

//    @NotBlank(message = "学历不能为空")
    private String qualification;

//    @NotBlank(message = "入职时间不能为空")
    private String workDate;

//    @NotBlank(message = "所属学院不能为空")
    private String college;

//    @NotBlank(message = "授课不能为空")
    private String course;

//    @NotBlank(message = "职称不能为空")
    private String title;

//    @NotBlank(message = "爱好不能为空")
    private String hobby;

//    @NotNull(message = "评分不能为空")
    private Double rate;

//    @NotBlank(message = "能力不能为空")
    private String ability;

//    @NotBlank(message = "个人评价不能为空")
    private String evaluate;



    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getNation() { return nation; }

    public void setNation(String nation) { this.nation = nation; }

    public String getParty() { return party; }

    public void setParty(String party) { this.party = party; }

    public String getArea() { return area; }

    public void setArea(String area) { this.area = area; }

    public String getAddress() { return address; }

    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getSchool() { return school; }

    public void setSchool(String school) { this.school = school == null ? null : school.trim(); }

    public String getSpeciality() { return speciality; }

    public void setSpeciality(String speciality) { this.speciality = speciality == null ? null : speciality.trim(); }

    public String getQualification() { return qualification; }

    public void setQualification(String qualification) { this.qualification = qualification; }

    public String getWorkDate() { return workDate; }

    public void setWorkDate(String workDate) { this.workDate = workDate; }

    public String getCollege() { return college; }

    public void setCollege(String college) { this.college = college; }

    public String getCourse() { return course; }

    public void setCourse(String course) { this.course = course == null ? null : course.trim(); }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getHobby() { return hobby; }

    public void setHobby(String hobby) { this.hobby = hobby; }

    public Double getRate() { return rate; }

    public void setRate(Double rate) { this.rate = rate; }

    public String getAbility() { return ability; }

    public void setAbility(String ability) { this.ability = ability; }

    public String getEvaluate() { return evaluate; }

    public void setEvaluate(String evaluate) { this.evaluate = evaluate; }

}
