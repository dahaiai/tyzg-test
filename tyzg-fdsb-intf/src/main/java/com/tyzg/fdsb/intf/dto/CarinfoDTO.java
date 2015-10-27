/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.intf.dto;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class CarinfoDTO implements Serializable {
    private Integer id;
    
    private String carNo;
    
    private String gpsNo;
    
    private String subsidiary;
    
    private String subcompany;
    
    private String standard;
    
    private Date addDate;
    
    private String addDateStr;
    
    private Integer customeId;
    
    private String customeInfo;
    
    private Integer status;
    
    private String lng;
    
    private String lat;
    
    private Integer locked;
    
    private Integer salStatus;
    
    private String payment;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCarNo() {
        return carNo;
    }

    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }

    public String getGpsNo() {
        return gpsNo;
    }

    public void setGpsNo(String gpsNo) {
        this.gpsNo = gpsNo;
    }

    public String getSubsidiary() {
        return subsidiary;
    }

    public void setSubsidiary(String subsidiary) {
        this.subsidiary = subsidiary;
    }

    public String getSubcompany() {
        return subcompany;
    }

    public void setSubcompany(String subcompany) {
        this.subcompany = subcompany;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public String getAddDateStr() {
        return addDateStr;
    }

    public void setAddDateStr(String addDaeStr) {
        this.addDateStr = addDaeStr;
    }

    public Integer getCustomeId() {
        return customeId;
    }

    public void setCustomeId(Integer customeId) {
        this.customeId = customeId;
    }

    public String getCustomeInfo() {
        return customeInfo;
    }

    public void setCustomeInfo(String customeInfo) {
        this.customeInfo = customeInfo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public Integer getLocked() {
        return locked;
    }

    public void setLocked(Integer locked) {
        this.locked = locked;
    }

    public Integer getSalStatus() {
        return salStatus;
    }

    public void setSalStatus(Integer salStatus) {
        this.salStatus = salStatus;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }
    
}
