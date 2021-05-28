package kr.ac.kpu.domain;


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

public class ProjectSpecification {

    public static String like(String value) {
        return "%" + value + "%";
    }

    public static Specification<BusinessProject> searchProject(ProjectSearchVM searchCondition) {

        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if(!searchCondition.getProjectName().isEmpty())             predicates.add(cb.like(root.get("projectName"), like(searchCondition.getProjectName())));
            if(!searchCondition.getRegistrar().isEmpty())               predicates.add(cb.like(root.get("registrar"), like(searchCondition.getRegistrar())));
            if(!StringUtils.isEmpty(searchCondition.getCustomer()))     predicates.add(cb.equal(root.get("customer").get("customerId"), searchCondition.getCustomer().getCustomerId().toString()));
            if(!StringUtils.isEmpty(searchCondition.getProjectState())) predicates.add(cb.equal(root.get("projectState").get("stateCode"), searchCondition.getProjectState().getStateCode().toString()));
            if(!searchCondition.getStartDate().isEmpty())               predicates.add(cb.greaterThanOrEqualTo(root.get("startDate"), searchCondition.getStartDate()));
            if(!searchCondition.getEndDate().isEmpty())                 predicates.add(cb.lessThanOrEqualTo(root.get("endDate"), searchCondition.getEndDate()));

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }


}
