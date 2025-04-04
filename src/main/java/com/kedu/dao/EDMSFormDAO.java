package com.kedu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kedu.dto.EDMSFormDTO;

@Repository
public class EDMSFormDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    private static final String NAMESPACE = "EDMSForm";

    public List<EDMSFormDTO> findAllForms() {
        return mybatis.selectList(NAMESPACE + ".selectFormList");
    }

    public EDMSFormDTO findFormById(int formId) {
        return mybatis.selectOne(NAMESPACE + ".selectFormById", formId);
    }

    public void insertForm(EDMSFormDTO form) {
    	mybatis.insert(NAMESPACE + ".insertForm", form);
    }

    public void updateForm(EDMSFormDTO form) {
    	mybatis.update(NAMESPACE + ".updateForm", form);
    }

    public void deleteForm(int formId) {
    	mybatis.delete(NAMESPACE + ".deleteForm", formId);
    }
}

