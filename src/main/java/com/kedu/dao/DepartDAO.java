package com.kedu.dao;

import java.util.List;
import com.kedu.dto.DepartDTO;

public interface DepartDAO {

    void insertDept(DepartDTO dept);            // 부서 등록
    List<DepartDTO> selectAllDepts();           // 전체 부서 조회
    DepartDTO selectDeptById(int deptId);       // 특정 부서 조회
    void updateDept(DepartDTO dept);            // 부서 정보 수정
    void deleteDept(int deptId);              // 부서 삭제
}
