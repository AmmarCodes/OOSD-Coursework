/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package integration;

import java.sql.*;

/**
 *
 * @author ammar
 */
public class DAO implements DAO_Interface {

    // Singleton object
    private static DAO theQuizDAO;
    private Connection databaseConnection;

    private DAO() {
    }

    public static DAO getQuizDAO() {
        if (theQuizDAO == null) {
            theQuizDAO = new DAO();
        }
        return theQuizDAO;
    }

    private Statement getConnection()
            throws ClassNotFoundException, SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // setup the connection with the DB.
            databaseConnection = DriverManager
                    .getConnection("jdbc:mysql://192.168.22.10/coursework_db?"
                            + "user=root&password=root");
            return databaseConnection.createStatement();
        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe);
            throw cnfe;
        } catch (SQLException se) {
            System.out.println(se);
            throw se;
        }
    }

    private void closeConnection() throws SQLException {
        try {
            databaseConnection.close();
        } catch (SQLException se) {
            System.out.println(se);
            throw se;
        }
    }

    /**
     * @TODO replace this with appropriate method, and do the rest of required ones
     *
     * @param eventName
     * @param sportKey
     * @param venueKey
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public void insertEvent(String eventName, String sportKey, String venueKey)
            throws ClassNotFoundException, SQLException {
        try {
            Statement myStatement = getConnection();
            String writeString = "INSERT INTO Event (EventName,SportKey, VenueKey) VALUES('" + eventName + "'  , " + sportKey + ", " + venueKey + ")";
            myStatement.executeUpdate(writeString);
            closeConnection();
        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe);
            throw cnfe;
        } catch (SQLException sqle) {
            System.out.println(sqle);
            throw sqle;
        }
    }

    public boolean checkLogin(String username, String password)
            throws ClassNotFoundException, SQLException {

        try {
            Statement myStatement = getConnection();
            String query = "SELECT * FROM users WHERE username like '" + username + "' AND password LIKE '" + password + "' LIMIT 1";
            myStatement.executeQuery(query);
            ResultSet result = myStatement.getResultSet();
            boolean canLogin = false;
            if (result.next()) {
                canLogin = true;
            }
            closeConnection();
            return canLogin;
        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe);
            throw cnfe;
        } catch (SQLException sqle) {
            System.out.println(sqle);
            throw sqle;
        }

    }
}
