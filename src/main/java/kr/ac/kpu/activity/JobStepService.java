package kr.ac.kpu.activity;

import kr.ac.kpu.entity.JobStep;
import kr.ac.kpu.entity.ProjectState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class JobStepService {

    @Autowired
    private JobStepRepository jobStepRepository;

    public List<JobStep> getJobStepList() throws Exception {
        return jobStepRepository.findAll();
    }
}