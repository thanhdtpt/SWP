/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.AccountDAO;


public class Account {
      private String username,password,email, status;
       private Shop shop;
    private Customer customer;


    public Account() {
    }

    public Account(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Account(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }
    public Account(String username, String password, String email, String status) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getCusname(){
        AccountDAO ad=new AccountDAO();
          Customer customer = ad.getCustomer(username);
          return customer.getName();
    }
    public String getShopname(){
        AccountDAO ad=new AccountDAO();
          Shop shop = ad.getShop(username);
          return shop.getName();
    }
    // Thêm phương thức setShop()
    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Shop getShop() {
        return shop;
    }

    // Thêm phương thức setCustomer()
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Customer getCustomer() {
        return customer;
    }

    // Phương thức này có thể lấy tên của khách hàng hoặc cửa hàng
    public String getUserNameDisplay() {
        if (shop != null) {
            return shop.getName(); // Trả về tên shop nếu có
        } else if (customer != null) {
            return customer.getName(); // Trả về tên customer nếu có
        }
        return username; // Trả về username nếu không có shop hoặc customer
    }
    
}
