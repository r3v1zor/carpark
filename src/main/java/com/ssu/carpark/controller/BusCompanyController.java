package com.ssu.carpark.controller;

import com.ssu.carpark.domain.BusCompany;
import com.ssu.carpark.repository.BusCompanyRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/bus-companies")
public class BusCompanyController {
    private final BusCompanyRepository busCompanyRepository;

    public BusCompanyController(BusCompanyRepository busCompanyRepository) {
        this.busCompanyRepository = busCompanyRepository;
    }

    @GetMapping
    public String getAll(Model model) {
        List<BusCompany> busCompanies = busCompanyRepository.findAll();

        model.addAttribute("busCompanies", busCompanies);
        return "buscompanies";
    }

    @PostMapping("add")
    public String add(BusCompany busCompany) {
        busCompanyRepository.save(busCompany);
        return "redirect:/buscompanies";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        busCompanyRepository.deleteById(id);
        return "redirect:/buscompanies";
    }
}
