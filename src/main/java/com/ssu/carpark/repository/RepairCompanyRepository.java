package com.ssu.carpark.repository;

import com.ssu.carpark.domain.RepairCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepairCompanyRepository extends JpaRepository<RepairCompany, Integer> {
}
