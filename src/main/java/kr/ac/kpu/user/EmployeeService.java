package kr.ac.kpu.user;

import kr.ac.kpu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> getUserList() throws Exception {
        return employeeRepository.findAll();
    }

    public Employee getUser(String  userId) throws Exception {
        return employeeRepository.findByUserId(userId);
    }

    public Employee loginUser(String userId, String password) throws Exception {
        return employeeRepository.findByUserId(userId);
    }

    public void editUser(Employee employee) throws Exception {

        System.out.println(employee.getUserId());

        if(null == employee.getUserId()) {
            employee.setUserId("2168" + String.format("%02d", getEmployeeCnt()));
            employee.setEnteredDate(new Date());

            System.out.println(employee.getUserId());
        }

        employeeRepository.save(employee);
    }

    public long getEmployeeCnt() throws Exception {
        return employeeRepository.count();
    }

    public void deleteUser(String userId) throws Exception {
        employeeRepository.deleteById(userId);
    }
}