package com.codecool.shop.controller;

import com.codecool.shop.config.TemplateEngineUtil;
import com.codecool.shop.dao.ProductCategoryDao;
import com.codecool.shop.dao.ProductDao;
import com.codecool.shop.dao.implementation.ProductCategoryDaoMem;
import com.codecool.shop.dao.implementation.ProductDaoMem;
import com.codecool.shop.model.Product;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Cart", urlPatterns = "/cart")
public class CartController extends ProductController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        Map<String, Double> cart = (Map<String, Double>) req.getSession().getAttribute("cart");
        Map<String, Integer> cart2 = (Map<String, Integer>) req.getSession().getAttribute("cart2");

        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int count = cart2.getOrDefault(req.getParameter("prodName"), 0);
        if (req.getParameter("Add") != null) {

            cart.replace(req.getParameter("prodName"),
                    cart.get(req.getParameter("prodName")),
                    cart.get(req.getParameter("prodName")) + Double.parseDouble(req.getParameter("prodPrice").split(" ")[0]) / quantity);

            cart2.put(req.getParameter("prodName"), count + 1);
        } else if (req.getParameter("Remove") != null) {
            if (quantity == 1) {
                cart.remove(req.getParameter("prodName"));
                cart2.remove(req.getParameter("prodName"));
            } else {
                cart.replace(req.getParameter("prodName"),
                        cart.get(req.getParameter("prodName")),
                        cart.get(req.getParameter("prodName")) - Double.parseDouble(req.getParameter("prodPrice").split(" ")[0]) / quantity);
                cart2.put(req.getParameter("prodName"), count - 1);
            }
        }
        resp.sendRedirect("/cart");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDao productDataStore = ProductDaoMem.getInstance();
        ProductCategoryDao productCategoryDataStore = ProductCategoryDaoMem.getInstance();
        Map<String, Double> cart = (Map<String, Double>) req.getSession().getAttribute("cart");
        Map<String, Integer> cart2 = (Map<String, Integer>) req.getSession().getAttribute("cart2");
        double total = 0;
        for (double f : cart.values()) {
            total += f;
        }


        TemplateEngine engine = TemplateEngineUtil.getTemplateEngine(req.getServletContext());
        WebContext context = new WebContext(req, resp, req.getServletContext());
        context.setVariable("category", productCategoryDataStore.find(1));
        context.setVariable("products", productDataStore.getBy(productCategoryDataStore.find(1)));
        context.setVariable("cart", cart);
        context.setVariable("cart2", cart2);
        context.setVariable("total", total);


        engine.process("product/cart.jsp", context, resp.getWriter());
    }
}
