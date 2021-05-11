package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "EMPLOYEE")
public class Employee {

    @Id
    @Column(name = "USERID")
    private String userId;

    @Column(name = "USERNAME")
    private String userName;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "ENTEREDDATE")
    private Date enteredDate;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "POSITIONCODE")
    private String positionCode;

    @OneToOne
    @JoinColumn(name = "AUTHCODE")
    private Authority authority;

    @OneToOne
    @JoinColumn(name = "DEPARTMENTCODE")
    private Department department;
}
