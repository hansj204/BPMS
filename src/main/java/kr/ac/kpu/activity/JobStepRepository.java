package kr.ac.kpu.activity;

import kr.ac.kpu.entity.JobStep;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobStepRepository extends JpaRepository<JobStep, String> {

}
