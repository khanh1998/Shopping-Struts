/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_bill;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import javax.naming.NamingException;
import sample.tbl_mobile.Tbl_MobileDAO;
import sample.utils.DButils;

/**
 *
 * @author KHANHBQSE63463
 */
public class Tbl_BillDAO implements Serializable {

    public boolean writeBill(Map<String, Integer> cart, String userId, Timestamp dateTime)
            throws NamingException, SQLException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Tbl_MobileDAO mobileDAO = new Tbl_MobileDAO();
        
        try {
            connection = DButils.getConnection();
            String url = "INSERT INTO tbl_Bill(userId, mobileId, quantity, datetime) VALUES(?,?,?,?)";

            connection.setAutoCommit(false);
            try {
                for (Map.Entry<String, Integer> mobile : cart.entrySet()) {

                    System.out.println(userId + " - " + mobile.getKey() + " - " + mobile.getValue() + " - " + dateTime);
                    preparedStatement = connection.prepareStatement(url);
                    preparedStatement.setString(1, userId);
                    preparedStatement.setString(2, mobile.getKey());
                    preparedStatement.setInt(3, mobile.getValue());
                    preparedStatement.setTimestamp(4, dateTime);
                    preparedStatement.executeUpdate();
                    mobileDAO.minusQuantityOfMobile(mobile.getKey(), mobile.getValue());
                }
                connection.commit();
            } catch (SQLException e) {
                connection.rollback();
                return false;
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return true;
    }
}
