/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.tbl_user.Tbl_UserDAO;

/**
 *
 * @author KHANHBQSE63463
 */
public class LoginAction {

    private String userId;
    private int password;

    private final String CUSTOMER = "customer";
    private final String STAFF = "staff";
    private final String FAIL = "fail";

    private final int CUSTOMER_ROLE = 0;
    private final int STAFF_ROLE = 2;

    public LoginAction() {
    }

    public String execute() throws Exception {
        Tbl_UserDAO userDAO = new Tbl_UserDAO();
        String url = FAIL;
        int role = userDAO.isRegisredAccount(userId, password);
        Map session = ActionContext.getContext().getSession();
        if (role == CUSTOMER_ROLE) {
            url = CUSTOMER;
            session.put("USERID", userId);
            session.put("ROLE", "CUSTOMER");
        } else if (role == STAFF_ROLE) {
            url = STAFF;
            session.put("USERID", userId);
            session.put("ROLE", "STAFF");
        }
        return url;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

}
