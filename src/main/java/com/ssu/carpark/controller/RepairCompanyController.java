package com.ssu.carpark.controller;

import com.ssu.carpark.domain.RepairCompany;
import com.ssu.carpark.repository.RepairCompanyRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/repair-companies")
public class RepairCompanyController {
    private final RepairCompanyRepository repairCompanyRepository;

    public RepairCompanyController(RepairCompanyRepository repairCompanyRepository) {
        this.repairCompanyRepository = repairCompanyRepository;
    }

    @GetMapping
    public String findAll(Model model) {
        List<RepairCompany> repairCompanies = repairCompanyRepository.findAll();
        model.addAttribute("repairCompanies", repairCompanies);
        return "repaircompanies";
    }

    @PostMapping("add")
    public String add(RepairCompany repairCompany) {
        repairCompanyRepository.save(repairCompany);
        return "redirect:/repair-companies";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        repairCompanyRepository.deleteById(id);
        return "redirect:/repair-companies";
    }
}
