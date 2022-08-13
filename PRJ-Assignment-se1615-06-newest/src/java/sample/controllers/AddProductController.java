/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductError;
import valid.CheckValid;

/**
 *
 * @author ADMIN
 */
public class AddProductController extends HttpServlet {

     private static final String ERROR="AddProduct.jsp";
     private static final String SUCCESS="LoadForAdminController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            CheckValid valid = new CheckValid();
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            float price = Float.parseFloat(request.getParameter("price"));
            String categoryID = request.getParameter("categoryID");
            String description = request.getParameter("description");
            boolean check = true;
            ProductError proError = new ProductError();
            if(productID.isEmpty()){
                proError.setProductID("please do not let empty");
                check = false;
            }
            if(productName.length() < 2 || productName.length()>50){
                proError.setProductName("Please enter product name in 1-50 digit");
                check = false;
            }
            
            if(categoryID.isEmpty()){
                proError.setCategoryID("Please enter value 1-8");
                check = false;
            }

//            if(CheckValid.checkString(image, "https://") == false){
//                proError.setImage("The link must have [http(s)://] in it");
//                check =false;
//            }
            ProductDAO dao = new ProductDAO();
            ProductDTO checkProduct =dao.getProInfor(productID);
            //check trung id san pham
            if(checkProduct!=null){
                proError.setProductID("Duplicate id, try again");
            }
            if(check){
                boolean checkInsert = dao.insertProduct(new ProductDTO(productID, productName, image, price, categoryID, description));
                if(checkInsert){
                    url = SUCCESS;
                }
                }else{
                    request.setAttribute("ERROR_PRODUCT", proError);
            }
        } catch (Exception e) {
            log("Error at AddProductControlle:" + e.toString());
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
