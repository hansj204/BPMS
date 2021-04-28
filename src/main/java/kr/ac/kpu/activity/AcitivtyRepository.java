package kr.ac.kpu.activity;

import kr.ac.kpu.entity.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AcitivtyRepository extends JpaRepository<Activity, String> {
    void deleteByActivityCode(String activityCode);
}
