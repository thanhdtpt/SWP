/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author T.V.H
 */
public class AnalysisProduct {
    String productname;
    int year;
    
    int month;
    
    int day;
    
    int total;

    public AnalysisProduct() {
    }

    public AnalysisProduct(String productname, int year, int month, int day, int total) {
        this.productname = productname;
        this.year = year;
        this.month = month;
        this.day = day;
        this.total = total;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "AnalysisProduct{" + "productname=" + productname + ", year=" + year + ", month=" + month + ", day=" + day + ", total=" + total + '}';
    }

    
    
}
