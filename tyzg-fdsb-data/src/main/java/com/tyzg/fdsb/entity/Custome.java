/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "custome")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Custome.findAll", query = "SELECT c FROM Custome c"),
    @NamedQuery(name = "Custome.findById", query = "SELECT c FROM Custome c WHERE c.id = :id"),
    @NamedQuery(name = "Custome.findByName", query = "SELECT c FROM Custome c WHERE c.name = :name"),
    @NamedQuery(name = "Custome.findByPerson", query = "SELECT c FROM Custome c WHERE c.person = :person"),
    @NamedQuery(name = "Custome.findByPhone", query = "SELECT c FROM Custome c WHERE c.phone = :phone"),
    @NamedQuery(name = "Custome.findByAddress", query = "SELECT c FROM Custome c WHERE c.address = :address")})
public class Custome implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 128)
    @Column(name = "name")
    private String name;
    @Size(max = 128)
    @Column(name = "person")
    private String person;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="电话/传真格式无效, 应为 xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 128)
    @Column(name = "phone")
    private String phone;
    @Size(max = 128)
    @Column(name = "address")
    private String address;

    public Custome() {
    }

    public Custome(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        if (!(object instanceof Custome)) {
            return false;
        }
        Custome other = (Custome) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tyzg.fdsb.entity.Custome[ id=" + id + " ]";
    }
    
}
