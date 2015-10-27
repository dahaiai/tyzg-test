/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.intf.commons;

/**
 *
 * @author Administrator
 */
public class Constants {
    //分页每页显示多少数据
    public final static int PAGE_NUM = 10;
    
    //设备在线，离线
    public final static int CAR_ON_LINE = 1;
    public final static int CAR_OFF_LINE = 0;
    
     //设备锁机，未锁
    public final static int CAR_LOCKED = 2;//锁机
    public final static int CAR_UNLOCK = 1;//未锁
    
    //设备销售状态 
    public final static int CAR_UNSAIL = 1;//未发货
    public final static int ZHIXIAO = 2;//直销
    public final static int ZULIN = 3 ;//租赁
    public final static int DAILISHANG = 4;//代理商
    
}
