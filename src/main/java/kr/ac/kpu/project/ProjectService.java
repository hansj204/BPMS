package kr.ac.kpu.project;

import kr.ac.kpu.domain.ProjectSpecification;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.entity.ProjectSearchVM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    public List<BusinessProject> searchProjectList(ProjectSearchVM searchCondition) throws Exception {
        return projectRepository.findAll(ProjectSpecification.searchProject(searchCondition));
    }

    public BusinessProject getProject(String projectCode) throws Exception {
        return projectRepository.findByProjectCode(projectCode);
    }

    public List<BusinessProject> getProjectList() throws Exception {
        return projectRepository.findAll();
    }

    public void editProject(BusinessProject businessProject) throws Exception {

        if(null == businessProject.getProjectCode()) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYMMmmss");

            businessProject.setProjectCode("PJ" + simpleDateFormat.format(new Date()));
            businessProject.setRegistrar("admin");
            businessProject.setRegisteredDate(new Date());
        }

        businessProject.setModifier("admin");
        businessProject.setModifedDate(new Date());

        projectRepository.save(businessProject);
   }

   public void modifyProject(List<BusinessProject> businessProjectList) throws Exception {
        projectRepository.saveAll(businessProjectList);
   }

   public void deleteProject(String projectCode) throws Exception {
        projectRepository.deleteByProjectCode(projectCode);
   }
}