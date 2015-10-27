/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.intf.util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 *
 * @author Administrator
 */
public class JsonUtil {

    public static String getJsonResult(String errorCode, JSONObject data) {
        JSONObject obj = new JSONObject();
        obj.put("errorCode", errorCode);
        obj.put("data", data);
        return obj.toString();
    }

    public static JSONObject getResultForPages(int start, int count, JSONArray data) {
        JSONObject obj = new JSONObject();
        if(count == 0){
            obj.put("count", 0);
        }else {
            obj.put("count", (count-1)/10+1);
        }
        obj.put("start", start/10+1);
        obj.put("data", data);
        return obj;
    }

    public static String getJsonResultArray(String errorCode, JSONArray data) {
        JSONObject obj = new JSONObject();
        obj.put("errorCode", errorCode);
        obj.put("data", data);
        
        return obj.toString();
    }
    
}
