package com.ssu.carpark.controller;

import com.ssu.carpark.domain.BusStop;
import com.ssu.carpark.repository.BusStopRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/busstops")
public class BusStopController {
    private final BusStopRepository busStopRepository;

    public BusStopController(BusStopRepository busStopRepository) {
        this.busStopRepository = busStopRepository;
    }

    @GetMapping
    public String findAll(Model model) {
        List<BusStop> busStops = busStopRepository.findAll();

        model.addAttribute("busStops", busStops);

        return "busStops";
    }

    @PostMapping("add")
    public String add(BusStop busStop) {
        busStopRepository.save(busStop);

        return "redirect:/busstops";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        busStopRepository.deleteById(id);
        return "redirect:/busstops";
    }
}
