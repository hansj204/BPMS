package kr.ac.kpu.customer;

import kr.ac.kpu.domain.ActivitySpecification;
import kr.ac.kpu.domain.CustomerSpecification;
import kr.ac.kpu.entity.*;
import kr.ac.kpu.project.ProjectRepository;
import kr.ac.kpu.project.ProjectService;
import kr.ac.kpu.user.ProjectUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ProjectUserRepository projectUserRepository;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectRepository projectRepository;

    public List<BusinessCustomer> getCustomerList() throws Exception {
        return customerRepository.findAll();
    }

    public List<BusinessCustomer> getCustomerYList() throws Exception {
        return customerRepository.findAllByUseYN("Y");
    }

    public List<BusinessCustomer> searchCustomerList(CustomerSearchVM customerSearchVM) throws Exception {
        return customerRepository.findAll(CustomerSpecification.searchCustomer(customerSearchVM));
    }

    public BusinessCustomer getCustomer(String customerId) throws Exception {
        return customerRepository.findByCustomerId(customerId);
    }

    public void editCustomer(BusinessCustomer businessCustomer) throws Exception {

        System.out.println(businessCustomer.getUseYN().equals("N"));

        if(businessCustomer.getUseYN().equals("N")) {
            BusinessProject businessProject = projectService.getProjectCustomer(businessCustomer.getCustomerId());
            businessProject.setProjectState(projectService.getState("CD"));
            projectRepository.save(businessProject);

            projectUserRepository.deleteAllByProjectUser_ProejctCode(businessProject.getProjectCode());
        }

        customerRepository.save(businessCustomer);
    }

}