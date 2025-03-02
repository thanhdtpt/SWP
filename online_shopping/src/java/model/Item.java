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
public class Item {

    private int id;
    private Product product;
    private int quantity;
    private double price;
    private String userName;
    private boolean hasBeenPurchased;

    public Item() {
    }

    public Item(Product product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Item(Product product, int quantity, double price, String userName) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.userName = userName;
    }

    public Item(int id, Product product, int quantity, double price, String userName, boolean hasBeenPurchased) {
        this.id = id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.userName = userName;
        this.hasBeenPurchased = hasBeenPurchased;
    }
     public Item( Product product, int quantity, double price, String userName, boolean hasBeenPurchased) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.userName = userName;
        this.hasBeenPurchased = hasBeenPurchased;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean isHasBeenPurchased() {
        return hasBeenPurchased;
    }

    public void setHasBeenPurchased(boolean hasBeenPurchased) {
        this.hasBeenPurchased = hasBeenPurchased;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
