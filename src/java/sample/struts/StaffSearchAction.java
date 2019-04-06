/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import java.util.ArrayList;
import sample.tbl_mobile.Tbl_MobileDAO;
import sample.tbl_mobile.Tbl_MobileDTO;

/**
 *
 * @author KHANHBQSE63463
 */
public class StaffSearchAction {
    private String searchValue;
    private ArrayList<Tbl_MobileDTO> mobileList;
    private final String SUCCESS = "success";
    public StaffSearchAction() {
    }
    
    public String execute() throws Exception {
        Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
        mobileList = mobileDAO.searchByIdOrName(searchValue);
        return SUCCESS;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public ArrayList<Tbl_MobileDTO> getMobileList() {
        return mobileList;
    }

    public void setMobileList(ArrayList<Tbl_MobileDTO> mobileList) {
        this.mobileList = mobileList;
    }
    
}
