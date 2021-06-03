package com.example.medicinedonate.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="medicine")
public class Medicine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    public Medicine(String name, String category, Long quantity) {
        this.name = name;
        this.category = category;
        this.quantity = quantity;
    }

    private String name;

    @Override
    public String toString() {
        return "Medicine [category=" + category + ", id=" + id + ", name=" + name + ", quantity=" + quantity + "]";
    }

    public Medicine() {
    }

    private String category;
    private Long quantity;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

}
