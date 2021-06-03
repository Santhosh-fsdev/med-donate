package com.example.medicinedonate.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultStyledDocument.ElementSpec;

import com.example.medicinedonate.entity.Medicine;
import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.MedicineRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    @Autowired
    MedicineRepository medicineRepository;
    
    @Autowired
    HttpSession session;


    @GetMapping("/admin")
    public String admin(Model model){
        User user = (User) session.getAttribute("user");
        if(user.getUserName().equals("admin") && user.getPassword().equals("Admin@123")){
            return "admin";
        }
        else{
            return "user";
        }
        
    }
    
    @PostMapping("/addMedicine")
    public String addMedicine(@RequestParam Map<String, String> body){
        Long Quantity = (long) 0;
        Quantity = Long.parseLong(body.get("medicineQuantity"));

        Medicine medicine = new Medicine(body.get("medicineName"), body.get("medicineCategory"),Quantity);
        medicineRepository.save(medicine);
        List<Medicine> medicineList = medicineRepository.findAll();
        session.setAttribute("medicineList", medicineList);
        return "redirect:admin";
    }
    @GetMapping("/deleteMedicine")
    public String deleteMedicine(@RequestParam Long Id) {
    	System.out.println(Id);
    	medicineRepository.deleteById(Id);
    	
        List<Medicine> medicineList = medicineRepository.findAll();
        session.setAttribute("medicineList", medicineList);
        
    	return "redirect:admin";
    }
}
