package controller;

import model.Customer;
import service.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static CustomerServiceImpl customerService = new CustomerServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "delete":
                break;
            case "edit":
                break;
            case "view":
                break;
            default:
                listCustomer(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if(action == null){
           action = "";
       }
       switch (action) {

           case "create":
               createCustomer(request,response);
               break;
           case "delete":
               break;
           case "edit":
               break;
           default:
               break;
       }

    }
    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = customerService.findAll();
        request.setAttribute("list", list);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void createCustomer(HttpServletRequest request, HttpServletResponse response){

    }

}
