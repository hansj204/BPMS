package kr.ac.kpu.project;

import kr.ac.kpu.entity.BusinessProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    public BusinessProject getProject(String projectCode) throws Exception {
        return projectRepository.findByProjectCode(projectCode);
    }

    public List<BusinessProject> getProjectList() throws Exception {
        return projectRepository.findAll();
    }

    public void editProject(BusinessProject businessProject) throws Exception {

        if(0 == businessProject.getProjectCode().length()) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMddhhmmss");

            businessProject.setProjectCode("PJ" + simpleDateFormat.format(new Date()));
            businessProject.setRegistrar("admin");
            businessProject.setRegisteredDate(new Date());
        }

        businessProject.setModifier("admin");
        businessProject.setModifedDate(new Date());

        System.out.println("fffffffff");
        System.out.println(businessProject.getProjectCode());
        System.out.println(businessProject);

       projectRepository.save(businessProject);
    }

    public void modifyProject(List<BusinessProject> businessProjectList) throws Exception {
        projectRepository.saveAll(businessProjectList);
    }

    public void deleteProject(String projectCode) throws Exception {
        projectRepository.deleteByProjectCode(projectCode);
    }
}