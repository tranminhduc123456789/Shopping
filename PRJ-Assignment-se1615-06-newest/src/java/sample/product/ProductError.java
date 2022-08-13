/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author ADMIN
 */
public class ProductError {

    private String productID;
    private String productName;
    private String image;
    private String categoryID;

    public ProductError() {
        this.productID = "";
        this.productName = "";
        this.image = "";
    }

    public ProductError(String productID, String productName, String image, String categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.categoryID = categoryID;
    }

    public ProductError(String productID, String productName, String image) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
