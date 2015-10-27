/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.facade;

import com.tyzg.fdsb.entity.Custome;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Administrator
 */
@Stateless
public class CustomeFacade extends AbstractFacade<Custome> {
    @PersistenceContext(unitName = "tyzg-fdsb")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomeFacade() {
        super(Custome.class);
    }
    
}
