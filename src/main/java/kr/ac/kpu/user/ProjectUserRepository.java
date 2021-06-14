package kr.ac.kpu.user;

import kr.ac.kpu.entity.CompanyPosition;
import kr.ac.kpu.entity.Employee;
import kr.ac.kpu.entity.ProjectUser;
import kr.ac.kpu.entity.ProjectUserPK;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ProjectUserRepository extends JpaRepository<ProjectUser, ProjectUserPK> {

    @Query(value = "SELECT EMP FROM Employee EMP, ProjectUser PS WHERE EMP.userId = PS.projectUser.userId AND PS.projectUser.proejctCode = :projectCode")
    List<Employee> findByProjectUser(String projectCode);

/*    @Query(value = "SELECT PS FROM ProjectUser PS WHERE PS.projectUser.userId = :userId")
    List<ProjectUser> findByProjectUser_UserId(String projectCode);*/

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM ProjectUser PS WHERE PS.projectUser.proejctCode = :projectCode")
    void deleteAllByProjectUser_ProejctCode(@Param("projectCode") String projectCode);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM ProjectUser PS WHERE PS.projectUser.userId = :userId")
    void deleteAllByProjectUser_UserId(@Param("userId") String userId);

/*    @Query(value = "SELECT DISTINCT string((SELECT EMP FROM Employee EMP, ProjectUser PS " +
                    "WHERE EMP.userId = PS.projectUser.userId AND PS.projectUser.proejctCode = :projectCode) FOR XML PATH(''),1,1,'') from EMPLOYEE")
    List<Employee> findByProjectUserTxt(String projectCode);*/
}
