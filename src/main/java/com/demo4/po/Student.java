package com.demo4.po;

import java.io.Serializable;

public class Student implements Serializable {
    private Integer sid;
    private String sname;
    private String sex;
    private String address;
    private String birthday;
    private String classid;
    private String cname;

    public Student() {
    }

    public Student(Integer sid, String sname, String sex, String address, String birthday, String classid, String cname) {
        this.sid = sid;
        this.sname = sname;
        this.sex = sex;
        this.address = address;
        this.birthday = birthday;
        this.classid = classid;
        this.cname = cname;
    }

    public Student(String sname, String sex, String address, String birthday, String classid) {
        this.sname = sname;
        this.sex = sex;
        this.address = address;
        this.birthday = birthday;
        this.classid = classid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
