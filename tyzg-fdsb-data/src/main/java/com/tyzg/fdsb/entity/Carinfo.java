/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "carinfo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Carinfo.findAll", query = "SELECT c FROM Carinfo c"),
    @NamedQuery(name = "Carinfo.findById", query = "SELECT c FROM Carinfo c WHERE c.id = :id"),
    @NamedQuery(name = "Carinfo.findByCarNo", query = "SELECT c FROM Carinfo c WHERE c.carNo = :carNo"),
    @NamedQuery(name = "Carinfo.findByGpsNo", query = "SELECT c FROM Carinfo c WHERE c.gpsNo = :gpsNo"),
    @NamedQuery(name = "Carinfo.findBySubsidiary", query = "SELECT c FROM Carinfo c WHERE c.subsidiary = :subsidiary"),
    @NamedQuery(name = "Carinfo.findBySubcompany", query = "SELECT c FROM Carinfo c WHERE c.subcompany = :subcompany"),
    @NamedQuery(name = "Carinfo.findByStandard", query = "SELECT c FROM Carinfo c WHERE c.standard = :standard"),
    @NamedQuery(name = "Carinfo.findByAddDate", query = "SELECT c FROM Carinfo c WHERE c.addDate = :addDate"),
    @NamedQuery(name = "Carinfo.findByCustomeId", query = "SELECT c FROM Carinfo c WHERE c.customeId = :customeId"),
    @NamedQuery(name = "Carinfo.findByCustomeInfo", query = "SELECT c FROM Carinfo c WHERE c.customeInfo = :customeInfo"),
    @NamedQuery(name = "Carinfo.findByStatus", query = "SELECT c FROM Carinfo c WHERE c.status = :status"),
    @NamedQuery(name = "Carinfo.findByLng", query = "SELECT c FROM Carinfo c WHERE c.lng = :lng"),
    @NamedQuery(name = "Carinfo.findByLat", query = "SELECT c FROM Carinfo c WHERE c.lat = :lat"),
    @NamedQuery(name = "Carinfo.findByLocked", query = "SELECT c FROM Carinfo c WHERE c.locked = :locked"),
    @NamedQuery(name = "Carinfo.findBySalStatus", query = "SELECT c FROM Carinfo c WHERE c.salStatus = :salStatus"),
    @NamedQuery(name = "Carinfo.findByPayment", query = "SELECT c FROM Carinfo c WHERE c.payment = :payment")})
public class Carinfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 128)
    @Column(name = "car_no")
    private String carNo;
    @Size(max = 128)
    @Column(name = "gps_no")
    private String gpsNo;
    @Size(max = 128)
    @Column(name = "subsidiary")
    private String subsidiary;
    @Size(max = 128)
    @Column(name = "subcompany")
    private String subcompany;
    @Size(max = 128)
    @Column(name = "standard")
    private String standard;
    @Column(name = "add_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date addDate;
    @Column(name = "custome_id")
    private Integer customeId;
    @Size(max = 128)
    @Column(name = "custome_info")
    private String customeInfo;
    @Column(name = "status")
    private Integer status;
    @Size(max = 128)
    @Column(name = "lng")
    private String lng;
    @Size(max = 128)
    @Column(name = "lat")
    private String lat;
    @Column(name = "locked")
    private Integer locked;
    @Column(name = "sal_status")
    private Integer salStatus;
    @Size(max = 128)
    @Column(name = "payment")
    private String payment;

    public Carinfo() {
    }

    public Carinfo(Integer id) {
        this.id = id;
    }

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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Carinfo)) {
            return false;
        }
        Carinfo other = (Carinfo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tyzg.fdsb.entity.Carinfo[ id=" + id + " ]";
    }
    
}
