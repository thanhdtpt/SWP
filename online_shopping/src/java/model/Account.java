/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.AccountDAO;


public class Account {
      private String username,password,email;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
