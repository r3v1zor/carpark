package com.ssu.carpark.repository;

import com.ssu.carpark.domain.BusStop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BusStopRepository extends JpaRepository<BusStop, Integer> {

}
