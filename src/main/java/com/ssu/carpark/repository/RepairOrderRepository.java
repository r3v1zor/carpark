package com.ssu.carpark.repository;

import com.ssu.carpark.domain.RepairOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepairOrderRepository extends JpaRepository<RepairOrder, Integer> {
}
