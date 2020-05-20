package com.ssu.carpark.controller;

import com.ssu.carpark.domain.BusStop;
import com.ssu.carpark.domain.Route;
import com.ssu.carpark.repository.BusStopRepository;
import com.ssu.carpark.repository.RouteRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/routes")
public class RouteController {
    private final RouteRepository routeRepository;
    private final BusStopRepository busStopRepository;

    public RouteController(RouteRepository routeRepository, BusStopRepository busStopRepository) {
        this.routeRepository = routeRepository;
        this.busStopRepository = busStopRepository;
    }

    @GetMapping
    public String getAll(Model model) {
        List<Route> routes = routeRepository.findAll();
        List<BusStop> busStops = busStopRepository.findAll();

        model.addAttribute("busStops", busStops);
        model.addAttribute("routes", routes);

        return "routes";
    }

    @PostMapping("add")
    public String add(String name) {
        Route route = new Route(name);

        routeRepository.save(route);

        return "redirect:/routes";
    }

    @PostMapping("addBusStop")
    public String addBusStop(Route route, BusStop busStop) {
        List<BusStop> busStops = route.getBusStops();

        if (busStops == null) {
            busStops = new ArrayList<>();
        }

        busStops.add(busStop);
        route.setBusStops(busStops);

        routeRepository.save(route);

        return "redirect:/routes";
    }
}
