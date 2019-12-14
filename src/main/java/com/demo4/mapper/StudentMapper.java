package com.demo4.mapper;
import com.demo4.po.*;
import org.apache.ibatis.annotations.Mapper;

import  java.util.*;
@Mapper
public interface StudentMapper {
    public int save(Student st);
    public int update(Student st);
    public int delById(Integer sid);
    public Student findById(Integer sid);
    /**
     * 使用map集合封装分页所需要的数据page当前页数,rows每页记录数
     * */
    public List<Student> findPageAll(Map<String,Object> map);
    public int findMaxRow();

}
