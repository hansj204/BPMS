package kr.ac.kpu.user;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {
    public String findByUserId(String userId);
}
