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
@Table(name = "PROJECT_STATE")
public class ProjectState {

    @Id
    @Column(name = "STATECODE")
    private String stateCode;

    @Column(name = "STATENAME")
    private String stateName;
}
