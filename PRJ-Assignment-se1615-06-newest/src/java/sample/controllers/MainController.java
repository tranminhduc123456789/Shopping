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

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String START = "LoadProducts";
    private static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String LOGOUT = "LogoutControllers";
    private static final String DELETE = "DeleteController";
    private static final String UPDATE = "UpdateController";
    private static final String CREATE = "CreateController";
    private static final String ADD_TO_CART = "AddToCartControllers";
    private static final String REMOVE_ITEM = "RemoveItemController";
    private static final String ADD_ITEM = "AddProductController";
    private static final String DELETE_USER = "DeleteUserController";
    private static final String UPDATE_USER = "UpdateUserController";
    private static final String SEARCH_ADMIN = "SearchAdminController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = START;
        try {
            String action = request.getParameter("action");
            if ("Login".equals(action)) {
                System.out.println("Function in MainController: Login");
                url = LOGIN;
            } else if ("Search".equals(action)) {
                System.out.println("Function in MainController: Search");
                url = SEARCH;
            } else if ("Logout".equals(action)) {
                System.out.println("Function in MainController: Logout");
                url = LOGOUT;
            } else if ("Delete".equals(action)) {
                System.out.println("Function in MainController: Delete");
                url = DELETE;
            } else if ("Update".equals(action)) {
                System.out.println("Function in MainController: Update");
                url = UPDATE;
            } else if ("Create".equals(action)) {
                System.out.println("Function in MainController: Create");
                url = CREATE;
            } else if ("AddToCart".equals(action)) {
                System.out.println("Function in MainController: AddToCart");
                url = ADD_TO_CART;
            } else if ("Remove".equals(action)) {
                System.out.println("Function in MainController: Remove");
                url = REMOVE_ITEM;
            } else if("AddProduct".equals(action)){
                System.out.println("Function in MainController: AddProduct");
                url = ADD_ITEM;
            } else if ("DeleteUser".equals(action)) {
                System.out.println("Function in MainController: DeleteUserController");
                url = DELETE_USER;
            }else if ("UpdateUser".equals(action)) {
                System.out.println("Function in MainController: UpdateUserController");
                url = UPDATE_USER;
            }else if ("SearchAdmin".equals(action)) {
                System.out.println("Function in MainController: SearchAdminController");
                url = SEARCH_ADMIN;
            }
        } catch (Exception event) {
            log("Error at MainController: " + event.toString());
        } finally {
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
