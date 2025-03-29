/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Customer {
   String username,name,address,city,dob,mail,phone, image;
   boolean gender;
    public Customer() {
    }

    public Customer(String username, String name, String address, String city, String dob, String mail, String phone, boolean gender) {
        this.username = username;
        this.name = name;
        this.address = address;
        this.city = city;
        this.dob = dob;
        this.mail = mail;
        this.phone = phone;
        this.gender = gender;
    }

    public Customer(String username, String name, String address, String city, String dob, String mail, String phone, String image, boolean gender) {
        this.username = username;
        this.name = name;
        this.address = address;
        this.city = city;
        this.dob = dob;
        this.mail = mail;
        this.phone = phone;
        this.image = image;
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
    public String getDay(){
       String[] split = dob.split("-");
       return split[2].toString();
    }
    public String getMonth(){
         String[] split = dob.split("-");
       return split[1].toString();
    }
    public String getYear(){
          String[] split = dob.split("-");
       return split[0].toString();
    }

    @Override
    public String toString() {
        return "Customer{" + "username=" + username + ", name=" + name + ", address=" + address + ", city=" + city + ", dob=" + dob + ", mail=" + mail + ", phone=" + phone + ", gender=" + gender + '}';
    }

    
}
