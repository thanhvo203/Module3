package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> display();
    void addNewProduct (Product product);
    int findByID(int id);
    void removeProduct(int id);
    void editProduct(int id, Product product);

}
