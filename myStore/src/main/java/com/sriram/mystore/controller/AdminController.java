package com.sriram.mystore.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.sriram.mystore.dao.ProductDao;
import com.sriram.mystore.model.Product;

/**
 * Created by SRIRAM on 9/12/2016.
 */
@Controller
public class AdminController {

    private Path path;

    @Autowired
    private ProductDao productDao;

    @RequestMapping("/admin")
    public String admin()
    {
        return "admin";
    }

    @RequestMapping("/admin/productInventory")
    public String productInventory(Model model)
    {
        List<Product> products= productDao.getAllProduct();
        model.addAttribute("products",products);
        return "productInventory";
    }

    @RequestMapping("/admin/productInventory/addProduct")
    public String addProduct(Model model)
    {
        Product product = new Product();
        product.setProductCategory("Instrument");
        product.setProductCondition("New");
        product.setProductStatus("Active");

        model.addAttribute("product",product);
        return "addProduct";
    }
    @RequestMapping(value= "/admin/productInventory/addProduct", method= RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product")Product product, BindingResult result, HttpServletRequest request)
    {
        if(result.hasErrors())
        {
            return "addProduct";
        }
        productDao.addProduct(product);

        MultipartFile productImage=product.getProductImage();
        String rootDirectory=request.getSession().getServletContext().getRealPath("/");
        path= Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");
        System.out.println("your path is "+ path.toString());
        if(productImage != null && !productImage.isEmpty())
        {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (IOException e) {
                throw  new RuntimeException("Product Image saving fail",e);
            }
        }
        return "redirect:/admin/productInventory";
    }


    @RequestMapping("/admin/productInventory/deleteProduct/{productId}")
    public String deleteProduct(@PathVariable String productId, Model model, HttpServletRequest request)throws IOException
    {
        String rootDirectory=request.getSession().getServletContext().getRealPath("/");
        path= Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+productId+".png");
        productDao.deleteProduct(Integer.parseInt(productId));
        if(Files.exists(path))
        {
            try
            {
                Files.delete(path);
            }catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/admin/productInventory/editProduct/{productId}")
    public String editProduct(@PathVariable String productId,Model model)
    {
        Product product= productDao.getProductById(Integer.parseInt(productId));
        model.addAttribute("product",product);
        return "editProduct";
    }
    @RequestMapping(value= "/admin/productInventory/editProduct", method= RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product")Product product,BindingResult result, HttpServletRequest request)
    {
        if(result.hasErrors())
        {
            return "editProduct";
        }

        MultipartFile productImage=product.getProductImage();
        String rootDirectory=request.getSession().getServletContext().getRealPath("/");
        path= Paths.get(rootDirectory+"\\WEB-INF\\resources\\images\\"+product.getProductId()+".png");

        if(productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (IOException e) {
                throw new RuntimeException("Product Image saving fail", e);
            }
        }
        productDao.updateProduct(product);
        return "redirect:/admin/productInventory";
    }
}
