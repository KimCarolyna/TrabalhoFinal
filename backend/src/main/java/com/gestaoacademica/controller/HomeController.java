package com.gestaoacademica.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "Bem-vindo à Gestão Acadêmica! A aplicação está rodando com Java 21 e Spring Boot 3.2.0";
    }

    @GetMapping("/api/status")
    public String status() {
        return "{\"status\": \"ok\", \"version\": \"1.0.0\", \"java_version\": \"21\"}";
    }
}
