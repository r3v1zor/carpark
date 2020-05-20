package com.ssu.carpark.repository;

import com.ssu.carpark.domain.BusCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusCompanyRepository extends JpaRepository<BusCompany, Integer> {
}
