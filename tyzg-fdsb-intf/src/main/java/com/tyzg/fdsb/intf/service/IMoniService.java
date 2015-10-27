/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tyzg.fdsb.intf.service;

import com.tyzg.fdsb.intf.dto.CarinfoDTO;
import com.tyzg.fdsb.intf.dto.CustomeDTO;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface IMoniService {

    public String addCar(CarinfoDTO c);

    public CustomeDTO getCustomeById(int customeId);

    public List<CarinfoDTO> getCarsForPages(int start, int PAGE_NUM, String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo);

    public int getCarsCount(String carNo, String gpsNo, String subsidiary, String subcompany, String standard, String customeInfo);

    public String delCar(int id);

    public List<CustomeDTO> getCustomesList();
}
