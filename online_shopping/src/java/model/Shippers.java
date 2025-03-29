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
public class Shippers {
    int id;
    int companyID;
    String name;
    String dob;
    String city;
    String address;
    String postalCode;
    String phone;

    public Shippers(int id, int companyID, String name, String dob, String city, String address, String postalCode, String phone) {
        this.id = id;
        this.companyID = companyID;
        this.name = name;
        this.dob = dob;
        this.city = city;
        this.address = address;
        this.postalCode = postalCode;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
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

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Shippers{" + "id=" + id + ", companyID=" + companyID + ", name=" + name + ", dob=" + dob + ", city=" + city + ", address=" + address + ", postalCode=" + postalCode + ", phone=" + phone + '}';
    }
    
    
}
