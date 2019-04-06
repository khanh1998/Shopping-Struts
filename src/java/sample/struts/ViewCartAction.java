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
import sample.tbl_mobile.Tbl_MobileDTO;

/**
 *
 * @author KHANHBQSE63463
 */
public class ViewCartAction {

    private Float lastMinPrice;
    private Float lastMaxPrice;
    private ArrayList<Tbl_MobileDTO> list;

    private final String SUCCESS = "success";

    public ViewCartAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String role = (String) session.get("ROLE");
        list = new ArrayList<>();
        if ("CUSTOMER".equals(role)) {
            Cart cart = (Cart) session.get("CART");
            Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
            if (cart != null) {
                if (cart.getList() != null) {
                    list = mobileDAO.getSelectedMobileList(cart.getList().keySet());
                }
            }
        }

        return SUCCESS;
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

    public ArrayList<Tbl_MobileDTO> getList() {
        return list;
    }

    public void setList(ArrayList<Tbl_MobileDTO> list) {
        this.list = list;
    }

}
