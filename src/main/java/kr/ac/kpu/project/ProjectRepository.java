package kr.ac.kpu.project;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.BusinessProject;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<BusinessProject, String>, JpaSpecificationExecutor<BusinessProject> {

    public BusinessProject findByProjectCode(String projectCode);

    public BusinessProject findByCustomer_CustomerId(String customerId);

    @Query(value = "SELECT BP FROM BusinessProject BP, ProjectUser PU WHERE BP.projectCode = PU.projectUser.proejctCode AND PU.projectUser.userId = :userId")
    public List<BusinessProject> findByProjectCodeIn(String userId);

    public void deleteByProjectCode(String projectCode);

    public void deleteByCustomer_CustomerId(String costmerId);

}
