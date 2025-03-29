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
public class Discount {
    String id;
    float value;

    public Discount() {
    }

    public Discount(String id, float value) {
        this.id = id;
        this.value = value;
    }

    @Override
    public String toString() {
        return "Discount{" + "id=" + id + ", value=" + value + '}';
    }
    
}
