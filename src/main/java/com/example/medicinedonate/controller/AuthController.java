package com.example.medicinedonate.controller;

import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class AuthController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/")
    public String showLogin(Map<String, Object> model){
        return "login";
    }

    @GetMapping(value = "/signup")
    public String showSignup(Map<String, Object> model){
        return ("signup");
    }

    @PostMapping("/login")
    public String login( @RequestBody User user){
        User loginUser = userRepository.findByUserName(user.getUserName());
        if(loginUser == null){
            return "User not found";
        }
        else{
            System.out.println("Loginuser" + loginUser.getUserName() + loginUser.getPassword());
            System.out.println("user" + user.getUserName() + user.getPassword());

            if(loginUser.getUserName().equals(user.getUserName()) && loginUser.getPassword().equals(user.getPassword())){
                System.out.println("Login success");
                return "Login success";
            }
            else{
                System.out.println("Login Failed");
                return "login";
            }

        }

    }

    @PostMapping("/signup")
    public String postLogin(@RequestBody User user){
        System.out.println("inside signup serv;et");
        System.out.println(user.toString());
        userRepository.save(user);
        return "";
    }

    @GetMapping("/findAllUsers")
    public void getUsers(){
        List<User> list = userRepository.findAll();
        System.out.println(list);
    }
}
