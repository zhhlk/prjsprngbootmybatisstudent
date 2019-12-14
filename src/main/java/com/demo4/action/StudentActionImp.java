package com.demo4.action;

import com.demo4.biz.StudentBiz;
import com.demo4.po.Clazz;
import com.demo4.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@RestController
public class StudentActionImp implements StudentAction {
    @Autowired
    private StudentBiz studentBiz;

    public StudentBiz getStudentBiz() {
        return studentBiz;
    }

    public void setStudentBiz(StudentBiz studentBiz) {
        this.studentBiz = studentBiz;
    }

    @Override
    @RequestMapping(value = "save_Student.do")
    public int save(HttpServletRequest request, HttpServletResponse response, Student st) {
        int code = studentBiz.save(st);
        if(code>0){
            return 1;//1表示执行成功
        }
        return 0;//表示执行失败
    }

    @Override
    @RequestMapping(value = "update_Student.do")
    public int update(HttpServletRequest request, HttpServletResponse response, Student st) {
        int code = studentBiz.update(st);
        if(code>0){
            return 1;//1表示执行成功
        }
        return 0;//表示执行失败
    }

    @Override
    @RequestMapping(value = "delById_Student.do")
    public int delById(HttpServletRequest request, HttpServletResponse response, Integer sid) {
        int code = studentBiz.delById(sid);
        if(code>0){
            return 1;//1表示执行成功
        }
        return 0;//表示执行失败
    }

    @Override
    @RequestMapping(value = "findById_Student.do")
    public Student findById(HttpServletRequest request, HttpServletResponse response, Integer sid) {
        return studentBiz.findById(sid);
    }

    @Override
    @RequestMapping(value = "findPageAll_Student.do")
    public Map<String, Object> findPageAll(HttpServletRequest request, HttpServletResponse response, Integer page, Integer rows) {
        page=page==null||page<1?1:page;
        rows=rows==null||rows<1?5:rows;

        //获取总记录数
        int maxrow=studentBiz.findMaxRow();
        int maxpage=1;//总页数
        System.out.println("hello");
        if(rows>20)rows=20;//限制当前页呈现的记录数不能超过20条
        if(maxrow>0){
            maxpage=maxrow%rows==0?maxrow/rows:maxrow/rows+1;
        }
        //获取每页记录的集合
        List<Student> lsst=studentBiz.findPageAll(page,rows);

        Map<String,Object> map=new HashMap<>();
        map.put("page",page);
        map.put("rows",rows);
        map.put("maxpage",maxpage);
        map.put("lsst",lsst);
        return map;
    }

    @Override
    @RequestMapping(value = "doinit_Student.do")
    public List<Clazz> doinit(HttpServletRequest request, HttpServletResponse response) {
        List<Clazz> lsca=studentBiz.doinit();
        return lsca;
    }
}
