package com.demo4.action;

import com.demo4.po.Clazz;
import com.demo4.po.Student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface StudentAction {
    public int save(HttpServletRequest request, HttpServletResponse response, Student st);
    public int update(HttpServletRequest request, HttpServletResponse response, Student st);
    public int delById(HttpServletRequest request, HttpServletResponse response, Integer sid);
    public Student findById(HttpServletRequest request, HttpServletResponse response, Integer sid);
    public Map<String,Object> findPageAll(HttpServletRequest request, HttpServletResponse response, Integer page, Integer rows);
    public List<Clazz> doinit(HttpServletRequest request, HttpServletResponse response);
}
