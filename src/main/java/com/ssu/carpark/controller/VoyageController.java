package com.ssu.carpark.controller;

import com.ssu.carpark.domain.Bus;
import com.ssu.carpark.domain.Driver;
import com.ssu.carpark.domain.Route;
import com.ssu.carpark.domain.Voyage;
import com.ssu.carpark.repository.BusRepository;
import com.ssu.carpark.repository.DriverRepository;
import com.ssu.carpark.repository.RouteRepository;
import com.ssu.carpark.repository.VoyageRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/voyages")
public class VoyageController {
    private final VoyageRepository voyageRepository;
    private final BusRepository busRepository;
    private final DriverRepository driverRepository;
    private final RouteRepository routeRepository;

    public VoyageController(VoyageRepository voyageRepository, BusRepository busRepository, DriverRepository driverRepository, RouteRepository routeRepository) {
        this.voyageRepository = voyageRepository;
        this.busRepository = busRepository;
        this.driverRepository = driverRepository;
        this.routeRepository = routeRepository;
    }

    @GetMapping
    public String findAll(Model model) {
        List<Voyage> voyages = voyageRepository.findAll();
        model.addAttribute("voyages", voyages);
        List<Driver> drivers = driverRepository.findAll();
        model.addAttribute("drivers", drivers);
        List<Route> routes = routeRepository.findAll();
        model.addAttribute("routes", routes);
        List<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses);
        return "voyages";
    }

    @PostMapping("add")
    public String add(Voyage voyage) {
        voyageRepository.save(voyage);
        return "redirect:/voyages";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        voyageRepository.deleteById(id);
        return "redirect:/voyages";
    }
}
