package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import java.io.Serializable;

@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class ProjectUserPK implements Serializable {

    @Column(name = "PROJECTCODE")
    private String proejctCode;

    @Column(name = "USERSID")
    private String userId;
}
