package com.sriram.mystore.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sriram.mystore.dao.ProductDao;
import com.sriram.mystore.model.Product;


/**
 * Created by SRIRAM on 9/2/2016.
 */

@Controller
public class HomeController {

    private Path path;

    @Autowired
    private ProductDao productDao;

    @RequestMapping("/")
    public String home()
    {
        return "home";
    }

    @RequestMapping("/productList")
    public String getProducts(Model model)
    {
        List<Product> productList= productDao.getAllProduct();
      //  Product product =productList.get(0);
        model.addAttribute("products",productList);

        return "productList";
    }

    @RequestMapping("/productList/viewProduct/{productId}")
    public String viewProduct(@PathVariable String productId,Model model)throws IOException
    {
        Product product= productDao.getProductById(Integer.parseInt(productId));
        model.addAttribute(product);
        return "viewProduct";
    }


}
