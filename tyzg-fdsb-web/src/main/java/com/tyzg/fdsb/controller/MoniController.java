/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.controller;

import com.tyzg.fdsb.intf.commons.Constants;
import com.tyzg.fdsb.intf.dto.CarinfoDTO;
import com.tyzg.fdsb.intf.dto.CustomeDTO;
import com.tyzg.fdsb.intf.service.IMoniService;
import com.tyzg.fdsb.intf.util.JsonUtil;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author LDH
 */
@Controller
@RequestMapping("moni")
public class MoniController {
    private static final Log log = LogFactory.getLog(MoniController.class);
    
    @Resource
    IMoniService moniService;
    
    @RequestMapping("getCustomesList.htm")
    @ResponseBody
    public String getCustomesList(HttpServletRequest request, HttpServletResponse response) {
        List<CustomeDTO> list = moniService.getCustomesList();
        JSONArray data = new JSONArray();
        data.addAll(list);
        return JsonUtil.getJsonResultArray("成功", data);
    }
    
    @RequestMapping("delCar.htm")
    @ResponseBody
    public String delCar(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        log.info("id" + id);
        String errorCode = moniService.delCar(id);
        return JsonUtil.getJsonResult(errorCode, null);
    }
    
    @RequestMapping("addCar.htm")
    @ResponseBody
    public String addCar(HttpServletRequest request, HttpServletResponse response) {
        String carNo = request.getParameter("carNo");
        String gpsNo = request.getParameter("gpsNo");
        String subsidiary = request.getParameter("subsidiary");
        String subcompany = request.getParameter("subcompany");
        String standard = request.getParameter("standard");
        int customeId = Integer.parseInt(request.getParameter("customeId"));
        CustomeDTO customeDTO = moniService.getCustomeById(customeId);
//        String customeInfo = request.getParameter("customeInfo");
        log.info("carNo=["+carNo+"] gpsNo=["+gpsNo+"] subsidiary=["+subsidiary+"] subcompany=["+subcompany+"] standard=["+standard+"] customeId=["+customeId+"]");
        
        CarinfoDTO c= new CarinfoDTO();
        c.setCarNo(carNo);
        c.setGpsNo(gpsNo);
        c.setSubsidiary(subsidiary);
        c.setSubcompany(subcompany);
        c.setStandard(standard);
        log.info(customeDTO.getId());
        c.setCustomeId(customeDTO.getId());
        c.setCustomeInfo(customeDTO.getName());
        log.info("customeDTO.getName()=" + customeDTO.getName());
        c.setAddDate(new Date());
        c.setStatus(Constants.CAR_OFF_LINE);
        c.setLocked(Constants.CAR_UNLOCK);
        c.setSalStatus(Constants.CAR_UNSAIL);
        
        String errorCode = moniService.addCar(c);
        return JsonUtil.getJsonResult(errorCode, null);
    }
    
    @RequestMapping("getCarsForPages.htm")
    @ResponseBody
    public String getCarsForPages(HttpServletRequest request, HttpServletResponse response) {
        int start = request.getParameter("start") == null ? 0 : (Integer.parseInt(request.getParameter("start"))-1)*10;
        String carNo = request.getParameter("carNo");
        String gpsNo = request.getParameter("gpsNo");
        String subsidiary = request.getParameter("subsidiary");
        String subcompany = request.getParameter("subcompany");
        String standard = request.getParameter("standard");
        String customeInfo = request.getParameter("customeInfo");
        log.info("carNo=["+carNo+"] gpsNo=["+gpsNo+"] subsidiary=["+subsidiary+"] subcompany=["+subcompany+"] standard=["+standard+"] customeInfo=["+customeInfo+"]");
        
        List<CarinfoDTO> list = moniService.getCarsForPages(start, Constants.PAGE_NUM, carNo, gpsNo, subsidiary, subcompany, standard,customeInfo);
        
        int count = moniService.getCarsCount(carNo, gpsNo ,subsidiary ,subcompany ,standard ,customeInfo);
        log.info("count = ["+count+"]");
        JSONArray data = new JSONArray();
        data.addAll(list);
        return JsonUtil.getResultForPages(start, count, data).toString();
    }
}
