package com.ishmam.JenkinsTest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;

@SpringBootApplication
public class JenkinsTestApplication {

	@PostConstruct
	public void test(){
		throw new RuntimeException("Don't merge please!");
	}

	public static void main(String[] args) {
		SpringApplication.run(JenkinsTestApplication.class, args);
	}

}
