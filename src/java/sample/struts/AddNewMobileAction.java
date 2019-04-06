/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionSupport;
import sample.tbl_mobile.Tbl_MobileDAO;
import sample.tbl_mobile.Tbl_MobileDTO;

/**
 *
 * @author KHANHBQSE63463
 */
public class AddNewMobileAction extends ActionSupport{
    private String mobileId;
    private String description;
    private Float price;
    private String mobileName;
    private Integer yearOfProduction;
    private Integer quantity;
    private boolean notSale;
    
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    public AddNewMobileAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
        Tbl_MobileDTO mobileDTO = 
                new Tbl_MobileDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
        boolean success = mobileDAO.insert(mobileDTO);
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

    public String getMobileName() {
        return mobileName;
    }

    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
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
