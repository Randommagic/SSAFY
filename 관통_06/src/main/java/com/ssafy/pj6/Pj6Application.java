package com.ssafy.pj6;

import com.ssafy.pj6.interceptor.ConfirmInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@SpringBootApplication
@EnableSwagger2
@MapperScan(basePackages = {"com.ssafy.pj6.*.model.repo"})
public class Pj6Application implements WebMvcConfigurer {


    @Autowired
    ConfirmInterceptor confirmInterCeptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(confirmInterCeptor).addPathPatterns("/user/update");
    }

    public static void main(String[] args) {
        SpringApplication.run(Pj6Application.class, args);
    }

}
