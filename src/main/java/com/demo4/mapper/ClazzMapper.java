package com.demo4.mapper;
import com.demo4.po.*;
import org.apache.ibatis.annotations.Mapper;

import  java.util.*;
@Mapper
public interface ClazzMapper {
    public List<Clazz> findAll();
}
