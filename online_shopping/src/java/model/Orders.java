/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.AccountDAO;

public class Orders {
    int id;
    String customerID;
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
    public Orders() {
    }

    public Orders(int id, String customerID, int shipvia, String orderDate, String requiredDate, String shippedDate, float freight, String shipaddress, String shipCity, String postalCode, float total, float discount) {
        this.id = id;
        this.customerID = customerID;
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
    }
    
    public Orders(String customerID, int shipvia, String orderDate, String requiredDate, String shippedDate, float freight, String shipaddress, String shipCity, String postalCode, float total, float discount) {
        this.customerID = customerID;
        this.shipvia = shipvia;
        this.orderDate = orderDate;
        this.requiredDate = requiredDate;
        this.shippedDate = shippedDate;
        this.freight = freight;
        this.shipaddress = shipaddress;
        this.shipCity = shipCity;
    }

    public Orders(String customerID, int shipvia, String orderDate, String requiredDate, String shippedDate, float freight, String shipaddress, String postalCode, float total, float discount) {
        this.customerID = customerID;
        this.shipvia = shipvia;
        this.orderDate = orderDate;
        this.requiredDate = requiredDate;
        this.shippedDate = shippedDate;
        this.freight = freight;
        this.shipaddress = shipaddress;
        this.postalCode = postalCode;
        this.total = total;
        this.discount = discount;
    }
    
    public Orders(int id, String customerID, int shipvia, String orderDate, String requiredDate, String shippedDate, float freight, String shipaddress, String shipCity, String postalCode, float total) {
        this.id = id;
        this.customerID = customerID;
        this.shipvia = shipvia;
        this.orderDate = orderDate;
        this.requiredDate = requiredDate;
        this.shippedDate = shippedDate;
        this.freight = freight;
        this.shipaddress = shipaddress;
        this.shipCity = shipCity;
        this.postalCode = postalCode;
        this.total = total;
        this.discount=0;
    }
    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
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
    public Customer getCus(){
        AccountDAO ad=new AccountDAO();
        return ad.getCustomer(getCustomerID());
    }
    @Override
    public String toString() {
        return "Orders{" + "id=" + id + ", customerID=" + customerID + ", shipvia=" + shipvia + ", orderDate=" + orderDate + ", requiredDate=" + requiredDate + ", shippedDate=" + shippedDate + ", freight=" + freight + ", shipaddress=" + shipaddress + ", shipCity=" + shipCity + ", postalCode=" + postalCode + ", total=" + total + '}';
    }

       public static void main(String[] args) {
        
    }
        
            
    

  
    
}
