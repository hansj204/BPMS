package kr.ac.kpu.project;

import kr.ac.kpu.entity.BusinessCustomer;
import kr.ac.kpu.entity.ProjectState;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjetStateRepository extends JpaRepository<ProjectState, String> {
}
