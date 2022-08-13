/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;
import sample.product.ProductDTO;

/**
 *
 * @author ADMIN
 */
public class Cart {
    
    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    
    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
//            if (this.cart.containsKey(product.getProductID())) {
//                int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
//                product.setQuantity(currentQuantity + product.getQuantity());
//            }
            this.cart.put(product.getProductID(), product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }
    
    public boolean delete(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    
    //Giống delete chỉ khác replace [ghi đè vô]
    public boolean update(String id, ProductDTO product){
        boolean check = false;
        try {
            if(this.cart!=null){
                if(this.cart.containsKey(id)){
                    this.cart.replace(id, product);
                    check =true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }    
}
