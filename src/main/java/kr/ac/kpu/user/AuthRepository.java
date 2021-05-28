package kr.ac.kpu.user;

import kr.ac.kpu.entity.Authority;
import kr.ac.kpu.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthRepository extends JpaRepository<Authority, String> {
}
