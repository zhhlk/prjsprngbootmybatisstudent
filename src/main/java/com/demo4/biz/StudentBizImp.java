package com.demo4.biz;

import com.demo4.mapper.ClazzMapper;
import com.demo4.mapper.StudentMapper;
import com.demo4.po.Clazz;
import com.demo4.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class StudentBizImp implements StudentBiz {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClazzMapper clazzMapper;

    public StudentMapper getStudentMapper() {
        return studentMapper;
    }

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    public ClazzMapper getClazzMapper() {
        return clazzMapper;
    }

    public void setClazzMapper(ClazzMapper clazzMapper) {
        this.clazzMapper = clazzMapper;
    }

    @Override
    public int save(Student st) {
        return studentMapper.save(st);
    }

    @Override
    public int update(Student st) {
        return studentMapper.update(st);
    }

    @Override
    public int delById(Integer sid) {
        return studentMapper.delById(sid);
    }

    @Override
    public Student findById(Integer sid) {
        return studentMapper.findById(sid);
    }

    @Override
    public List<Student> findPageAll(int page, int rows) {
        if(page<1)page=1;
        if(rows<1)rows=5;
        Map<String,Object> map=new HashMap<>();
        map.put("page",page);
        map.put("rows",rows);

        return studentMapper.findPageAll(map);
    }

    @Override
    public int findMaxRow() {
        return studentMapper.findMaxRow();
    }

    @Override
    public List<Clazz> doinit() {
        return clazzMapper.findAll();
    }
}
