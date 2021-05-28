package kr.ac.kpu.customer;

import kr.ac.kpu.entity.Activity;
import kr.ac.kpu.entity.BusinessCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<BusinessCustomer, String>, JpaSpecificationExecutor<BusinessCustomer> {
    public BusinessCustomer findByCustomerId(String customerId);

    public void deleteByCustomerId(String customerId);
}
