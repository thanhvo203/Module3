package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Laptop",1000,"126Gb","Samsung"));
        productList.add(new Product(2,"TV",2000,"48in","Samsung"));
        productList.add(new Product(3,"Computer",500,"512Gb","Dell"));
        productList.add(new Product(4,"Pan",100,"Power","ASIA"));
        productList.add(new Product(5,"Air conditioner",1500,"Power saving","Samsung"));
    }
    @Override
    public List<Product> display() {
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {
        productList.add(product);
    }

    @Override
    public int findByID(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId() == id){
                return i;
            }
        }
        return id;
    }

    @Override
    public void removeProduct(int id) {
        productList.remove(findByID(id));
    }

    @Override
    public void editProduct(int id, Product product) {
        productList.add(findByID(id),product);
    }

}
