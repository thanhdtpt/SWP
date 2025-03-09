package model;

import java.sql.Timestamp;

public class WalletTransaction {
    private int walletID;
    private String description;
    private float amount;
    private Timestamp transactionDate;

    public WalletTransaction() {
    }

    public WalletTransaction(int walletID, String description, float amount, Timestamp transactionDate) {
        this.walletID = walletID;
        this.description = description;
        this.amount = amount;
        this.transactionDate = transactionDate;
    }

    public int getWalletID() {
        return walletID;
    }

    public void setWalletID(int walletID) {
        this.walletID = walletID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Timestamp getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Timestamp transactionDate) {
        this.transactionDate = transactionDate;
    }

    @Override
    public String toString() {
        return "WalletTransaction{" +
                "walletID=" + walletID +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", transactionDate=" + transactionDate +
                '}';
    }
}
