package kr.ac.kpu.user;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {

    Employee findByUserIdAndPassword(String userId, String password);
    Employee findByUserId(String userId);
    int countEmployeeBy();
}
