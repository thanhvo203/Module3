package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void save(int id,Customer customer);
    Customer findId(int id);
    void update (int id, Customer customer);
    void delete(int id);
}
