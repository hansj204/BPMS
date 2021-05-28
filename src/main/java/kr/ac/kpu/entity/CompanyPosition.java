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
@Table(name = "COMPANY_POSITION")
public class CompanyPosition {

    @Id
    @Column(name = "POSITIONCODE")
    private String positionCode;

    @Column(name = "POSITIONNAME")
    private String positionName;
}
