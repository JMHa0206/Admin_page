package com.kedu.dao;

import java.util.List;

import com.kedu.dto.PermissionDTO;


public interface PermissionDAO {
	
    void insertPermission(PermissionDTO Per);            // 권한 등록
    List<PermissionDTO> selectAllPermission();             // 전체 권한 조회
    PermissionDTO selectPermissionById(int Perid);    // 권한 상세 조회
    void updatePermission(PermissionDTO Per);            // 권한 정보 수정
    void deletePermission(int Perid);             // 권한 삭제
	
}
