package kr.ac.kpu.domain;


import kr.ac.kpu.entity.Activity;
import kr.ac.kpu.entity.ActivitySearchVM;
import kr.ac.kpu.entity.BusinessProject;
import kr.ac.kpu.entity.ProjectSearchVM;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.Predicate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ActivitySpecification {

    public static String like(String value) {
        return "%" + value + "%";
    }

    public static Specification<Activity> searchActivity(ActivitySearchVM searchCondition) {

        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if(!searchCondition.getActivityName().isEmpty())             predicates.add(cb.like(root.get("activityName"), like(searchCondition.getActivityName())));
            if(!searchCondition.getRegistrar().isEmpty())               predicates.add(cb.like(root.get("registrar"), like(searchCondition.getRegistrar())));
            if(!StringUtils.isEmpty(searchCondition.getProject()))     predicates.add(cb.equal(root.get("project").get("projectCode"), searchCondition.getProject().getProjectCode().toString()));
            if(!StringUtils.isEmpty(searchCondition.getJobStep())) predicates.add(cb.equal(root.get("jobStep").get("stepCode"), searchCondition.getJobStep().getStepCode().toString()));
            if(!searchCondition.getStartDate().isEmpty()) predicates.add(cb.greaterThanOrEqualTo(root.get("workDate"), searchCondition.getStartDate()));
            if(!searchCondition.getEndDate().isEmpty())   predicates.add(cb.lessThanOrEqualTo(root.get("workDate"), searchCondition.getEndDate()));

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }


}
