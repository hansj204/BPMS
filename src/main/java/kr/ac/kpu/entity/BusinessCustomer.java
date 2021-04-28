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
@Table(name = "BUSINESS_CUSTOMER")
public class BusinessCustomer {

    @Id
    @Column(name = "CUSTOMERID")
    private String customerId;

    @Column(name = "CUSTOMERNAME")
    private String customerName;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "MANAGER")
    private String manager;

    @Column(name = "MANAGERNUMBER")
    private String managerNumber;

    @Column(name = "USEYN")
    private String useYN;
}
