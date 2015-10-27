/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.intf.util;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 *
 * @author Administrator
 */
public class BeanUtil extends BeanUtils {
    private static Log log = LogFactory.getLog(BeanUtil.class);
    
    public static void copyProperties(Object des, Object src) {
        if(des != null && src != null) {
            try {
                BeanUtils.copyProperties(des, src);
            } catch (InvocationTargetException | IllegalAccessException ex) {
                log.warn("Warnning! In BeanUtil:", ex);
            }
            
        }
    }
}
