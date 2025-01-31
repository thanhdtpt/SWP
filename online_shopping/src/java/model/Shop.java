/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author win
 */
public class Shop {
    private String username;
    private String name;
    private String city;
    private String address;
    private String phone;
    public Shop() {
    }

    public Shop(String username, String name, String city, String address, String phone) {
        this.username = username;
        this.name = name;
        this.city = city;
        this.address = address;
        this.phone = phone;
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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Shop{" + "username=" + username + ", name=" + name + ", city=" + city + ", address=" + address + ", phone=" + phone + '}';
    }

   
    
    
}
