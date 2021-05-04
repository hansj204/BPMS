package kr.ac.kpu.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public String getUser(String  userId) throws Exception {
        return employeeRepository.findByUserId(userId);
    }
}