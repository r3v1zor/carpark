package com.ssu.carpark.controller;

import com.ssu.carpark.domain.Driver;
import com.ssu.carpark.repository.DriverRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    public String addDriver(Integer id, String firstName, String lastName,
                            String dateOfBirth, String startWorkingDay, Model model) throws ParseException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dateOfB = simpleDateFormat.parse(dateOfBirth);
        Date startWorkingDate = simpleDateFormat.parse(startWorkingDay);

        Driver driver = new Driver(firstName, lastName, dateOfB, startWorkingDate);
        driver.setId(id);

        driverRepository.save(driver);

        return "redirect:/drivers";
    }

    @PostMapping("delete")
    public String delete(Integer id, Model model) {
        driverRepository.deleteById(id);
        return "redirect:/drivers";
    }
}
