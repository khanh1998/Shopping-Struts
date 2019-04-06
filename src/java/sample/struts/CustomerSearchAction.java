/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import sample.tbl_mobile.Tbl_MobileDAO;
import sample.tbl_mobile.Tbl_MobileDTO;

/**
 *
 * @author KHANHBQSE63463
 */
public class CustomerSearchAction extends ActionSupport{
    private Float minPrice;
    private Float maxPrice;
    private ArrayList<Tbl_MobileDTO> mobileList;
    
    private final String SUCCESS = "success";
    
    public CustomerSearchAction() {
        
    }
    
    public String execute() throws Exception {
        System.out.println(minPrice + ";" + maxPrice);
        Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
        mobileList = mobileDAO.searchByRangeOfPrice(minPrice, maxPrice);
        return SUCCESS;
        
    }

    public Float getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(String minPrice) {
        this.minPrice = new Float(minPrice);
    }

    public Float getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(String maxPrice) {
        this.maxPrice = new Float(maxPrice);
    }

    public ArrayList<Tbl_MobileDTO> getMobileList() {
        return mobileList;
    }

    public void setMobileList(ArrayList<Tbl_MobileDTO> mobileList) {
        this.mobileList = mobileList;
    }
    
}
