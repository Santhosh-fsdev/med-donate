package com.example.medicinedonate.repository;

import com.example.medicinedonate.entity.Medicine;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicineRepository extends JpaRepository<Medicine,Long>{
    Medicine getMedicineByName(String name);
    
}
