package com.example.medicinedonate.repository;

import java.util.List;

import com.example.medicinedonate.entity.Request;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RequestRepository extends JpaRepository<Request, Long>{
    
}
