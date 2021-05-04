package kr.ac.kpu.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class UserController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/")
    public String login(Model model){
        return "redirect:/manageProject";
    }

    @PutMapping("/login")
    public String tryLogin(String userId, Model model) throws Exception {

        model.addAttribute("userInfo", employeeService.getUser(userId));
        return "/manageProject";
    }
}
