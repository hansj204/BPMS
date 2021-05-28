package kr.ac.kpu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.util.StringUtils;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProjectSearchVM {
    private String projectName;
    private String startDate;
    private String endDate;
    private String registrar;
    private BusinessCustomer customer;
    private ProjectState projectState;
    public boolean searchWhether = false;

}
