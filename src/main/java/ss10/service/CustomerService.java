package ss10.service;

import ss10.model.Customer;
import ss10.repository.CustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private static CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> display() {
        return customerRepository.display();
    }
}
