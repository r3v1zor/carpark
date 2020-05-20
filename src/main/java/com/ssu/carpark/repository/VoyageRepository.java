package com.ssu.carpark.repository;

import com.ssu.carpark.domain.Driver;
import com.ssu.carpark.domain.Voyage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VoyageRepository extends JpaRepository<Voyage, Integer> {
    List<Voyage> findAllByDriver(Driver driver);

}
