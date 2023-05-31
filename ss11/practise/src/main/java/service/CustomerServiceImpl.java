package service;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService{
     private static List<Customer> customerList = new ArrayList<>();
    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public void save(int id,Customer customer) {
         customerList.add(id,customer);
    }

    @Override
    public Customer findId(int id) {
        return customerList.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
       customerList.add(id,customer);
    }

    @Override
    public void delete(int id) {
       customerList.remove(id);
    }
}
