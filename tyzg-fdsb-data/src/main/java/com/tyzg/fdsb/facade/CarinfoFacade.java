/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.facade;

import com.tyzg.fdsb.entity.Carinfo;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Administrator
 */
@Stateless
public class CarinfoFacade extends AbstractFacade<Carinfo> {
    @PersistenceContext(unitName = "tyzg-fdsb")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CarinfoFacade() {
        super(Carinfo.class);
    }
    
    public Carinfo getCarsByCarNo(String carNo) {
        List<Carinfo> list = this.getEntityManager().createNamedQuery("Carinfo.findByCarNo")
                .setParameter("carNo", carNo).getResultList();
        if(!list.isEmpty()) {
            return list.get(0);
        }else {
            return null;
        }
    }

    public Carinfo getCarsByGpsNo(String gpsNo) {
        List<Carinfo> list = this.getEntityManager().createNamedQuery("Carinfo.findByGpsNo")
                .setParameter("gpsNo", gpsNo).getResultList();
        if(!list.isEmpty()) {
            return list.get(0);
        }else {
            return null;
        }
    }

    public List<Carinfo> getCarsForPage(int start, int limit, String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo) {
        return genQuery(carNo, gpsNo, subsidiary, subcompany, standard, customeInfo, true)
                .setFirstResult(start).setMaxResults(limit).getResultList();
    }
    
    private Query genQuery(String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo ,boolean flag) {
        StringBuilder sb = new StringBuilder();
        if(flag) {
            //查数据
            sb.append("SELECT c FROM Carinfo c where 1=1");
        }else {
            //查数量
            sb.append("SELECT count(c) FROM Carinfo c where 1=1 ");
        }
        
        if(!carNo.isEmpty()) {
            sb.append("and c.carNo like :carNo");
        }
        if(!gpsNo.isEmpty()) {
            sb.append("and c.gpsNo like :gpsNo ");
        }
        if(!subsidiary.isEmpty()) {
            sb.append("and c.subsidiary like :subsidiary ");
        }
        if(!subcompany.isEmpty()) {
            sb.append("and c.subcompany like :subcompany ");
        }
        if(!standard.isEmpty()) {
            sb.append("and c.standard like :standard ");
        }
        if(!customeInfo.isEmpty()) {
            sb.append("and c.customeInfo like :customeInfo ");
        }
        
        Query query = this.getEntityManager().createQuery(sb.toString());
        if(!carNo.isEmpty()) {
            query.setParameter("carNo", "%"+carNo+"%");
        }
        if(!gpsNo.isEmpty()) {
            query.setParameter("gpsNo", "%"+gpsNo+"%");
        }
        if(!subsidiary.isEmpty()) {
            query.setParameter("subsidiary", "%"+subsidiary+"%");
        }
        if(!subcompany.isEmpty()) {
            query.setParameter("subcompany", "%"+subcompany+"%");
        }
        if(!standard.isEmpty()) {
            query.setParameter("standard", "%"+standard+"%");
        }
        if(!customeInfo.isEmpty()) {
            query.setParameter("customeInfo", "%"+customeInfo+"%");
        }
        
        return query;
    }

    public long getCarsCount(String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo) {
        return (long)genQuery(carNo, gpsNo, subsidiary, subcompany, standard, customeInfo, false).getSingleResult();
    }
}
