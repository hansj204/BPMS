package kr.ac.kpu.user;

import kr.ac.kpu.entity.Department;
import kr.ac.kpu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    public List<Department> getDepartmentList() throws Exception {
        return departmentRepository.findAll();
    }

}