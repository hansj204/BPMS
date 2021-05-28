package kr.ac.kpu.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "BUSINESS_PROJECT")
public class BusinessProject {

    @Id
    @Column(name = "PROJECTCODE")
    private String projectCode;

    @Column(name = "PROJECTNAME")
    private String projectName;

    @Column(name = "PROJECTCONTENTS")
    private String projectContents;

    @Column(name = "MANAGER")
    private String manager;

    @Column(name = "STARTDATE")
    private String startDate;

    @Column(name = "ENDDATE")
    private String endDate;

    @Column(name = "REGISTRAR", updatable = false)
    private String registrar;

    @Column(name = "RESISTER_TIMESTAMP", updatable = false)
    private Date registeredDate;

    @Column(name = "MODIFIER")
    private String modifier;

    @Column(name = "MODIFY_TIMESTAMP")
    private Date modifedDate;

    @ManyToOne
    @JoinColumn(name = "CUSTOMERID")
    private BusinessCustomer customer;

    @ManyToOne
    @JoinColumn(name = "STATECODE")
    private ProjectState projectState;

    @Column(name = "TOTALBUDGET")
    private Integer totalBudget;

    @Column(name = "BUDGETUNIT")
    private String budgetUnit;

    @Column(name = "USEYN")
    private String useYN;
}
