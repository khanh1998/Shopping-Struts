/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_user;

import java.io.Serializable;

/**
 *
 * @author KHANHBQSE63463
 */
public class Tbl_UserDTO implements Serializable{
    private String userId;
    private int password;
    private String fullname;
    private int role;

    public Tbl_UserDTO() {
    }

    public Tbl_UserDTO(String userId, int password, String fullname, int role) {
        this.userId = userId;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    
}
