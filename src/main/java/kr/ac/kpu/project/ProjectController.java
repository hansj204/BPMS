package kr.ac.kpu.project;

import com.google.gson.Gson;
import kr.ac.kpu.activity.ActivityService;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.customer.CustomerService;
import kr.ac.kpu.entity.Employee;
import kr.ac.kpu.entity.ProjectSearchVM;
import kr.ac.kpu.user.EmployeeService;
import kr.ac.kpu.user.ProjectUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    ProjectService projectService;

    @Autowired
    ActivityService activityService;

    @Autowired
    CustomerService customerService;

    @Autowired
    ProjectStateService stateService;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    ProjectUserRepository projectUserRepository;

    @GetMapping("/manageProject")
    public String getProjectList(Model model) throws Exception {

        List<BusinessProject> projectList = projectService.getProjectList();

        model.addAttribute("projectList", new Gson().toJson(projectList));
        model.addAttribute("customerList", new Gson().toJson(customerService.getCustomerList()));
        model.addAttribute("stateList", stateService.getStateList());
        model.addAttribute("pageLink", "/manage/manageProject.jsp");
        return "/layout/grid_layout";
    }

    @GetMapping("/searchProject")
    @ResponseBody
    public List<BusinessProject> searchProjectList(@ModelAttribute ProjectSearchVM searchCondition, Model model) throws Exception {
        return projectService.searchProjectList(searchCondition);
    }

    @GetMapping("/detailProject")
    public String viewProject(@RequestParam(required = false) String projectCode, Model model) throws Exception {
        model.addAttribute("customerList", new Gson().toJson(customerService.getCustomerList()));
        model.addAttribute("stateList", stateService.getStateList());
        model.addAttribute("project", (null != projectCode)? new Gson().toJson(projectService.getProject(projectCode)) : "[]");
        model.addAttribute("pageLink", "/detail/detailProject.jsp");
        model.addAttribute("haveObj", (null != projectCode)? true : false);
        return "/layout/grid_layout";
    }

    @GetMapping("/manageBizProject")
    public String getBizProjectList(Model model) throws Exception {

        List<BusinessProject> projectList = projectService.getProjectList();

        model.addAttribute("projectList", new Gson().toJson(projectList));
        model.addAttribute("customerList", new Gson().toJson(customerService.getCustomerList()));
        model.addAttribute("stateList", stateService.getStateList());
        model.addAttribute("pageLink", "/manage/manageProjectEmp.jsp");
        return "/layout/grid_layout";
    }

    @GetMapping("/detailBizProject")
    public String viewBizProject(@RequestParam(required = false) String projectCode, Model model) throws Exception {
        model.addAttribute("allUserList", new Gson().toJson(employeeService.getUserList()));
        model.addAttribute("userList", new Gson().toJson(employeeService.getProjectUserList(projectCode)));
        model.addAttribute("stateList", stateService.getStateList());
        model.addAttribute("project", (null != projectCode)? new Gson().toJson(projectService.getProject(projectCode)) : "[]");
        model.addAttribute("pageLink", "/detail/detailProjectEmp.jsp");
        model.addAttribute("haveObj", (null != projectCode)? true : false);
        return "/layout/grid_layout";
    }

    @PostMapping("/detailBizProject")
    public String editBizProject(@RequestParam String projectCode, @RequestParam(value = "userList[]", required = false) List<String> userList) throws Exception {
        projectService.editBizProject(projectCode, userList);
        return "redirect:/manageBizProject";
    }

    @PostMapping("/detailProject")
    public String editProject(BusinessProject businessProject) throws Exception {
        projectService.editProject(businessProject);
        return "redirect:/manageProject";
    }

    @DeleteMapping("/deleteProject")
    @ResponseBody
    public void deleteProject(@RequestParam("projectCode") String projectCode, Model model) throws Exception {
        activityService.deleteAllActivity(projectService.getProject(projectCode));
        projectUserRepository.deleteAllByProjectUser_ProejctCode(projectCode);
        projectService.deleteProject(projectCode);
    }
}