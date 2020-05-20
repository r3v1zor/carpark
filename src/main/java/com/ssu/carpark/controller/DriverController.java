package com.ssu.carpark.controller;

import com.ssu.carpark.domain.Driver;
import com.ssu.carpark.repository.DriverRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("/drivers")
public class DriverController {
    private final DriverRepository driverRepository;

    public DriverController(DriverRepository driverRepository) {
        this.driverRepository = driverRepository;
    }

    @GetMapping
    public String getAllDrivers(Model model) {
        List<Driver> drivers = driverRepository.findAll();
        model.addAttribute("drivers", drivers);
        return "drivers";
    }

    @PostMapping("add")
    public String addDriver(Driver driver) throws ParseException {
        driverRepository.save(driver);
        return "redirect:/drivers";
    }

    @PostMapping("delete")
    public String delete(Integer id, Model model) {
        driverRepository.deleteById(id);
        return "redirect:/drivers";
    }
}
