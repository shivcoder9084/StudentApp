package com.app2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class StudentAppApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(StudentAppApplication.class, args);
	}

}
