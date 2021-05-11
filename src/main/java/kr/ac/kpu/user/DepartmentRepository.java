package kr.ac.kpu.user;

import kr.ac.kpu.entity.Department;
import kr.ac.kpu.entity.Employee;
import kr.ac.kpu.entity.EmployeeAuth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, String> {
}
