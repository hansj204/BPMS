package kr.ac.kpu.activity;

import kr.ac.kpu.entity.Activity;
import kr.ac.kpu.entity.BusinessProject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface AcitivtyRepository extends JpaRepository<Activity, String>, JpaSpecificationExecutor<Activity> {

    Activity findByActivityCode(String activityCode);

    public void deleteByActivityCode(String activityCode);

    public void deleteByProject(BusinessProject project);
}
