package com.kedu.dao;

import java.util.List;

import com.kedu.dto.PermissionDTO;


public interface PermissionDAO {
	
    void insertPermission(PermissionDTO Per);            // ���� ���
    List<PermissionDTO> selectAllPermission();             // ��ü ���� ��ȸ
    PermissionDTO selectPermissionById(int Perid);    // ���� �� ��ȸ
    void updatePermission(PermissionDTO Per);            // ���� ���� ����
    void deletePermission(int Perid);             // ���� ����
	
}
