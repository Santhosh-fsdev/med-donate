package com.example.medicinedonate.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Donate {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Override
    public String toString() {
        return "Donate [address=" + address + ", category=" + category + ", date=" + date + ", donorname=" + donorname
                + ", id=" + id + ", name=" + name + ", quantity=" + quantity + "]";
    }
    public Donate(long id, String category, String name, String quantity, String donorname, String address, Date date) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.quantity = quantity;
        this.donorname = donorname;
        this.address = address;
        this.date = date;
    }
    public Donate(String category, String name, String quantity, String donorname, String address, Date date) {
        this.category = category;
        this.name = name;
        this.quantity = quantity;
        this.donorname = donorname;
        this.address = address;
        this.date = date;
    }
    private String category;
    private String name;
    public Donate() {
    }
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getQuantity() {
        return quantity;
    }
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    public String getDonorname() {
        return donorname;
    }
    public void setDonorname(String donorname) {
        this.donorname = donorname;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    private String quantity;
    private String donorname;
    private String address;
    private Date date;

    
}
