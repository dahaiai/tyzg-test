/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.intf.util;

/**
 *
 * @author Administrator
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;  
import java.util.logging.Level;
import java.util.logging.Logger;
  
public class DateUtil {  
    
    private static final String dateTimeFormat = "yyyy-MM-dd HH:mm:ss";
    
    private static final String dateFormat = "yyyy-MM-dd";
    
    public static String dateTimeToString(Date date) {
        return new SimpleDateFormat(dateTimeFormat).format(date);
    }
    
    public static Date stringToDateTime(String s) {
        try {
            return new SimpleDateFormat(dateTimeFormat).parse(s);
        } catch (ParseException ex) {
            Logger.getLogger(DateUtil.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public static String dateToString(Date date) {
        return new SimpleDateFormat(dateFormat).format(date);
    }
     
    public static Date stringToDate(String s) {
        try {
            return new SimpleDateFormat(dateFormat).parse(s);
        } catch (ParseException ex) {
            Logger.getLogger(DateUtil.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public static Date getPreOneMonth(Date date) {
        Calendar calendar = Calendar.getInstance(); 
        calendar.add(Calendar.MONTH, -1);    //得到前一个月 
        return calendar.getTime();
    }
    
    public static Date getPreOneDay(Date date) {
        Calendar calendar = Calendar.getInstance(); 
        calendar.add(Calendar.DATE, -1);    //得到前一天 
        return calendar.getTime();
    }
    
    public static int dateDiff(Date fromDate, String toDate){
        int days = 0;
        Date from = stringToDate(dateToString(fromDate));
        Date to = stringToDate(toDate);
        days = (int) (to.getTime() - from.getTime())/(24 * 60 * 60 * 1000);
        return days;
    }
    
    //传一个周进去，获取下一周
    public static int getNextWeek(int start) {
        int year = Integer.parseInt((start+"").substring(0,4));
        String weekNum = (start+"").substring(4);
        Calendar calendar = Calendar.getInstance(); 
        calendar.set(Calendar.YEAR,year);
        calendar.set(Calendar.WEEK_OF_YEAR, Integer.parseInt(weekNum)+1);
        if(calendar.get(Calendar.WEEK_OF_YEAR) <10) {
            return Integer.parseInt(calendar.get(Calendar.YEAR)+"0"+calendar.get(Calendar.WEEK_OF_YEAR));
        }else {
            return Integer.parseInt(calendar.get(Calendar.YEAR)+""+calendar.get(Calendar.WEEK_OF_YEAR));
        }
        
    }
    
    public static int getNextMonth(int start) {
        int year = Integer.parseInt((start+"").substring(0,4));
        int month = Integer.parseInt((start+"").substring(4));
        Calendar calendar = Calendar.getInstance(); 
        calendar.set(Calendar.YEAR,year);
        calendar.set(Calendar.MONTH, month+1);
        if(calendar.get(Calendar.MONTH) <10) {
            return Integer.parseInt(calendar.get(Calendar.YEAR)+"0"+calendar.get(Calendar.MONTH));
        }else {
            return Integer.parseInt(calendar.get(Calendar.YEAR)+""+calendar.get(Calendar.MONTH));
        }
        
    }
    
   

    
    //根据周，获取开始时间，结束时间 type 0 start  1 end
    public static String getTimeOfWeek(int currWeek,int type){
        
        int year = Integer.parseInt((currWeek+"").substring(0,4));
        String weekNum = (currWeek+"").substring(4);
        Calendar calendar = Calendar.getInstance();
        calendar.setFirstDayOfWeek(Calendar.MONDAY);
        calendar.set(Calendar.YEAR,year);
        calendar.set(Calendar.WEEK_OF_YEAR, Integer.parseInt(weekNum));
        
        if(type==1) {
            calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);  
            calendar.set(Calendar.HOUR_OF_DAY, 23);  
            calendar.set(Calendar.MINUTE, 59);  
            calendar.set(Calendar.SECOND, 59); 
        }else {
            calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
            calendar.set(Calendar.HOUR_OF_DAY, 0);  
            calendar.set(Calendar.MINUTE, 0);  
            calendar.set(Calendar.SECOND, 0); 
        }
        return dateTimeToString(calendar.getTime());
    }
    
    
    public static String getMonthFirstSecond(int month) {
        String year = (month+"").substring(0,4);
        String montha = (month+"").substring(4);
        return year+"-"+montha+"-01 00:00:00";
    }
    
    public static String getYearFirstSecond(int year) {
        return year+"-01-01 00:00:00";
    }
    
    public static String getMonthLastSecond(int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.MONTH, Integer.parseInt((month+"").substring(4))-1);
        calendar.set(Calendar.DATE,calendar.getActualMaximum(Calendar.DATE));
        calendar.set(Calendar.HOUR_OF_DAY,23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        return dateTimeToString(calendar.getTime());
    }
    public static String getYearLastSecond(int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, 11);
        calendar.set(Calendar.DATE,calendar.getActualMaximum(Calendar.DATE));
        calendar.set(Calendar.HOUR_OF_DAY,23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        return dateTimeToString(calendar.getTime());
    }

    public static Date getNextFen(Date start) {
        start.setTime(start.getTime() + 1*60*1000);
        return start;
    }
    
    public static Date getPreFen(Date start) {
        start.setTime(start.getTime() - 1*60*1000);
        return start;
    }

    public static Date getNextShi(Date start) {
        start.setTime(start.getTime() + 60*60*1000);
        return start;
    }
    
    public static Date getPreShi(Date start) {
        start.setTime(start.getTime() - 60*60*1000);
        return start;
    }

    public static Date getNextDay(Date start) {
        start.setTime(start.getTime() +24*60*60*1000);
        return start;
    }
    
    public static Date getPreDay(Date start) {
        start.setTime(start.getTime() - 24*60*60*1000);
        return start;
    }

    public static Date getNextMonth(Date start) {
        Calendar c = Calendar.getInstance();
        c.setTime(start);
        c.set(Calendar.MONTH,c.get(Calendar.MONTH)+1);
        return c.getTime();
    }
    
    public static Date getPreMonth(Date start) {
        Calendar c = Calendar.getInstance();
        c.setTime(start);
        c.set(Calendar.MONTH,c.get(Calendar.MONTH)-1);
        return c.getTime();
    }
    
     public static void main(String[] args) throws ParseException {
         System.err.println(DateUtil.dateTimeToString(getNextMonth(DateUtil.stringToDate("2015-12-12"))));
    }
    
}
