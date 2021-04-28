package kr.ac.kpu.activity;

import com.google.gson.Gson;
import kr.ac.kpu.entity.Activity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ActivityController {

    @Autowired
    ActivityService activityService;

    @GetMapping("/manageActivity")
    public String getActivityList(Model model) throws Exception {
        List<Activity> activityList = activityService.getActivityList();

        model.addAttribute("activityList", new Gson().toJson(activityList));
        model.addAttribute("pageLink", "manageActivity.jsp");
        return "layout";
    }
}
