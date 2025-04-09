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
	
	public void updateDeptManager(DepartDTO dept) {
		dDao.updateDeptManager(dept);
	}
	
	public void deleteDept(Integer deptid) {
		dDao.deleteDept(deptid);
	}
	
	public List<Integer> selectUpperDept(Integer id){

		return dDao.selectUpperDept(id);
	}
}
