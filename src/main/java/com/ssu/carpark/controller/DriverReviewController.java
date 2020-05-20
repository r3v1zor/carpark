package com.ssu.carpark.controller;

import com.ssu.carpark.domain.Driver;
import com.ssu.carpark.domain.DriverReview;
import com.ssu.carpark.repository.DriverRepository;
import com.ssu.carpark.repository.DriverReviewRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/driver-reviews")
public class DriverReviewController {
    private final DriverReviewRepository driverReviewRepository;
    private final DriverRepository driverRepository;

    public DriverReviewController(DriverReviewRepository driverReviewRepository, DriverRepository driverRepository) {
        this.driverReviewRepository = driverReviewRepository;
        this.driverRepository = driverRepository;
    }

    @GetMapping
    public String findAll(Model model) {
        List<DriverReview> driverReviews = driverReviewRepository.findAll();
        List<Driver> drivers = driverRepository.findAll();
        model.addAttribute("driverReviews", driverReviews);
        model.addAttribute("drivers", drivers);
        return "driverreviews";
    }

    @PostMapping("add")
    public String add(DriverReview driverReview) {
        driverReviewRepository.save(driverReview);
        return "redirect:/driver-reviews";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        driverReviewRepository.deleteById(id);
        return "redirect:/driver-reviews";
    }
}
