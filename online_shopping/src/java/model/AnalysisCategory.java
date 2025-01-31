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
public class AnalysisCategory {
    String name;
    int quantity;
    int year;
    int month;
    int day;

    public AnalysisCategory(String name, int quantity, int year, int month, int day) {
        this.name = name;
        this.quantity = quantity;
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public AnalysisCategory() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    @Override
    public String toString() {
        return "AnalysisCategory{" + "name=" + name + ", quantity=" + quantity + ", year=" + year + ", month=" + month + ", day=" + day + '}';
    }
    
}
