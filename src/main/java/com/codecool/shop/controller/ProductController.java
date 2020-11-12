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
    public Map<String, Double> cart = new HashMap<String, Double>();
    public Map<String, Integer> cart2 = new HashMap<String, Integer>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
            if (req.getParameter("prodName") != null){
                if (cart.containsKey(req.getParameter("prodName"))){
                    cart.replace(req.getParameter("prodName"),
                            cart.get(req.getParameter("prodName")),
                            cart.get(req.getParameter("prodName")) + Double.parseDouble(req.getParameter("prodPrice").split(" ")[0]));

                    int count = cart2.getOrDefault(req.getParameter("prodName"), 0);
                    cart2.put(req.getParameter("prodName"), count + 1);

                } else {
                    cart.put(req.getParameter("prodName"), Double.parseDouble(req.getParameter("prodPrice").split(" ")[0]));
                    cart2.put(req.getParameter("prodName"), 1);
                }
            }
        req.getSession().setAttribute("cart", cart);
        req.getSession().setAttribute("cart2", cart2);
        resp.sendRedirect("/");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDao productDataStore = ProductDaoMem.getInstance();
        ProductCategoryDao productCategoryDataStore = ProductCategoryDaoMem.getInstance();


        TemplateEngine engine = TemplateEngineUtil.getTemplateEngine(req.getServletContext());
        WebContext context = new WebContext(req, resp, req.getServletContext());
        context.setVariable("category", productCategoryDataStore.find(1));
        context.setVariable("products", productDataStore.getBy(productCategoryDataStore.find(1)));



        engine.process("product/index.jsp", context, resp.getWriter());
    }
}
