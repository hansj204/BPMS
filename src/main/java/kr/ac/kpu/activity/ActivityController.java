package kr.ac.kpu.activity;

import com.google.gson.Gson;
import kr.ac.kpu.entity.Activity;
import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.entity.ProjectState;
import kr.ac.kpu.project.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @Autowired
    ProjectService projectService;

    @GetMapping("/manageActivity")
    public String getActivityList(Model model) throws Exception {
        List<Activity> activityList = activityService.getActivityList();

        model.addAttribute("activityList", new Gson().toJson(activityList));
        model.addAttribute("pageLink", "manageActivity.jsp");
        return "layout";
    }

    @GetMapping("/addActivity")
    public String addProject(Model model) throws Exception {
        //List<BusinessCustomer> customerList = customerService.getCustomerList();
        List<BusinessProject> projectList = projectService.getProjectList();

        model.addAttribute("projectList", projectList);
        model.addAttribute("pageLink", "addProject.jsp");
        return "layout";
    }


    @PostMapping("/addActivity")
    public String addProject(Activity activity) throws Exception {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMddhhmmss");
        activity.setActivityCode("PJ" + simpleDateFormat.format(new Date()));

        activityService.addActivity(activity);
        return "redirect:/manageActivity";
    }

    @PutMapping("/modifyActivity")
    public String modifyProject(List<Activity> activityList) throws Exception {
        activityService.modifyActivity(activityList);
        return "redirect:/manageActivity";
    }

    @DeleteMapping("/deleteActivity")
    public String deleteProject(@ModelAttribute("code") String activityCode) throws Exception {
        activityService.deleteActivity(activityCode);
        return "redirect:/manageActivity";
    }
}
