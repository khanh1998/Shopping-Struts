/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_user;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import sample.utils.DButils;

/**
 *
 * @author KHANHBQSE63463
 */
public class Tbl_UserDAO implements Serializable{
    public int isRegisredAccount(String userId, int password) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = DButils.getConnection();
            
            String url = "SELECT role FROM tbl_User WHERE userId = ? AND password = ?";
            preparedStatement = connection.prepareStatement(url);
            preparedStatement.setString(1, userId);
            preparedStatement.setInt(2, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
                return resultSet.getInt("role");
        } finally {
            if (resultSet != null)
                resultSet.close();
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
        return -1;
    }
}
