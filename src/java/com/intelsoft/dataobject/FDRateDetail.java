/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.dataobject;


public class FDRateDetail {
    private String fdType;
    private String fdPeriod;
    private float rateOfInterest;

    public FDRateDetail() {
    }

    public FDRateDetail(String fdType, String fdPeriod, float rateOfInterest) {
        this.fdType = fdType;
        this.fdPeriod = fdPeriod;
        this.rateOfInterest = rateOfInterest;
    }

    public String getFdPeriod() {
        return fdPeriod;
    }

    public void setFdPeriod(String fdPeriod) {
        this.fdPeriod = fdPeriod;
    }

    public String getFdType() {
        return fdType;
    }

    public void setFdType(String fdType) {
        this.fdType = fdType;
    }

    public float getRateOfInterest() {
        return rateOfInterest;
    }

    public void setRateOfInterest(float rateOfInterest) {
        this.rateOfInterest = rateOfInterest;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final FDRateDetail other = (FDRateDetail) obj;
        if ((this.fdType == null) ? (other.fdType != null) : !this.fdType.equals(other.fdType)) {
            return false;
        }
        if ((this.fdPeriod == null) ? (other.fdPeriod != null) : !this.fdPeriod.equals(other.fdPeriod)) {
            return false;
        }
        if (Float.floatToIntBits(this.rateOfInterest) != Float.floatToIntBits(other.rateOfInterest)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 7 * hash + (this.fdType != null ? this.fdType.hashCode() : 0);
        hash = 5 * hash + (this.fdPeriod != null ? this.fdPeriod.hashCode() : 0);
        hash = 79 * hash + Float.floatToIntBits(this.rateOfInterest);
        return hash;
    }

    @Override
    public String toString() {
        return "FDRateDetail{" + "fdType=" + fdType + "fdPeriod=" + fdPeriod + "rateOfInterest=" + rateOfInterest + '}';
    }


}
