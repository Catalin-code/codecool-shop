package com.codecool.shop.controller;

import com.codecool.shop.dao.ProductCategoryDao;
import com.codecool.shop.dao.ProductDao;
import com.codecool.shop.dao.implementation.ProductCategoryDaoMem;
import com.codecool.shop.dao.implementation.ProductDaoMem;
import com.codecool.shop.config.TemplateEngineUtil;
import com.codecool.shop.model.Item;
import com.codecool.shop.model.Product;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/"})
public class ProductController extends HttpServlet {
    public Map<String, Item> cart = new HashMap<String, Item>();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDao productDataStore = ProductDaoMem.getInstance();
        ProductCategoryDao productCategoryDataStore = ProductCategoryDaoMem.getInstance();


        TemplateEngine engine = TemplateEngineUtil.getTemplateEngine(req.getServletContext());
        WebContext context = new WebContext(req, resp, req.getServletContext());
        context.setVariable("category", productCategoryDataStore.find(1));
        context.setVariable("products", productDataStore.getBy(productCategoryDataStore.find(1)));
        // // Alternative setting of the template context
        // Map<String, Object> params = new HashMap<>();
        // params.put("category", productCategoryDataStore.find(1));
        // params.put("products", productDataStore.getBy(productCategoryDataStore.find(1)));
        // context.setVariables(params);


        for (int i = 0; i <= productDataStore.getAll().size(); i++) {
            if (req.getParameter("id") != null){
                System.out.println(cart.get("id").getPrice());
                System.out.println(cart.get("id").getQuantity());
                if (cart.containsKey(req.getParameter("id"))){
                    int newQuantity = cart.get(req.getParameter("id")).getQuantity() + 1;
//                    cart.replace(req.getParameter("id"),
//                            cart.get(req.getParameter("id")),
//                                    cart.get(req.getParameter("id")) + Float.parseFloat(req.getParameter("price").split(" ")[0]));
                    cart.replace(req.getParameter("id"),
                            cart.get(req.getParameter("id")),
                                new Item(Float.parseFloat(req.getParameter("price").split(" ")[0]) * newQuantity, newQuantity));
                } else {
                    cart.put(req.getParameter("id"), new Item(Float.parseFloat(req.getParameter("price").split(" ")[0]), 1));
//                    cart.put(req.getParameter("id"), Float.parseFloat(req.getParameter("price").split(" ")[0]));
                }
            }
        }
        req.getSession().setAttribute("cart", cart);


        engine.process("product/index.jsp", context, resp.getWriter());
    }
}
