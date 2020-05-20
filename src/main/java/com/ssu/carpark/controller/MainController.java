package com.ssu.carpark.controller;

import com.ssu.carpark.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
    private final UserRepository userRepository;

    public MainController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/login")
    public String redirect(String param) {
        if (param.equals("admin")){
            return "admin";
        }
        else return "user";
    }
}
