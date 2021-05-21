package com.example.medicinedonate.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String userName;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public User(String userName, String password, int age, String gender, String address) {
		this.userName = userName;
		this.password = password;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}
	//for login purpose
	public User(String userName, String password){
		this.userName = userName;
		this.password = password;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User() {
	}

	private String password;
	private int age;

	@Override
	public String toString() {
		return "User [address=" + address + ", age=" + age + ", gender=" + gender + ", id=" + id + ", password="
				+ password + ", userName=" + userName + "]";
	}

	private String gender;
	private String address;

}
