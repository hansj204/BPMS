package kr.ac.kpu.project;

import com.google.gson.Gson;
import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.entity.ProjectState;
import kr.ac.kpu.user.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    ProjectService projectService;

    @Autowired
    CustomerService customerService;

    @Autowired
    ProjectStateService stateService;

    @GetMapping("/manageProject")
    public String getProjectList(Model model) throws Exception {

        List<BusinessProject> projectList = projectService.getProjectList();

        model.addAttribute("projectList", new Gson().toJson(projectList));
        model.addAttribute("pageLink", "manageProject.jsp");

        return "layout";
    }

    @GetMapping("/addProject")
    public String addProject(Model model) throws Exception {
        List<BusinessCustomer> customerList = customerService.getCustomerList();
        List<ProjectState> stateList = stateService.getStateList();

        model.addAttribute("customerList", new Gson().toJson(customerList));
        model.addAttribute("stateList", stateList);
        model.addAttribute("pageLink", "addProject.jsp");
        return "layout";
    }

    @PostMapping("/addProject")
    public String addProject(BusinessProject businessProject) throws Exception {
        businessProject.setCode("PJ2018168693");
        businessProject.setRegistrar("admin");
        businessProject.setRegisteredDate(new Date());
        businessProject.setModifier("admin");
        businessProject.setModifedDate(new Date());

        projectService.addProject(businessProject);
        return "/manageProject";
    }

}
