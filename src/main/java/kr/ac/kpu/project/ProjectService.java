package kr.ac.kpu.project;

import kr.ac.kpu.entity.BusinessProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    public List<BusinessProject> getProjectList() throws Exception {
        return projectRepository.findAll();
    }

    public void addProject(BusinessProject businessProject) throws Exception {
       projectRepository.save(businessProject);
    }

    public void modifyProject(List<BusinessProject> businessProjectList) throws Exception {
        projectRepository.saveAll(businessProjectList);
    }

    public void deleteProject(String projectCode) throws Exception {
        projectRepository.deleteByProjectCode(projectCode);
    }
}