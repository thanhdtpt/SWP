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
public class OrderDetail {
    int id;
    int oid;
    int pid;
    int quantity;
    boolean status;
    
    public OrderDetail() {
    }

    public OrderDetail(int oid, int pid, int quantity, boolean status) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.status = status;
    }
    
    public OrderDetail(int id, int oid, int pid, int quantity, boolean status) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.status = status;
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

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", oid=" + oid + ", pid=" + pid + ", quantity=" + quantity + ", status=" + status + '}';
    }
    
   
   

}
