package ss10.controller;

import ss10.model.Customer;
import ss10.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")

public class CustomerServlet extends HttpServlet{
    private static CustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> list = customerService.display();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ss10/display-customer.jsp");
        requestDispatcher.forward(request,response);
    }
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
