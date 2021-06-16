package com.example.medicinedonate.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultStyledDocument.ElementSpec;

import com.example.medicinedonate.entity.Donate;
import com.example.medicinedonate.entity.Medicine;
import com.example.medicinedonate.entity.Request;
import com.example.medicinedonate.entity.User;
import com.example.medicinedonate.repository.DonateRepository;
import com.example.medicinedonate.repository.MedicineRepository;
import com.example.medicinedonate.repository.RequestRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
    RequestRepository requestRepository;

    @Autowired
    DonateRepository donateRepository;

    @Autowired
    HttpSession session;

    @GetMapping(value = "/adminhome")
    public String admin(Model model) {
        User user = (User) session.getAttribute("user");
        if (user.getUserName().equals("Admin") && user.getPassword().equals("Admin@123")) {
            return "admin";
        } else {
            return "redirect:/userhome";
        }

    }

    @GetMapping("/userhome")
    public String userHome() {
        User user = (User) session.getAttribute("user");
        List<Request> requestList = requestRepository.findAll();

        List<Request> filterList = new ArrayList<Request>();

        for (int i = 0; i < requestList.size(); i++) {
            if (requestList.get(i).getReqname().equals(user.getUserName())) {
                filterList.add(requestList.get(i));
            }
        }
        session.setAttribute("medicineList", filterList);
        System.out.println(filterList);
        return "user";
    }

    @GetMapping("/userViewDonateMedicine")
    public String getUserDonate() {
        User user = (User) session.getAttribute("user");
        List<Donate> list = donateRepository.findAll();
        List<Donate> donate = new ArrayList<Donate>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getDonorname().equals(user.getUserName())) {
                donate.add(list.get(i));
            }
        }

        session.setAttribute("donateList", list);
        return "alldonate";
    }

    @GetMapping("/userRequestMedicine")
    public String requestMedicine() {
        return "requestmedicine";
    }

    @PostMapping("/userRequestMedicine")
    public String addUserRequestMedicine(@RequestParam Map<String, String> body) {
        User user = (User) session.getAttribute("user");
        Long Quantity = (long) 0;
        Quantity = Long.parseLong(body.get("quantity"));
        String medName = body.get("medName");
        String medCategory = body.get("medCategory");
        String reqname = user.getUserName();
        String address = user.getAddress();
        Date date = new Date();
        Request request = new Request(medName, medCategory, Quantity, reqname, address, date);
        requestRepository.save(request);


        return "redirect:/userhome";

    }

    @PostMapping(value = "/addMedicine")
    public String addMedicine(@RequestParam Map<String, String> body) {
        Long Quantity = (long) 0;
        Quantity = Long.parseLong(body.get("medicineQuantity"));

        Medicine medicine = new Medicine(body.get("medicineName"), body.get("medicineCategory"), Quantity);
        medicineRepository.save(medicine);
        List<Medicine> medicineList = medicineRepository.findAll();
        session.setAttribute("medicineList", medicineList);
        return "redirect:/adminhome";
    }

    @GetMapping(value = "/deleteMedicine")
    public String deleteMedicine(@RequestParam Long Id) {
        System.out.println(Id);
        medicineRepository.deleteById(Id);

        List<Medicine> medicineList = medicineRepository.findAll();
        session.setAttribute("medicineList", medicineList);

        return "redirect:/adminhome";
    }
}
