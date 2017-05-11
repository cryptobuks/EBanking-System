/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.dataobject;

import java.util.Date;



public class Transaction {
    private String accountNumber;
    private long transactionId;
    private String transactionType;
    private Date transactionDate;
    private String transactionDescription;
    private String chequeNumber;
    private float transactionAmount;
    private float withdrawalAmount;//used for display purpose only
    private float depositedAmount;//used for display purpose only
    private float balance;//calculated on the fly

    public Transaction() {
    }

    public Transaction(String accountNumber, long transactionId, String transactionType, Date transactionDate, String transactionDescription, String chequeNumber, float transactionAmount, float withdrawalAmount, float depositedAmount, float balance) {
        this.accountNumber = accountNumber;
        this.transactionId = transactionId;
        this.transactionType = transactionType;
        this.transactionDate = transactionDate;
        this.transactionDescription = transactionDescription;
        this.chequeNumber = chequeNumber;
        this.transactionAmount = transactionAmount;
        this.withdrawalAmount = withdrawalAmount;
        this.depositedAmount = depositedAmount;
        this.balance = balance;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public String getChequeNumber() {
        return chequeNumber;
    }

    public void setChequeNumber(String chequeNumber) {
        this.chequeNumber = chequeNumber;
    }

    public float getDepositedAmount() {
        return depositedAmount;
    }

    public void setDepositedAmount(float depositedAmount) {
        this.depositedAmount = depositedAmount;
    }

    public float getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(float transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getTransactionDescription() {
        return transactionDescription;
    }

    public void setTransactionDescription(String transactionDescription) {
        this.transactionDescription = transactionDescription;
    }

    public long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(long transactionId) {
        this.transactionId = transactionId;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public float getWithdrawalAmount() {
        return withdrawalAmount;
    }

    public void setWithdrawalAmount(float withdrawalAmount) {
        this.withdrawalAmount = withdrawalAmount;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Transaction other = (Transaction) obj;
        if ((this.accountNumber == null) ? (other.accountNumber != null) : !this.accountNumber.equals(other.accountNumber)) {
            return false;
        }
        if (this.transactionId != other.transactionId) {
            return false;
        }
        if ((this.transactionType == null) ? (other.transactionType != null) : !this.transactionType.equals(other.transactionType)) {
            return false;
        }
        if (this.transactionDate != other.transactionDate && (this.transactionDate == null || !this.transactionDate.equals(other.transactionDate))) {
            return false;
        }
        if ((this.transactionDescription == null) ? (other.transactionDescription != null) : !this.transactionDescription.equals(other.transactionDescription)) {
            return false;
        }
        if ((this.chequeNumber == null) ? (other.chequeNumber != null) : !this.chequeNumber.equals(other.chequeNumber)) {
            return false;
        }
        if (Float.floatToIntBits(this.transactionAmount) != Float.floatToIntBits(other.transactionAmount)) {
            return false;
        }
        if (Float.floatToIntBits(this.withdrawalAmount) != Float.floatToIntBits(other.withdrawalAmount)) {
            return false;
        }
        if (Float.floatToIntBits(this.depositedAmount) != Float.floatToIntBits(other.depositedAmount)) {
            return false;
        }
        if (Float.floatToIntBits(this.balance) != Float.floatToIntBits(other.balance)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 11 * hash + (this.accountNumber != null ? this.accountNumber.hashCode() : 0);
        hash = 13 * hash + (int) (this.transactionId ^ (this.transactionId >>> 32));
        hash = 17 * hash + (this.transactionType != null ? this.transactionType.hashCode() : 0);
        hash = 19 * hash + (this.transactionDate != null ? this.transactionDate.hashCode() : 0);
        hash = 23 * hash + (this.transactionDescription != null ? this.transactionDescription.hashCode() : 0);
        hash = 29 * hash + (this.chequeNumber != null ? this.chequeNumber.hashCode() : 0);
        hash = 31 * hash + Float.floatToIntBits(this.transactionAmount);
        hash = 37 * hash + Float.floatToIntBits(this.withdrawalAmount);
        hash = 41 * hash + Float.floatToIntBits(this.depositedAmount);
        hash = 47 * hash + Float.floatToIntBits(this.balance);
        return hash;
    }

    @Override
    public String toString() {
        return "Transaction{" + "accountNumber=" + accountNumber + "transactionId=" + transactionId + "transactionType=" + transactionType + "transactionDate=" + transactionDate + "transactionDescription=" + transactionDescription + "chequeNumber=" + chequeNumber + "transactionAmount=" + transactionAmount + "withdrawalAmount=" + withdrawalAmount + "depositedAmount=" + depositedAmount + "balance=" + balance + '}';
    }


    
    
}
