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

    @Autowired
    private ProjectUserRepository psUserRepository;

    public List<Employee> getUserList() throws Exception {
        return employeeRepository.findAll();
    }

    public List<Employee> getProjectUserList(String projectCode) throws Exception {
        return psUserRepository.findByProjectUser(projectCode);
    }

    public Employee getUser(String  userId) throws Exception {
        return employeeRepository.findByUserId(userId);
    }

    public Employee loginUser(String userId, String password) throws Exception {
        return employeeRepository.findByUserIdAndPassword(userId, password);
    }

    public void editUser(Employee employee) throws Exception {

        if(null == employee.getUserId() || employee.getUserId().isEmpty()) {
            employee.setUserId("2168" + String.format("%02d", getEmployeeCnt() + 1));
            employee.setEnteredDate(new Date());
        }

        employeeRepository.save(employee);
    }

    public long getEmployeeCnt() throws Exception {
        return employeeRepository.count();
    }

    public void deleteUser(String userId) throws Exception {
        psUserRepository.deleteAllByProjectUser_UserId(userId);
        employeeRepository.deleteById(userId);
    }
}