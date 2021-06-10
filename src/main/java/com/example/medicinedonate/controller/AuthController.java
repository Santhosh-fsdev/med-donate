package com.example.medicinedonate.controller;

import com.example.medicinedonate.entity.Medicine;
import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.MedicineRepository;
import com.example.medicinedonate.repository.UserRepository;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    MedicineRepository medicineRepository;

    @Autowired
    HttpSession session;

    

    @GetMapping("${server.contextroot}/")
    public String showLogin(Map<String, Object> model) {
        return "login";
    }

    @GetMapping(value = "${server.contextroot}/signup")
    public String showSignup(Map<String, Object> model) {
        return ("signup");
    }

    @PostMapping("${server.contextroot}/login")
    @ResponseBody
    public String login(@RequestBody User user) {
        User loginUser = userRepository.findByUserName(user.getUserName());
        if (loginUser == null) {
            return "User not found";
        } else {
            System.out.println("Loginuser" + loginUser.getUserName() + loginUser.getPassword());
            System.out.println("user" + user.getUserName() + user.getPassword());

            if (loginUser.getUserName().equals(user.getUserName())
                    && loginUser.getPassword().equals(user.getPassword())) {
                System.out.println("Login success");
                //Getting all medicine list
                List<Medicine> medicineList = medicineRepository.findAll();
                session.setAttribute("medicineList", medicineList);
                session.setAttribute("user", loginUser);
                
                
                return "success";
            } else {
                System.out.println("Login Failed");
                return "failure";
            }

        }

    }

    @PostMapping("${server.contextroot}/signup")
    @ResponseBody
    public String postLogin(@RequestBody User user) {
        System.out.println("inside signup serv;et");
        System.out.println(user.toString());
        userRepository.save(user);
        return "success";
    }

    @GetMapping("${server.contextroot}/findAllUsers")
    public void getUsers() {
        List<User> list = userRepository.findAll();
        System.out.println(list);
    }

    @GetMapping("${server.contextroot}/logout")
    public String logout(){
        session.removeAttribute("userobj");
		session.invalidate();
		return "redirect: ${server.contextroot}/";
    }

}
