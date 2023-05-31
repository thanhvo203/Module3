package service;

import model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductServiceImpl {
    List<Product> display();
    void addNewProduct (Product product);
    int findById(int id);
    void removeProduct(int id);
    void editProduct(int id, Product product);
}
