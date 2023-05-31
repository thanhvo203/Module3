package controller;

import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private static ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "addNewProduct":
                addNewProduct(request, response);
                break;
            case "deleteProduct":
                int id = Integer.parseInt(request.getParameter("id"));
                productService.removeProduct(id);
                response.sendRedirect("/product");
                break;
            case "editProduct":
                editProduct(request,response);
                break;
            default:
                displayProduct(request,response);
        }
    }
    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/add-new-product.jsp");
        requestDispatcher.forward(request, response);
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id",id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/edit-product.jsp");
        requestDispatcher.forward(request, response);
    }
    private List<Product> displayProduct(HttpServletRequest request, HttpServletResponse response){
        List<Product> list = productService.display();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/display-product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if(action == null){
           action = "";
       }
       switch (action){
           case "addNewProduct":
               addNewProduct(request);
               RequestDispatcher dispatcher = request.getRequestDispatcher("/view/product/add-new-product.jsp");
               dispatcher.forward(request,response);
               break;
           case "editProduct":
               editProduct(request);
               response.sendRedirect("/product");
               break;
       }
    }
    private void addNewProduct (HttpServletRequest request){
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        productService.addNewProduct(new Product(name,price,description,manufacturer));
    }
    private void editProduct (HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        productService.editProduct(id,new Product(id,name,price,description,manufacturer));
    }
}
