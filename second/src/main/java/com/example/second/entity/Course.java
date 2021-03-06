package com.example.second.entity;


public class Course {
    private Long uid;

    private String name;

    private String introduction;

    private String kind;

    private Double credit;

    private String unit;

    private String teacher;

    private String goal;

    private String team;

    private String textbook;

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

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction ;
    }

    public String getKind() { return kind; }

    public void setKind(String kind) { this.kind = kind; }

    public Double getCredit() { return credit; }

    public void setCredit(Double credit) { this.credit = credit; }

    public String getUnit() { return unit; }

    public void setUnit(String unit) { this.unit = unit; }

    public String getTeacher() { return teacher; }

    public void setTeacher(String teacher) { this.teacher = teacher; }

    public String getGoal() { return goal; }

    public void setGoal(String goal) { this.goal = goal; }

    public String getTeam() { return team; }

    public void setTeam(String team) { this.team = team; }

    public String getTextbook() { return textbook; }

    public void setTextbook(String textbook) { this.textbook = textbook; }
}
