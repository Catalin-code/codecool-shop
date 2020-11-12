package com.codecool.shop.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CheckoutServlet", urlPatterns = "/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Double> cart = (Map<String, Double>) req.getSession().getAttribute("cart");
        Map<String, Integer> cart2 = (Map<String, Integer>) req.getSession().getAttribute("cart2");
        getServletContext().getRequestDispatcher("/templates/product/checkout.jsp").forward(req, resp);
    }
}
