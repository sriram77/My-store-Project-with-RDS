package com.sriram.mystore.dao;

import java.util.List;

import com.sriram.mystore.model.Product;


/**
 * Created by SRIRAM on 9/6/2016.
 */
public interface ProductDao {

    void addProduct(Product product);

    Product getProductById(int id);

    List<Product> getAllProduct();

    void deleteProduct(int id);

    void updateProduct(Product product);

}
