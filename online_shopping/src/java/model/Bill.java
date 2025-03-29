/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Bill {
    int id;
     int oid;
    int pid;
    int quantity;
    boolean status;
    String customerID;
    String shopname;
    int shipvia;
    String orderDate;
    String requiredDate;
    String shippedDate;
    float freight;
    String shipaddress;
    String shipCity;
    String postalCode;
    float total;
    float discount;
     private  String productname;
     private String origin;
     private String brand;
     private String images1;
     private  String describe;
     private  float oldPrice;
     private  float currentPrice;
     
    public Bill() {
    }

    public Bill(int id, int oid, int pid, int quantity, boolean status, String customerID, String shopname, int shipvia, String orderDate, String requiredDate, String shippedDate, float freight, String shipaddress, String shipCity, String postalCode, float total, float discount, String productname, String origin, String brand, String images1, String describe, float oldPrice, float currentPrice) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.status = status;
        this.customerID = customerID;
        this.shopname = shopname;
        this.shipvia = shipvia;
        this.orderDate = orderDate;
        this.requiredDate = requiredDate;
        this.shippedDate = shippedDate;
        this.freight = freight;
        this.shipaddress = shipaddress;
        this.shipCity = shipCity;
        this.postalCode = postalCode;
        this.total = total;
        this.discount = discount;
        this.productname = productname;
        this.origin = origin;
        this.brand = brand;
        this.images1 = images1;
        this.describe = describe;
        this.oldPrice = oldPrice;
        this.currentPrice = currentPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public int getShipvia() {
        return shipvia;
    }

    public void setShipvia(int shipvia) {
        this.shipvia = shipvia;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getRequiredDate() {
        return requiredDate;
    }

    public void setRequiredDate(String requiredDate) {
        this.requiredDate = requiredDate;
    }

    public String getShippedDate() {
        return shippedDate;
    }

    public void setShippedDate(String shippedDate) {
        this.shippedDate = shippedDate;
    }

    public float getFreight() {
        return freight;
    }

    public void setFreight(float freight) {
        this.freight = freight;
    }

    public String getShipaddress() {
        return shipaddress;
    }

    public void setShipaddress(String shipaddress) {
        this.shipaddress = shipaddress;
    }

    public String getShipCity() {
        return shipCity;
    }

    public void setShipCity(String shipCity) {
        this.shipCity = shipCity;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImages1() {
        return images1;
    }

    public void setImages1(String images1) {
        this.images1 = images1;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public float getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(float oldPrice) {
        this.oldPrice = oldPrice;
    }

    public float getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(float currentPrice) {
        this.currentPrice = currentPrice;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", oid=" + oid + ", pid=" + pid + ", quantity=" + quantity + ", status=" + status + ", customerID=" + customerID + ", shopname=" + shopname + ", shipvia=" + shipvia + ", orderDate=" + orderDate + ", requiredDate=" + requiredDate + ", shippedDate=" + shippedDate + ", freight=" + freight + ", shipaddress=" + shipaddress + ", shipCity=" + shipCity + ", postalCode=" + postalCode + ", total=" + total + ", discount=" + discount + ", productname=" + productname + ", origin=" + origin + ", brand=" + brand + ", images1=" + images1 + ", describe=" + describe + ", oldPrice=" + oldPrice + ", currentPrice=" + currentPrice + '}';
    }

  

   


    
}
