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
public class UpdateMobileAction {
    private String mobileId;
    private String description;
    private float price;
    private int quantity;
    private boolean notSale;
    private String lastSearchValue;

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    public UpdateMobileAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
        boolean success = mobileDAO.update(mobileId, description, price, quantity, notSale);
        if (success) {
            url = SUCCESS;
        }
        return url;
    }
    
    public String getLastSearchValue() {
        return lastSearchValue;
    }

    public void setLastSearchValue(String lastSearchValue) {
        this.lastSearchValue = lastSearchValue;
    }
    
    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isNotSale() {
        return notSale;
    }

    public void setNotSale(boolean notSale) {
        this.notSale = notSale;
    }
    
    
}
