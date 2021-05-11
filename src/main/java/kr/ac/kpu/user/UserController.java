package kr.ac.kpu.user;

import kr.ac.kpu.entity.Department;
import kr.ac.kpu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    EmployeeService employeeService;

    @Autowired
    DepartmentService departmentService;

    @GetMapping("/")
    public String login(Model model){
        return "/manageProject";
    }

    @PutMapping("/login")
    public String tryLogin(String userId, Model model) throws Exception {

        model.addAttribute("userInfo", employeeService.getUser(userId));
        return "/manageProject";
    }

    @GetMapping("/manageUser")
    public String getUserList(Model model) throws Exception {
        List<Employee> userList = employeeService.getUserList();
        List<Department> departmentList = departmentService.getDepartmentList();

        model.addAttribute("userList", userList);
        model.addAttribute("departmentList", userList);
        model.addAttribute("pageLink", "/manage/manageUser.jsp");

        return "/layout/grid_layout";
    }
}
