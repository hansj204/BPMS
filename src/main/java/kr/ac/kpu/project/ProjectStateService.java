package kr.ac.kpu.project;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.ProjectState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ProjectStateService {

    @Autowired
    private ProjetStateRepository stateRepository;

    public List<ProjectState> getStateList() throws Exception {
        return stateRepository.findAll();
    }
}