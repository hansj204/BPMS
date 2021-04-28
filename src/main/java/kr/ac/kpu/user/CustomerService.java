package kr.ac.kpu.user;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.BusinessProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public List<BusinessCustomer> getCustomerList() throws Exception {
        return customerRepository.findAll();
    }
}