package com.kedu.dao;

import com.kedu.dto.CompanyDTO;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAO {

    @Autowired
    private SqlSession mybatis;
    
    private static final String namespace = "CompanyMapper";

    public CompanyDTO getCompany() {
        CompanyDTO dtos = mybatis.selectOne(namespace+".getCompany");
        System.out.println("DTO 응답 : " + dtos);
        return dtos;
    }

    public void updateCompany(CompanyDTO dto) {
        System.out.println("✅ [DAO] 업데이트 시도: " + dto.getComName() + " / " + dto.getLogoPath());
        System.out.println("✅ [DAO] comName: " + dto.getComName());
        System.out.println("✅ [DAO] logoPath: " + dto.getLogoPath());
        System.out.println("✅ [DAO] comId: " + dto.getComId());

        int result = mybatis.update(namespace+".updateCompany",dto);
        System.out.println("✅ [DAO] update count: " + result);

    }
}

