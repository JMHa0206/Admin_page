package com.kedu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.DepartDAOImp;
import com.kedu.dto.DepartDTO;

@Service
public class DepartService {
		
	@Autowired
	private DepartDAOImp dDao;
	
	public void insertDept(DepartDTO dto) {
		dDao.insertDept(dto);
	}
	
	public List<DepartDTO> selectAllDepts() {
		return dDao.selectAllDepts();
	}
	
	public DepartDTO selectDeptById(int deptId) {
		return dDao.selectDeptById(deptId);
	}
	
	public void updateDept(DepartDTO dept) {
		dDao.updateDept(dept);
	}
	
	public void deleteDept(Integer deptid) {
		dDao.deleteDept(deptid);
	}
}
