package kr.ac.kpu.activity;

import com.google.gson.Gson;
import kr.ac.kpu.entity.*;
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

    @Autowired
    JobStepService jobStepService;

    @GetMapping("/manageActivity")
    public String getActivityList(Model model) throws Exception {
        List<Activity> activityList = activityService.getActivityList();

        model.addAttribute("activityList", new Gson().toJson(activityList));
        model.addAttribute("pageLink", "/manage/manageActivity.jsp");
        return "/layout/grid_layout";
    }

    @GetMapping("/addActivity")
    public String addProject(Model model) throws Exception {
        List<BusinessProject> projectList = projectService.getProjectList();
        List<JobStep> jobStepList = jobStepService.getJobStepList();

        model.addAttribute("projectList", projectList);
        model.addAttribute("jobStepList", jobStepList);
        model.addAttribute("pageLink", "/detail/addActivity.jsp");
        return "/layout/grid_layout";
    }


    @PostMapping("/addActivity")
    public String addProject(Activity activity) throws Exception {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMddhhmmss");
        activity.setActivityCode("ACT" + simpleDateFormat.format(new Date()));
        activityService.addActivity(activity);
        return "/manage/manageActivity";
    }

    @PutMapping("/modifyActivity")
    public String modifyProject(List<Activity> activityList) throws Exception {
        activityService.modifyActivity(activityList);
        return "/manage/manageActivity";
    }

    @DeleteMapping("/deleteActivity")
    public String deleteProject(@ModelAttribute("code") String activityCode) throws Exception {
        activityService.deleteActivity(activityCode);
        return "/manage/manageActivity";
    }
}
