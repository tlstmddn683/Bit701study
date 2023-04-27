package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("mycar.*")
@EntityScan("mycar.data")
@EnableJpaRepositories("mycar.data")

public class BootJpaEx2Application {

	public static void main(String[] args) {
		SpringApplication.run(BootJpaEx2Application.class, args);
	}

}
