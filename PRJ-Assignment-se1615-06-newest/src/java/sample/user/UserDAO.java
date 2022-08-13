/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;
import sun.security.util.Password;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public UserDTO checkLogin(String userId, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT name, address, phone, password ,roleID FROM tblUser WHERE userID =? AND password =?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userId);
                pstm.setString(2, password);
                resultSet = pstm.executeQuery();
                if (resultSet.next()) {
                    String Name = resultSet.getString("name");
                    String roleID = resultSet.getString("roleID");
                    String address = resultSet.getString("address");
                    String phone = resultSet.getString("phone");
                    user = new UserDTO(userId, Name, address, phone, password, roleID);
                }
            }
        } catch (Exception event) {
            event.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public UserDTO getUserInfor(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select name, address, phone, password ,roleID FROM tblUser WHERE userID= ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userID);
                resultSet = pstm.executeQuery();
                if (resultSet.next()) {
                    String Name = resultSet.getString("name");
                    String roleID = resultSet.getString("roleID");
                    String address = resultSet.getString("address");
                    String phone = resultSet.getString("phone");
                    String password = resultSet.getString("password");
                    user = new UserDTO(userID, Name, address, phone, password, roleID);
                }
            }
        } catch (Exception event) {
            event.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean insert(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblUser(userID, name, address, phone, password, roleID) "
                        + " VALUES(?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getAddress());
                stm.setString(4, user.getPhone());
                stm.setString(5, user.getPassword());
                stm.setString(6, user.getRoleID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<UserDTO> getAllUser() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select userID, name, address, phone, password, roleID from tblUser";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add(new UserDTO(rs.getNString("userID"),
                            rs.getNString("name"),
                            rs.getNString("address"),
                            rs.getNString("phone"),
                            rs.getNString("password"),
                            rs.getNString("roleID")));
                }
            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public boolean delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblUser WHERE userID= ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userID);
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception event) {

        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean Update(UserDTO user, String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUser SET name = ?, address = ?, phone = ? where userID = ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, user.getName());
                pstm.setString(2, user.getAddress());
                pstm.setString(3, user.getPhone());
                pstm.setString(4, userID);

                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception event) {
            event.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    /*   public List<UserDTO> getListUser(String searchFullName) throws SQLException {
        List<UserDTO> ListUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID, fullName, roleID FROM tblUsers WHERE fullName like ?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, "%" + searchFullName + "%");
                resultSet = pstm.executeQuery();
                while (resultSet.next()) {
                    String userID = resultSet.getString("userID");
                    String fullName = resultSet.getString("fullName");
                    String roleId = resultSet.getString("roleID");
                    String password = "***";
                    ListUser.add(new UserDTO(userID, fullName, roleId, password));
                }
            }
        } catch (Exception event) {
            event.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return ListUser;
    }

    public boolean delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblUsers WHERE userID=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, userID);
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception event) {

        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean Update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers SET fullName =?, roleID =?"
                        + " WHERE userID =?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, user.getFullName());
                pstm.setString(2, user.getRoleId());
                pstm.setString(3, user.getUserId());
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception event) {
            event.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    
    public boolean insert(UserDTO user) throws SQLException{
        boolean check = false;
        Connection conn=null;
        PreparedStatement stm=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql= " INSERT INTO tblUsers(userID, fullName, roleID, password) "
                        + " VALUES(?,?,?,?) ";
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getUserId());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getRoleId());
                stm.setString(4, user.getPassword());
                check=stm.executeUpdate()>0? true: false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
     */
}
