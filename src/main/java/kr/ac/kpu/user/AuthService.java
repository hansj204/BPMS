package kr.ac.kpu.user;

import kr.ac.kpu.entity.Authority;
import kr.ac.kpu.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthService {

    @Autowired
    private AuthRepository authRepository;

    public List<Authority> getAuthList() throws Exception {
        return authRepository.findAll();
    }

}