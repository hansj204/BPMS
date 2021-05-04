package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "DEPARTMENT")
public class Department {

    @Id
    @Column(name = "DEPARTMENTCODE")
    private String departmentCode;

    @Column(name = "DEPARTMENTNAME")
    private String departmentName;

}
