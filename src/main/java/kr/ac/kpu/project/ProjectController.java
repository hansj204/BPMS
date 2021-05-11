package kr.ac.kpu.project;

import com.google.gson.Gson;
import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.entity.ProjectState;
import kr.ac.kpu.user.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
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
        model.addAttribute("pageLink", "/manage/manageProject.jsp");
        return "/layout/grid_layout";
    }

    @GetMapping("/detailProject")
    public String viewProject(@ModelAttribute("projectCode") String projectCode, Model model) throws Exception {
        List<BusinessCustomer> customerList = customerService.getCustomerList();
        List<ProjectState> stateList = stateService.getStateList();

        model.addAttribute("customerList", new Gson().toJson(customerList));
        model.addAttribute("stateList", stateList);
        model.addAttribute("project", (projectCode.length() > 0)? new Gson().toJson(projectService.getProject(projectCode)) : "[]");
        model.addAttribute("pageLink", "/detail/detailProject.jsp");
        model.addAttribute("haveObj", (projectCode.length() > 0)? true : false);
        return "/layout/grid_layout";
    }

    @PostMapping("/detailProject")
    public String editProject(BusinessProject businessProject) throws Exception {
        projectService.editProject(businessProject);
        return "redirect:/manageProject";
    }

    @DeleteMapping("/deleteProject")
    public String deleteProject(@ModelAttribute("projectCode") String projectCode) throws Exception {
        projectService.deleteProject(projectCode);
        return "redirect:/manageProject";
    }
}