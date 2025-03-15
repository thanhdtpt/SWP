package model;

import java.sql.Timestamp;

public class Feedback {
    private int id;
    private int productId;
    private String userName;
    private int rating;
    private String description;
    private Timestamp createdDate;

    // Constructor mặc định
    public Feedback() {}

    // Constructor đầy đủ
    public Feedback(int id, int productId, String userName, int rating, String description, Timestamp createdDate) {
        this.id = id;
        this.productId = productId;
        this.userName = userName;
        this.rating = rating;
        this.description = description;
        this.createdDate = createdDate;
    }

    // Constructor không có ID và ngày tạo (dùng khi thêm mới feedback)
    public Feedback(int productId, String userName, int rating, String description) {
        this.productId = productId;
        this.userName = userName;
        this.rating = rating;
        this.description = description;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        if (rating < 1 || rating > 5) {
            throw new IllegalArgumentException("Rating phải từ 1 đến 5");
        }
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", productId=" + productId +
                ", userName='" + userName + '\'' +
                ", rating=" + rating +
                ", description='" + description + '\'' +
                ", createdDate=" + createdDate +
                '}';
    }
}
