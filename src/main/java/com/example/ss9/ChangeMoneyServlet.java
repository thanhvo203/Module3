package com.example.ss9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangeMoneyServlet", value = "/ChangeMoneyServlet")
public class ChangeMoneyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double discountPercent = Double.parseDouble(request.getParameter("price")) *
                                Double.parseDouble(request.getParameter("discount"))*0.01;
        double totalMoney = Double.parseDouble(request.getParameter("price")) - discountPercent;
        String discription = request.getParameter("discription");
        request.setAttribute("Discription",discription );
        request.setAttribute("Price", request.getParameter("price"));
        request.setAttribute("DiscountPercent", request.getParameter("discount"));
        request.setAttribute("Discount",discountPercent );
        request.setAttribute("TotalPrice", totalMoney);
        RequestDispatcher r = request.getRequestDispatcher("ss9/display.jsp");
        r.forward(request,response);
    }
}
