package com.example.bai_1.service;

import com.example.bai_1.model.Customer;
import com.example.bai_1.repository.CustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private static CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> display() {
        return customerRepository.display();
    }
}
