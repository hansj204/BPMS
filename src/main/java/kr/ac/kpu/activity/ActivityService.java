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

}