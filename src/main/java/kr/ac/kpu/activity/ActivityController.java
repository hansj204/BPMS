package kr.ac.kpu.activity;

import com.google.gson.Gson;
import kr.ac.kpu.entity.*;
import kr.ac.kpu.project.ProjectService;
import kr.ac.kpu.user.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @Autowired
    ProjectService projectService;

    @Autowired
    JobStepService jobStepService;

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/manageActivity")
    public String getActivityList(Model model) throws Exception {
        model.addAttribute("projectList", new Gson().toJson(projectService.getProjectList()));
        model.addAttribute("userList", new Gson().toJson(employeeService.getUserList()));
        model.addAttribute("jobStepList", jobStepService.getJobStepList());
        model.addAttribute("activityList", new Gson().toJson(activityService.getActivityList()));
        model.addAttribute("pageLink", "/manage/manageActivity.jsp");

        return "/layout/grid_layout";
    }

    @GetMapping("/searchActivity")
    @ResponseBody
    public List<Activity> searchProjectList(@ModelAttribute ActivitySearchVM searchCondition, Model model) throws Exception {
        return activityService.searchActivity(searchCondition);
    }

    @GetMapping("/detailActivity")
    public String addProject(@RequestParam String userId, @RequestParam(required = false) String activityCode, Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("projectList", new Gson().toJson(projectService.getUserProjectList(userId)));
        model.addAttribute("jobStepList", jobStepService.getJobStepList());
        model.addAttribute("pageLink", "/detail/detailActivity.jsp");
        model.addAttribute("activity", (null != activityCode)? new Gson().toJson(activityService.getActivity(activityCode)) : "[]");
        model.addAttribute("haveObj", (null != activityCode)? true : false);


        return "/layout/grid_layout";
    }

    @PostMapping("/detailActivity")
    public String addProject(Activity activity) throws Exception {
        activityService.editActivity(activity);
        return "redirect:/manageActivity";
    }

    @DeleteMapping("/deleteActivity")
    @ResponseBody
    public void deleteProject(@ModelAttribute("activityCode") String activityCode) throws Exception {
        activityService.deleteActivity(activityCode);
    }
}
