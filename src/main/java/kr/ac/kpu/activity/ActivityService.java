package kr.ac.kpu.activity;

import kr.ac.kpu.domain.ActivitySpecification;
import kr.ac.kpu.entity.Activity;
import kr.ac.kpu.entity.ActivitySearchVM;
import kr.ac.kpu.entity.BusinessProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ActivityService {

    @Autowired
    private AcitivtyRepository acitivtyRepository;

    public List<Activity> getActivityList() throws Exception {
        return acitivtyRepository.findAll();
    }

    public Activity getActivity(String activityCode) throws Exception {
        return acitivtyRepository.findByActivityCode(activityCode);
    }

    public List<Activity> searchActivity(ActivitySearchVM activitySearchVM) throws Exception {
        return acitivtyRepository.findAll(ActivitySpecification.searchActivity(activitySearchVM));
    }

    public void editActivity(Activity activity) throws Exception {

        if(null == activity.getActivityCode() || activity.getActivityCode().isEmpty()) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYMMmmss");
            activity.setActivityCode("ACT" + simpleDateFormat.format(new Date()));

            activity.setRegisteredDate(new Date());
        }

        acitivtyRepository.save(activity);
    }

    public void deleteActivity(String activityCode) throws Exception {
        acitivtyRepository.deleteByActivityCode(activityCode);
    }

    public void deleteAllActivity(BusinessProject project) throws Exception {
        acitivtyRepository.deleteByProject(project);
    }

}