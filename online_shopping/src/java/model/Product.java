/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author win
 */
public class Product {

    private int id;
    private Shop shops;
    private Categories categories;
    private String productname;
    private String origin;
    private String brand;
    private String images1;
    private String describe;
    private float oldPrice;
    private float currentPrice;
    private int quantityPerUnit;
    private int unitInstock;
    private int unitOnOrder;
    private boolean isContinued;
    private String status;
    private String createdDate;
    private String updatedDate;

    public Product() {
    }

    public Product(int id, Shop shops, Categories categories, String productname, String origin, String brand, String images1, String describe, float oldPrice, float currentPrice, int quantityPerUnit, int unitInstock, int unitOnOrder, boolean isContinued) {
        this.id = id;
        this.shops = shops;
        this.categories = categories;
        this.productname = productname;
        this.origin = origin;
        this.brand = brand;
        this.images1 = images1;
        this.describe = describe;
        this.oldPrice = oldPrice;
        this.currentPrice = currentPrice;
        this.quantityPerUnit = quantityPerUnit;
        this.unitInstock = unitInstock;
        this.unitOnOrder = unitOnOrder;
        this.isContinued = isContinued;
    }
    
    public Product(int id, Shop shops, Categories categories, String productname, String origin, String brand, String images1, String describe, float oldPrice, float currentPrice, int quantityPerUnit, int unitInstock, int unitOnOrder, boolean isContinued, String status, String createdDate, String updatedDate) {
        this.id = id;
        this.shops = shops;
        this.categories = categories;
        this.productname = productname;
        this.origin = origin;
        this.brand = brand;
        this.images1 = images1;
        this.describe = describe;
        this.oldPrice = oldPrice;
        this.currentPrice = currentPrice;
        this.quantityPerUnit = quantityPerUnit;
        this.unitInstock = unitInstock;
        this.unitOnOrder = unitOnOrder;
        this.isContinued = isContinued;
        this.status = status;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public Product(int id, Shop shops, Categories categories, String productname, String origin, String brand, String images1, String describe, float oldPrice, float currentPrice, int quantityPerUnit, int unitInstock, int unitOnOrder, boolean isContinued,
            String status) {
        this.id = id;
        this.shops = shops;
        this.categories = categories;
        this.productname = productname;
        this.origin = origin;
        this.brand = brand;
        this.images1 = images1;
        this.describe = describe;
        this.oldPrice = oldPrice;
        this.currentPrice = currentPrice;
        this.quantityPerUnit = quantityPerUnit;
        this.unitInstock = unitInstock;
        this.unitOnOrder = unitOnOrder;
        this.isContinued = isContinued;
        this.status = status;
    }

    public Product(Shop shops, Categories categories, String productname, String origin, String brand, String images1, String describe, float oldPrice, float currentPrice, int quantityPerUnit, int unitInstock, int unitOnOrder, boolean isContinued) {
        this.shops = shops;
        this.categories = categories;
        this.productname = productname;
        this.origin = origin;
        this.brand = brand;
        this.images1 = images1;
        this.describe = describe;
        this.oldPrice = oldPrice;
        this.currentPrice = currentPrice;
        this.quantityPerUnit = quantityPerUnit;
        this.unitInstock = unitInstock;
        this.unitOnOrder = unitOnOrder;
        this.isContinued = isContinued;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Shop getShops() {
        return shops;
    }

    public void setShops(Shop shops) {
        this.shops = shops;
    }

    public Categories getCategories() {
        return categories;
    }

    public void setCategories(Categories categories) {
        this.categories = categories;
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
    
        public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public float getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(float currentPrice) {
        this.currentPrice = currentPrice;
    }

    public int getQuantityPerUnit() {
        return quantityPerUnit;
    }

    public void setQuantityPerUnit(int quantityPerUnit) {
        this.quantityPerUnit = quantityPerUnit;
    }

    public int getUnitInstock() {
        return unitInstock;
    }

    public void setUnitInstock(int unitInstock) {
        this.unitInstock = unitInstock;
    }

    public int getUnitOnOrder() {
        return unitOnOrder;
    }

    public void setUnitOnOrder(int unitOnOrder) {
        this.unitOnOrder = unitOnOrder;
    }

    public boolean isIsContinued() {
        return isContinued;
    }

    public void setIsContinued(boolean isContinued) {
        this.isContinued = isContinued;
    }

    public float getDiscount() {
        if (oldPrice == currentPrice) {
            return 0;
        }
        float discount = 100 - 100 * (currentPrice / oldPrice);
        discount = (Math.round((discount * 100) / 100));
        return discount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
               "id=" + id +
               ", shops=" + shops +
               ", categories=" + categories +
               ", productname='" + productname + '\'' +
               ", origin='" + origin + '\'' +
               ", brand='" + brand + '\'' +
               ", images1='" + images1 + '\'' +
               ", describe='" + describe + '\'' +
               ", oldPrice=" + oldPrice +
               ", currentPrice=" + currentPrice +
               ", quantityPerUnit=" + quantityPerUnit +
               ", unitInstock=" + unitInstock +
               ", unitOnOrder=" + unitOnOrder +
               ", isContinued=" + isContinued +
               ", status='" + status + '\'' +
               ", createdDate='" + createdDate + '\'' +  // Added createdDate to toString
               ", updatedDate='" + updatedDate + '\'' +  // Added updatedDate to toString
               '}';
    }

}
