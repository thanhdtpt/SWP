package model;

public class OrderDetail {
    int id;
    int oid;
    int pid; // Giữ lại ProductID
    int quantity;
    boolean status;
    Product product; // Thêm đối tượng Product

    public OrderDetail() {
    }

    public OrderDetail(int id, int oid, int pid, int quantity, boolean status) {
        this.id = id;
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.status = status;
    }

    public OrderDetail(int id, int oid, int pid, Product product, int quantity, boolean status) {
        this.id = id;
        this.oid = oid;
        this.pid = pid; // Giữ lại ProductID
        this.product = product;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", oid=" + oid + ", pid=" + pid + ", product=" + product + ", quantity=" + quantity + ", status=" + status + '}';
    }
}
