package kr.ac.kpu.user;

import kr.ac.kpu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> getUserList() throws Exception {
        return employeeRepository.findAll();
    }

    public String getUser(String  userId) throws Exception {
        return employeeRepository.findByUserId(userId);
    }
}