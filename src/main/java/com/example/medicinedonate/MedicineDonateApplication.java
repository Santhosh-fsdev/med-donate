package com.example.medicinedonate;

import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MedicineDonateApplication {

    @Autowired
    UserRepository userRepository;

	public static void main(String[] args) {
		
		SpringApplication.run(MedicineDonateApplication.class, args);
	}



}
