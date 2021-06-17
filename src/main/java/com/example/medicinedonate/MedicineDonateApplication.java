package com.example.medicinedonate;

import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MedicineDonateApplication {


	public static void main(String[] args) {
		String context = "";
		for(String arg:args) {
			if(arg.contains("contextroot")){
				String array[] =  arg.split("=",2);
				context = array[1];
			}
      }
		
		System.setProperty("server.servlet.context-path", context);
		SpringApplication.run(MedicineDonateApplication.class, args);
	}



}
