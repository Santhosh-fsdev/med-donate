package com.example.medicinedonate.controller;

import com.example.medicinedonate.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class AuthController {

    @RequestMapping(value = "/")
    public String showLogin(Map<String, Object> model){
        return "login";
    }

    @RequestMapping(value = "/signup")
    public String showSignup(Map<String, Object> model){
        return ("signup");
    }

    @PostMapping("/login")
    public String login(Map<String, Object> model, @RequestBody User user){
        System.out.println("inside login"+user.toString());
        return "login";
    }
}
