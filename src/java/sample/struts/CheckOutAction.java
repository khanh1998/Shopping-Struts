/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionContext;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;
import sample.cart.Cart;
import sample.tbl_bill.Tbl_BillDAO;

/**
 *
 * @author KHANHBQSE63463
 */
public class CheckOutAction {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    public CheckOutAction() {
    }

    public String execute() throws Exception {
        String result = FAIL;
        Tbl_BillDAO billDAO = new Tbl_BillDAO();
        Map session = ActionContext.getContext().getSession();
        Cart cart = (Cart) session.get("CART");
        if (cart != null) {
            String userId = (String) session.get("USERID");
            if (cart.getList() != null) {
                Calendar calendar = Calendar.getInstance();
                long time = calendar.getTimeInMillis();
                boolean success = billDAO.writeBill(cart.getList(), userId, new Timestamp(time));

                if (success) {
                    session.remove("CART");
                    session.remove("SOLD_OUT");
                    result = SUCCESS;
                }
            }
        }
        return result;
    }

}
