package kr.ac.kpu.activity;

import kr.ac.kpu.entity.Activity;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.project.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ActivityService {

    @Autowired
    private AcitivtyRepository acitivtyRepository;

    public List<Activity> getActivityList() throws Exception {
        return acitivtyRepository.findAll();
    }

    public void addActivity(Activity activity) throws Exception {
        acitivtyRepository.save(activity);
    }

    public void modifyActivity(List<Activity> activityList) throws Exception {
        acitivtyRepository.saveAll(activityList);
    }

    public void deleteActivity(String activityCode) throws Exception {
        acitivtyRepository.deleteByActivityCode(activityCode);
    }

}