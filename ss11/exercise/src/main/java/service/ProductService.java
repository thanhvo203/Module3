package service;

import model.Product;
import repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class ProductService implements IProductServiceImpl{
    private static ProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> display() {
        List<Product> list = productRepository.display();
        return list;
    }

    @Override
    public void addNewProduct(Product product) {
        productRepository.addNewProduct(product);
    }

    @Override
    public int findById(int id) {
        return productRepository.findByID(id);
    }

    @Override
    public void removeProduct(int id) {
        productRepository.removeProduct(id);
    }

    @Override
    public void editProduct(int id, Product product) {
        productRepository.editProduct(id,product);
    }
}
