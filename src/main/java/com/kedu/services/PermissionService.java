package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.PermissionDAOImp;
import com.kedu.dto.PermissionDTO;

@Service
public class PermissionService {

	@Autowired
	private PermissionDAOImp daop;

	public void insertPer(PermissionDTO dto) {
		daop.insertPermission(dto);
	}

	public List<PermissionDTO> selectAll() {
		return daop.selectAllPermission();
	}

	public void update(PermissionDTO dto) {
		daop.updatePermission(dto);
		
	}

	public void delete(int perid) {
		daop.deletePermission(perid);
		
	}
	public PermissionDTO selectById(int id) {
	    return daop.selectPermissionById(id);
	}
	public void assignPermissionToEmployees(int perId, List<Integer> empIds) {
	    daop.assignPermissionBatch(perId, empIds);
	}
}
