/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.Map;
import sample.cart.Cart;

/**
 *
 * @author KHANHBQSE63463
 */
public class RemoveFromCartAction {
    private float lastMinPrice;
    private float lastMaxPrice;
    private String[] mobileIds;
    
    private final String SUCCESS = "success";
    public RemoveFromCartAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String role = (String) session.get("ROLE");
        if (role.equals("CUSTOMER")) {
            Cart cart = (Cart) session.get("CART");
            ArrayList<String> soldOutList = (ArrayList<String>) session.get("SOLD_OUT");
            for (String id: mobileIds) {
                cart.removeItem(id);
                soldOutList.remove(id);
            }
        }
        return SUCCESS;
    }

    public float getLastMinPrice() {
        return lastMinPrice;
    }

    public void setLastMinPrice(float lastMinPrice) {
        this.lastMinPrice = lastMinPrice;
    }

    public float getLastMaxPrice() {
        return lastMaxPrice;
    }

    public void setLastMaxPrice(float lastMaxPrice) {
        this.lastMaxPrice = lastMaxPrice;
    }

    public String[] getMobileIds() {
        return mobileIds;
    }

    public void setMobileIds(String[] mobileIds) {
        this.mobileIds = mobileIds;
    }
    
}
