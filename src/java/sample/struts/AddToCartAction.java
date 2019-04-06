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
import sample.tbl_mobile.Tbl_MobileDAO;

/**
 *
 * @author KHANHBQSE63463
 */
public class AddToCartAction {
    private String mobileId;
    private Float lastMinPrice;
    private Float lastMaxPrice;
    
    private final String SUCCESS = "success";
    
    public AddToCartAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String role = (String) session.get("ROLE");
        ArrayList<String> soldOutIdList = (ArrayList<String>) session.get("SOLD_OUT");
        if ("CUSTOMER".equals(role)) {
            Cart cart = (Cart) session.get("CART");
            if (cart == null) {
                String userId = (String) session.get("USERID");
                cart = new Cart(userId);
                soldOutIdList = new ArrayList<>();
            }
            Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
            int databaseQuantity = mobileDAO.getQuantityOfMobile(mobileId);
            int cartQuantity = cart.getQuantityOfItem(mobileId);
            for (String str: soldOutIdList) {
                System.out.println(str);
            }
            System.out.println(databaseQuantity + " " + cartQuantity);
            if ((databaseQuantity - cartQuantity) > 0){
                cart.addItem(mobileId);
                if ((databaseQuantity - cartQuantity) == 1) {
                    soldOutIdList.add(mobileId);
                }
            } else {
                if (!soldOutIdList.contains(mobileId))
                    soldOutIdList.add(mobileId);
            }
            
            session.put("SOLD_OUT", soldOutIdList);
            session.put("CART", cart);
        }
        return SUCCESS;
    }

    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }

    public Float getLastMinPrice() {
        return lastMinPrice;
    }

    public void setLastMinPrice(String lastMinPrice) {
        this.lastMinPrice = new Float(lastMinPrice);
    }

    public Float getLastMaxPrice() {
        return lastMaxPrice;
    }

    public void setLastMaxPrice(String lastMaxPrice) {
        this.lastMaxPrice = new Float(lastMaxPrice);
    }
    
    
}
