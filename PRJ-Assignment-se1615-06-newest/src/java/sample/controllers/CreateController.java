/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;
import valid.CheckValid;

/**
 *
 * @author Admin
 */
public class CreateController extends HttpServlet {

    
    private static final String ERROR="register.jsp";
    private static final String SUCCESS="login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url=ERROR;
        try {
            String userID=request.getParameter("userID");
            String Name=request.getParameter("Name");
            String address=request.getParameter("address");
            String phone=request.getParameter("phone");
            String roleID="US";
            String password=request.getParameter("password");
            String confirm=request.getParameter("confirm");
            System.out.println("Printing User Information in Create Controller");
            System.out.println("userID: "+userID+" ,Name: "+Name+" ,Address: "+address+" , Phone: "+phone+" ,Password: "+password+" ,Confirm: "+confirm);
            //check validation here: check ID, name, role, pass....
            boolean check = true;
            UserError userError=new UserError();
            
            if(userID.length()<2 || userID.length()>10){
                userError.setUserID("User I must be from 2 to 10 characters");
                check=false;
            }
            if(Name.length()<2 || Name.length()>10){
                userError.setErrorName("Name must be from 2 to 10 characters");
                check=false;
            }
            if(address.isEmpty()){
                userError.setAddress("Please enter address");
                check=false;
            }
            if(phone.isEmpty()){
                userError.setPhone("Please enter phone number");
            }
            //kiem tra phone
            CheckValid checkValid = new CheckValid();
            if(CheckValid.checkNumber(phone) == false || phone.length()<10){
                userError.setPhone("Phone is wrong, please try again");
            }
            if(password.length()<1 || password.length()>20){
                userError.setPassword("Userid must be from 1 to 20 characters");
                check=false;
            }
            if(!confirm.equals(password)){
                userError.setConfirm("Password not the same, please try again");
                check=false;
            }
            //kiem tra UserId
            UserDAO dao = new UserDAO();
            UserDTO checkUser=dao.getUserInfor(userID);
            if(checkUser!=null){
                userError.setUserID("Duplicate userID!");
                check=false;
            }
            if(check){
                boolean checkInsert=dao.insert(new UserDTO(userID, Name, address, phone, password, roleID));
                if(checkInsert){
                    url=SUCCESS;
                }
            }else{
                request.setAttribute("ERROR_USER", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController"+e.toString());
            System.out.println("Error at CreateController: "+e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
