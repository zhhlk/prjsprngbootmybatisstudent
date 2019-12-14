package com.demo4.main;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan(basePackages = {"com.demo4.mapper"})
@ComponentScan(basePackages = {"com.demo4.biz","com.demo4.action"})
public class PrjsprngbootmybatisstudentApplication {

    public static void main(String[] args) {
        SpringApplication.run(PrjsprngbootmybatisstudentApplication.class, args);
    }

}
