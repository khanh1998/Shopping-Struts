/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import sample.tbl_mobile.Tbl_MobileDAO;

/**
 *
 * @author KHANHBQSE63463
 */
public class DeleteMobileAction {
    private String mobileId;
    private String lastSearchValue;
    
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    public DeleteMobileAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
        boolean success = mobileDAO.deleteById(mobileId);
        if (success) {
            url = SUCCESS;
        }
        return url;
    }

    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }

    public String getLastSearchValue() {
        return lastSearchValue;
    }

    public void setLastSearchValue(String lastSearchValue) {
        this.lastSearchValue = lastSearchValue;
    }
    
}
