package com.example.medicinedonate.repository;

import com.example.medicinedonate.entity.Donate;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DonateRepository  extends JpaRepository<Donate, Long>{
    
    Donate getDonateByName(String name);
}
