package kr.ac.kpu.user;

import kr.ac.kpu.entity.CompanyPosition;
import kr.ac.kpu.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionService {

    @Autowired
    private PositionRepository positionRepository;

    public List<CompanyPosition> getPositionList() throws Exception {
        return positionRepository.findAll();
    }

}