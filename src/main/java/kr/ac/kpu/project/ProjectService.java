package kr.ac.kpu.project;

import kr.ac.kpu.domain.ProjectSpecification;
import kr.ac.kpu.entity.*;
import kr.ac.kpu.user.ProjectUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private ProjectStateService stateService;

    @Autowired
    private ProjectUserRepository projectUserRepository;

    public List<BusinessProject> searchProjectList(ProjectSearchVM searchCondition) throws Exception {
        return projectRepository.findAll(ProjectSpecification.searchProject(searchCondition));
    }

    public BusinessProject getProject(String projectCode) throws Exception {
        return projectRepository.findByProjectCode(projectCode);
    }

    public ProjectState getState(String stateCode) throws Exception {
        return stateService.getProjectState(stateCode);
    }

    public BusinessProject getProjectCustomer(String customerId) throws Exception {
        return projectRepository.findByCustomer_CustomerId(customerId);
    }

    public List<BusinessProject> getProjectList() throws Exception {
        return projectRepository.findAll();
    }

    public List<BusinessProject> getUserProjectList(String userId) throws Exception {
        return projectRepository.findByProjectCodeIn(userId);
    }

    public void editProject(BusinessProject businessProject) throws Exception {



        if(null == businessProject.getProjectCode() || businessProject.getProjectCode().isEmpty()) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYMMmmss");

            businessProject.setProjectCode("PJ" + simpleDateFormat.format(new Date()));
            businessProject.setRegistrar("admin");
            businessProject.setRegisteredDate(new Date());

            System.out.println(1111111111);
            System.out.println(businessProject.getRegisteredDate());
        }

        businessProject.setModifier("admin");
        businessProject.setModifedDate(new Date());

        projectRepository.save(businessProject);
   }

    @Transactional
    public void editBizProject(@RequestParam String projectCode, @RequestParam List<String> userList) throws Exception {

        projectUserRepository.deleteAllByProjectUser_ProejctCode(projectCode);

        if(null == userList || userList.isEmpty()) return;

        userList.forEach(user -> {
            ProjectUser projectUser = ProjectUser.builder().projectUser(new ProjectUserPK(projectCode, user)).build();
            projectUserRepository.save(projectUser);
        });
    }

   public void deleteProject(String projectCode) throws Exception {
        projectRepository.deleteByProjectCode(projectCode);
   }

   public void deleteProjectCustomer(String customerId) {
        projectRepository.deleteByCustomer_CustomerId(customerId);
   }
}