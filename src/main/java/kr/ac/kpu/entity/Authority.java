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
@Table(name = "AUTHORITY")
public class Authority {

    @Id
    @Column(name = "AUTHCODE")
    private String authCode;

    @Column(name = "AUTHNAME")
    private String authName;
}
