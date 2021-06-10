package com.example.medicinedonate.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.example.medicinedonate.entity.Donate;
import com.example.medicinedonate.repository.DonateRepository;
import com.example.medicinedonate.repository.MedicineRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.solr.SolrProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MedicineController {

    @Autowired
    private DonateRepository donateRepository;

    @Autowired
    HttpSession session;
    
    
    @GetMapping("${server.contextroot}/donate")
    public String getAll(){
        List<Donate> list = donateRepository.findAll();
        System.out.println(list);
        session.setAttribute("donateList", list);
        return "alldonate";
    }

    @PostMapping("${server.contextroot}/addDonate")
    public String addMedicine(@RequestParam Map<String, String> body){
        // Donate medicine = new Donate( body.get("medicineCategory"), body.get("medicineName"),body.get("medicineQuantity"), body.get("donorname"), body.get("address"),body.get("date"));
        // medicineRepository.save(medicine);
        // List<Medicine> medicineList = medicineRepository.findAll();
        // session.setAttribute("medicineList", medicineList);
        // return "redirect:admin";
        System.out.println(body);
        return "";
    }

}
