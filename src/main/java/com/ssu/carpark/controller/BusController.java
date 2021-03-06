package com.ssu.carpark.controller;

import com.ssu.carpark.domain.Bus;
import com.ssu.carpark.domain.BusCompany;
import com.ssu.carpark.repository.BusCompanyRepository;
import com.ssu.carpark.repository.BusRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("/buses")
public class BusController {
    private final BusRepository busRepository;
    private final BusCompanyRepository busCompanyRepository;

    public BusController(BusRepository busRepository, BusCompanyRepository busCompanyRepository) {
        this.busRepository = busRepository;
        this.busCompanyRepository = busCompanyRepository;
    }

    @GetMapping
    public String findAll(Model model) {
        List<Bus> buses = busRepository.findAll();
        List<BusCompany> busCompanies = busCompanyRepository.findAll();
        model.addAttribute("buses", buses);
        model.addAttribute("busCompanies", busCompanies);
        return "buses";
    }

    @PostMapping("add")
    public String add(Bus bus) throws ParseException {
        busRepository.save(bus);
        return "redirect:/buses";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        busRepository.deleteById(id);
        return "redirect:/buses";
    }
}
