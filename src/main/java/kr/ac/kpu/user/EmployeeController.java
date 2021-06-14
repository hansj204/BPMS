package kr.ac.kpu.user;

import com.google.gson.Gson;
import kr.ac.kpu.entity.Department;
import kr.ac.kpu.entity.Employee;
//import kr.ac.kpu.entity.EmployeeAuth;
import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @Autowired
    AuthService authService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    PositionService positionService;

    @GetMapping("/")
    public String start(Model model){
        return "/login";
    }

    @GetMapping("/login")
    public String showLogin(Model model){
        return "/login";
    }

    @PostMapping("/login")
    public String login(String userId, String password, HttpServletRequest request, Model model) throws Exception {
        Employee employeeInfo = employeeService.loginUser(userId, password);

        String url = "";

        if(employeeInfo != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", employeeInfo.getUserId());
            session.setAttribute("userName", employeeInfo.getUserName());
            session.setAttribute("userAuthCode", employeeInfo.getAuthority().getAuthCode());
            session.setAttribute("userAuthName", employeeInfo.getAuthority().getAuthName());

            switch (employeeInfo.getAuthority().getAuthCode()) {
                case "ALL":
                case "HR" : url = "manageUser"; break;
                case "BT" : url = "manageCustomer"; break;
                case "PM" : url = "manageProject"; break;
                case "PE" : url = "manageActivity"; break;
            }
        }else{
            model.addAttribute("errorMsg", "아이디나 비밀번호가 맞지 않습니다.");
        }

        return (employeeInfo == null)? "/login" : "redirect:/"+url;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/manageUser")
    public String getUserList(Model model) throws Exception {
        List<Employee> userList = employeeService.getUserList();

        model.addAttribute("userList", new Gson().toJson(userList));
        model.addAttribute("pageLink", "/manage/manageUser.jsp");

        return "/layout/grid_layout";
    }

    @GetMapping("/detailUser")
    public String editUser(@RequestParam(required = false) String userId, Model model) throws Exception {
        model.addAttribute("user", (null != userId)? new Gson().toJson(employeeService.getUser(userId)) : "[]");
        model.addAttribute("departmentList", departmentService.getDepartmentList());
        model.addAttribute("positionList", positionService.getPositionList());
        model.addAttribute("authList", authService.getAuthList());
        model.addAttribute("haveObj", (null != userId)? true : false);
        model.addAttribute("pageLink", "/detail/detailEmployee.jsp");

        return "/layout/grid_layout";
    }

    @PostMapping("/detailUser")
    public String editUser(@ModelAttribute Employee employee) throws Exception {
        employeeService.editUser(employee);
        return "redirect:/manageUser";
    }

    @DeleteMapping("/deleteUser")
    @ResponseBody
    public void deleteProject(@RequestParam String userId) throws Exception {
        employeeService.deleteUser(userId);
    }
}
