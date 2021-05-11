package kr.ac.kpu.user;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.Employee;
import kr.ac.kpu.entity.EmployeeAuth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, EmployeeAuth> {
    public String findByUserId(String userId);
}
