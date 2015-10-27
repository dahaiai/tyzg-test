/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tyzg.fdsb.service.impl;

import com.caucho.hessian.server.HessianServlet;
import com.tyzg.fdsb.entity.Carinfo;
import com.tyzg.fdsb.entity.Custome;
import com.tyzg.fdsb.facade.CarinfoFacade;
import com.tyzg.fdsb.facade.CustomeFacade;
import com.tyzg.fdsb.intf.dto.CarinfoDTO;
import com.tyzg.fdsb.intf.dto.CustomeDTO;
import com.tyzg.fdsb.intf.service.IMoniService;
import com.tyzg.fdsb.intf.util.BeanUtil;
import com.tyzg.fdsb.intf.util.DateUtil;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author Administrator
 */
public class MoniServiceImpl extends HessianServlet implements IMoniService {
    private static final Log log = LogFactory.getLog(MoniServiceImpl.class);
    @EJB
    private CarinfoFacade carinfoFacade;

    @EJB
    private CustomeFacade customeFacade;

    @Override
    public String addCar(CarinfoDTO c) {
        Carinfo oldCi = carinfoFacade.getCarsByCarNo(c.getCarNo());
        if (oldCi != null) {
            return "改工作令设备已存在，不能重复添加";
        }

        Carinfo oldC = carinfoFacade.getCarsByGpsNo(c.getGpsNo());
        if (oldC != null) {
            return "改G码已存在，不能重复添加";
        }

        Carinfo ci = new Carinfo();
        log.info("Impl.addCar.carinfoDTO " + c.getCustomeInfo());
        BeanUtil.copyProperties(ci, c);
        log.info("Impl.addCar.carinfo" + ci.getCustomeInfo());
        carinfoFacade.create(ci);
        return "成功";
    }

    @Override
    public CustomeDTO getCustomeById(int customeId) {
        Custome custome = customeFacade.find(customeId);
        CustomeDTO dto = null;

        if (custome != null) {
            dto = new CustomeDTO();
            BeanUtil.copyProperties(dto, custome);
        }
        
        return dto;
    }

    @Override
    public List<CarinfoDTO> getCarsForPages(int start, int limit, String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo) {
        List<Carinfo> list = carinfoFacade.getCarsForPage(start, limit, carNo, gpsNo, subsidiary, subcompany, standard, customeInfo);
        List<CarinfoDTO> listDto = null;
        CarinfoDTO carinfoDto = null;
        if (!list.isEmpty()) {
            listDto = new ArrayList<>();
            for (Carinfo c : list) {
                carinfoDto = new CarinfoDTO();
                BeanUtil.copyProperties(carinfoDto, c);
                carinfoDto.setAddDateStr(DateUtil.dateTimeToString(c.getAddDate()));
                listDto.add(carinfoDto);
            }
        }

        return listDto;
    }

    @Override
    public int getCarsCount(String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo) {
        return (int) carinfoFacade.getCarsCount(carNo, gpsNo, subsidiary, subcompany, standard, customeInfo);

    }

    @Override
    public String delCar(int id) {
        Carinfo old = carinfoFacade.find(id);
        if (old != null) {
            carinfoFacade.remove(old);
            return "成功";
        } else {
            return "设备不存在！";
        }
    }

    @Override
    public List<CustomeDTO> getCustomesList() {
        List<Custome> list = customeFacade.findAll();
        List<CustomeDTO> listDTO = null;
        CustomeDTO customeDTO = null;

        if (!list.isEmpty()) {
            listDTO = new ArrayList<CustomeDTO>();
            
            for (Custome c : list) {
                customeDTO = new CustomeDTO();
                BeanUtil.copyProperties(customeDTO, c);
                listDTO.add(customeDTO);
            }
        }
        
        return listDTO;
    }

}
