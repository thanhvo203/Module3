package com.example.bai_1.controller;

import com.example.bai_1.model.User;
import com.example.bai_1.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");
      if(action == null){
          action = "";
      }
      switch (action){
          case "edit":
              showFormEdit(request,response);
              break;
          case "delete":
              deleteUser(request,response);
              break;
          default:
              showListUser(request,response);
      }
    }
    public void showListUser(HttpServletRequest request, HttpServletResponse response){
        List<User> users = userService.showList();
        request.setAttribute("users",users);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/list-user.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showFormEdit(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id",id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/edit-user.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "edit":
                editUser(request,response);
                break;
        }
    }
    public void deleteUser(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void editUser(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email =  request.getParameter("email");
        String country = request.getParameter("country");
        userService.updateUser(id,new User(name,email,country));
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
