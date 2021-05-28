package kr.ac.kpu.domain;


import kr.ac.kpu.entity.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.Predicate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerSpecification {

    public static String like(String value) {
        return "%" + value + "%";
    }

    public static Specification<BusinessCustomer> searchCustomer(CustomerSearchVM searchCondition) {

        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if(!searchCondition.getCustomerId().isEmpty())             predicates.add(cb.like(root.get("customerId"), like(searchCondition.getCustomerId())));
            if(!searchCondition.getCustomerName().isEmpty())               predicates.add(cb.like(root.get("customerName"), like(searchCondition.getCustomerName())));
            if(!searchCondition.getManager().isEmpty())             predicates.add(cb.like(root.get("manager"), like(searchCondition.getManager())));

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}
