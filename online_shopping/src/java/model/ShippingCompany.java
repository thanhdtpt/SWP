/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author win
 */
public class ShippingCompany {
    int id;
    String name;
    String phone;
    String avatar;
    List<Shippers> shipers;
    public ShippingCompany() {
    }

    public ShippingCompany(int id, String name, String phone, String avatar, List<Shippers> shipers) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.avatar = avatar;
        this.shipers = shipers;
    }
    
    public ShippingCompany(int id, String name, String phone, String avatar) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public List<Shippers> getShipers() {
        return shipers;
    }

    public void setShipers(List<Shippers> shipers) {
        this.shipers = shipers;
    }

    @Override
    public String toString() {
        return "ShippingCompany{" + "id=" + id + ", name=" + name + ", phone=" + phone + ", avatar=" + avatar + ", shipers=" + shipers + '}';
    }
    
   
    
    
    
}
