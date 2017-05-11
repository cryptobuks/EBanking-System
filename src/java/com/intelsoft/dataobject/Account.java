/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.dataobject;

import java.util.Date;


public class Account {
    private String accountNumber;
    private String customerId;
    private String typeOfAccount;
    private Date openingDate;
    private Date closingDate;
    boolean isSuspended;
    private float balance;

    public Account(String accountNumber, String customerId, String typeOfAccount, Date openingDate, Date closingDate, boolean isSuspended, float balance) {
        this.accountNumber = accountNumber;
        this.customerId = customerId;
        this.typeOfAccount = typeOfAccount;
        this.openingDate = openingDate;
        this.closingDate = closingDate;
        this.isSuspended = isSuspended;
        this.balance = balance;
    }

    public Account() {
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

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public boolean isIsSuspended() {
        return isSuspended;
    }

    public void setIsSuspended(boolean isSuspended) {
        this.isSuspended = isSuspended;
    }

    public Date getOpeningDate() {
        return openingDate;
    }

    public void setOpeningDate(Date openingDate) {
        this.openingDate = openingDate;
    }

    public String getTypeOfAccount() {
        return typeOfAccount;
    }

    public void setTypeOfAccount(String typeOfAccount) {
        this.typeOfAccount = typeOfAccount;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Account other = (Account) obj;
        if ((this.accountNumber == null) ? (other.accountNumber != null) : !this.accountNumber.equals(other.accountNumber)) {
            return false;
        }
        if ((this.customerId == null) ? (other.customerId != null) : !this.customerId.equals(other.customerId)) {
            return false;
        }
        if ((this.typeOfAccount == null) ? (other.typeOfAccount != null) : !this.typeOfAccount.equals(other.typeOfAccount)) {
            return false;
        }
        if (this.openingDate != other.openingDate && (this.openingDate == null || !this.openingDate.equals(other.openingDate))) {
            return false;
        }
        if (this.closingDate != other.closingDate && (this.closingDate == null || !this.closingDate.equals(other.closingDate))) {
            return false;
        }
        if (this.isSuspended != other.isSuspended) {
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
        hash = 29 * hash + (this.accountNumber != null ? this.accountNumber.hashCode() : 0);
        hash = 29 * hash + (this.customerId != null ? this.customerId.hashCode() : 0);
        hash = 29 * hash + (this.typeOfAccount != null ? this.typeOfAccount.hashCode() : 0);
        hash = 29 * hash + (this.openingDate != null ? this.openingDate.hashCode() : 0);
        hash = 29 * hash + (this.closingDate != null ? this.closingDate.hashCode() : 0);
        hash = 29 * hash + (this.isSuspended ? 1 : 0);
        hash = 29 * hash + Float.floatToIntBits(this.balance);
        return hash;
    }

    @Override
    public String toString() {
        return "Account{" + "accountNumber=" + accountNumber + "customerId=" + customerId + "typeOfAccount=" + typeOfAccount + "openingDate=" + openingDate + "closingDate=" + closingDate + "isSuspended=" + isSuspended + "balance=" + balance + '}';
    }

    
}
