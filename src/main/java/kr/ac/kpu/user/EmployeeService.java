package kr.ac.kpu.user;

import kr.ac.kpu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
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

        Employee user = getUser(userId);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        if(!user.getUserId().isEmpty() && encoder.matches(password, user.getPassword())) {
            return user;
        }

        return null;
    }

    public void editUser(Employee employee) throws Exception {

        if(null == employee.getUserId() || employee.getUserId().isEmpty()) {
            employee.setUserId("2168" + String.format("%02d", getEmployeeCnt() + 1));
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YY-MM-dd");
            employee.setEnteredDate(simpleDateFormat.format(new Date()));

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String securePw = encoder.encode(employee.getPassword());
            employee.setPassword(securePw);
        }else {
            if(!employee.getPassword().isEmpty() && null != employee.getPassword()) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String securePw = encoder.encode(employee.getPassword());
                employee.setPassword(securePw);
            }
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