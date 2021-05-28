package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ActivitySearchVM {

    private String activityName;
    private String startDate;
    private String endDate;
    private BusinessProject project;
    private JobStep jobStep;
    private String registrar;
}
