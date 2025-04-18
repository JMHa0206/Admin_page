package com.kedu.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kedu.dao.CompanyDAO;
import com.kedu.dto.CompanyDTO;

@Service
public class CompanyService {

    @Autowired
    private CompanyDAO companyDAO;


    public CompanyDTO getCompany() {
        return companyDAO.getCompany();
    }

    public void updateCompany(CompanyDTO dto) {
        System.out.println("✅ [Service] 전달받은 DTO: " + dto);
        companyDAO.updateCompany(dto);
    }
}
