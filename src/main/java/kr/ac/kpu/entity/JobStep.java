package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "JOB_STEP")
public class JobStep {

    @Id
    @Column(name = "STEPCODE")
    private String stepCode;

    @Column(name = "STEPNAME")
    private String stepName;

}
