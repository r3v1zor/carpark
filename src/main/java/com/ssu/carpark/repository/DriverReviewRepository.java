package com.ssu.carpark.repository;

import com.ssu.carpark.domain.DriverReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverReviewRepository extends JpaRepository<DriverReview, Integer> {
}
