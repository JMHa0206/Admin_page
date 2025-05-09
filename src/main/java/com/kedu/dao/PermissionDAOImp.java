package com.kedu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PermissionDTO;

@Repository
public class PermissionDAOImp implements PermissionDAO{
	
	private static final String namespace = "Permission";


	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertPermission(PermissionDTO per) {
		sqlSession.insert(namespace + ".insertPermission", per);
	}

	@Override
	public List<PermissionDTO> selectAllPermission() {
		return sqlSession.selectList(namespace + ".selectAllPermission");
	}

	@Override
	public PermissionDTO selectPermissionById(int perId) {
		return sqlSession.selectOne(namespace + ".selectPermissionById", perId);
	}

	@Override
	public void updatePermission(PermissionDTO per) {
		sqlSession.update(namespace + ".updatePermission", per);
	}

	@Override
	public void deletePermission(int perId) {
		sqlSession.delete(namespace + ".deletePermission", perId);
	}
	
	    public void assignPermission(int empId, int perId) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("emp_id", empId);
	        params.put("per_id", perId);
	        sqlSession.update(namespace + ".assignPermission", params);
	    }
	    // 👉 루프 방식
	    public void assignPermissionBatch(List<Integer> empIds, int perId) {
	        for (int empId : empIds) {
	            assignPermission(empId, perId);
	        }
	    }
	}
	