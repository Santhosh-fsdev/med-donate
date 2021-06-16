package com.example.medicinedonate.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Request {
    
    public Request() {
    }
    @Override
    public String toString() {
        return "Request [address=" + address + ", category=" + category + ", date=" + date + ", id=" + id + ", name="
                + name + ", quantity=" + quantity + ", reqname=" + reqname + "]";
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    

    private String name;

    private String category;
    private Long quantity;
    public Request(String name, String category, Long quantity, String reqname, String address, Date date) {
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.reqname = reqname;
        this.address = address;
        this.date = date;
    }
    public Long getQuantity() {
        return quantity;
    }
    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }
    private String reqname;
    private String address;
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
    public String getReqname() {
        return reqname;
    }
    public void setReqname(String reqname) {
        this.reqname = reqname;
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
    private Date date;

}
