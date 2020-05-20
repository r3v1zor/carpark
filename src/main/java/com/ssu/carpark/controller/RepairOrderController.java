package com.ssu.carpark.controller;

import com.ssu.carpark.domain.Bus;
import com.ssu.carpark.domain.RepairCompany;
import com.ssu.carpark.domain.RepairOrder;
import com.ssu.carpark.repository.BusRepository;
import com.ssu.carpark.repository.RepairCompanyRepository;
import com.ssu.carpark.repository.RepairOrderRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/repair-orders")
public class RepairOrderController {
    private final RepairOrderRepository repairOrderRepository;
    private final RepairCompanyRepository repairCompanyRepository;
    private final BusRepository busRepository;

    public RepairOrderController(RepairOrderRepository repairOrderRepository, RepairCompanyRepository repairCompanyRepository, BusRepository busRepository) {
        this.repairOrderRepository = repairOrderRepository;
        this.repairCompanyRepository = repairCompanyRepository;
        this.busRepository = busRepository;
    }

    @GetMapping
    public String findAll(Model model) {
        List<RepairOrder> repairOrders = repairOrderRepository.findAll();
        model.addAttribute("repairOrders", repairOrders);
        List<RepairCompany> repairCompanies = repairCompanyRepository.findAll();
        model.addAttribute("repairCompanies", repairCompanies);
        List<Bus> buses = busRepository.findAll();
        model.addAttribute("buses", buses);
        return "repairorders";
    }

    @PostMapping("add")
    public String add(RepairOrder repairOrder) {
        repairOrderRepository.save(repairOrder);

        return "redirect:/repair-orders";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        repairOrderRepository.deleteById(id);
        return "redirect:/repair-orders";
    }
}
