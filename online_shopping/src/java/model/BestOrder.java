/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class BestOrder {
    String customername;
    int quantity;
    String productname;
    float total;
    String images;
    
    public BestOrder() {
    }

    public BestOrder(String customername, int quantity, String productname, float total, String images) {
        this.customername = customername;
        this.quantity = quantity;
        this.productname = productname;
        this.total = total;
        this.images = images;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "BestOrder{" + "customername=" + customername + ", quantity=" + quantity + ", productname=" + productname + ", total=" + total + ", images=" + images + '}';
    }

   
  

   
    
}
