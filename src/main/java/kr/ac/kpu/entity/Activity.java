package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ACTIVITY")
public class Activity {

    @Id
    @Column(name = "ACTIVITYCODE")
    private String activityCode;

    @Column(name = "ACTIVITYNAME")
    private String activityName;

    @Column(name = "ACTIVITY_CONTENTS")
    private String activityContents;

    @Column(name = "WORKDATE")
    private String workDate;

    @Column(name = "WORKINGTIME")
    private String workingTime;

    @ManyToOne
    @JoinColumn(name = "PROJECTCODE")
    private BusinessProject project;

    @OneToOne
    @JoinColumn(name = "STEPCODE")
    private JobStep jobStep;

    @Column(name = "REGISTRAR", updatable = false)
    private String registrar;

    @Column(name = "RESISTER_TIMESTAMP", updatable = false)
    private Date registeredDate;
}
