package kr.ac.kpu.user;

import kr.ac.kpu.entity.BusinessCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<BusinessCustomer, String> {
}
