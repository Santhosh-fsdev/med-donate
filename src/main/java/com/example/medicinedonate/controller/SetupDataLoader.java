package com.example.medicinedonate.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;

import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;



@Component
public class SetupDataLoader implements
        ApplicationListener<ContextRefreshedEvent> {

    boolean alreadySetup = false;

    @Autowired
    private UserRepository userRepository;




    @Override
    @Transactional
    public void onApplicationEvent(ContextRefreshedEvent event) {

        
        if (alreadySetup)
            return;

        User user1 = userRepository.findByUserName("Admin");
        if(user1 != null){
            return;
        }
        else{
            User user = new User("Admin", "Admin@123", 12, "male", "Admin Address");
            userRepository.save(user);
        }



        alreadySetup = true;
    }
}