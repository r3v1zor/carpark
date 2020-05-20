package com.ssu.carpark.controller;

import com.ssu.carpark.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
    private final UserRepository userRepository;

    public MainController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public String getAllUsers(Model model) {
        model.addAttribute("user", userRepository.findAll());
        return "index";
    }
}
