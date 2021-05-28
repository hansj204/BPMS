package kr.ac.kpu.customer;

import kr.ac.kpu.domain.ActivitySpecification;
import kr.ac.kpu.domain.CustomerSpecification;
import kr.ac.kpu.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public List<BusinessCustomer> getCustomerList() throws Exception {
        return customerRepository.findAll();
    }

    public List<BusinessCustomer> searchCustomerList(CustomerSearchVM customerSearchVM) throws Exception {
        return customerRepository.findAll(CustomerSpecification.searchCustomer(customerSearchVM));
    }

    public BusinessCustomer getCustomer(String customerId) throws Exception {
        return customerRepository.findByCustomerId(customerId);
    }

    public void editCustomer(BusinessCustomer businessCustomer) throws Exception {
        customerRepository.save(businessCustomer);
    }

    public void deleteCustomer(String customerId) throws Exception {
        customerRepository.deleteByCustomerId(customerId);
    }
}