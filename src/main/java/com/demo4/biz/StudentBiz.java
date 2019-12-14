package com.demo4.biz;

import com.demo4.po.Clazz;
import com.demo4.po.Student;

import java.util.List;
import java.util.Map;

public interface StudentBiz {
    public int save(Student st);
    public int update(Student st);
    public int delById(Integer sid);
    public Student findById(Integer sid);
    /**
     * 使用map集合封装分页所需要的数据page当前页数,rows每页记录数
     * */
    public List<Student> findPageAll(int page,int rows);
    public int findMaxRow();
    public List<Clazz> doinit();
}
