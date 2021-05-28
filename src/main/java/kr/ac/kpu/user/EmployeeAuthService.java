package kr.ac.kpu.user;

import kr.ac.kpu.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class EmployeeAuthService {
/*
    @Autowired
    private EmployeeAuthRepository authRepository;

 public void getUserAuthList(String userId) throws Exception {
        //return authRepository.findByUserIdEquals(userId);
    }/*


    public void addUserAuth(String userId, List<String> authList) {
        for (int i = 0; i < authList.size(); i++) {
            EmployeeAuth employeeAuth = new EmployeeAuth();
            employeeAuth.setUserId(userId);
            employeeAuth.setAuthCode(authList.get(i));
            authRepository.save(employeeAuth);
        }
    }*/
}
