package fr.cinema.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LandingPage {

    @GetMapping("/")
    public String LandingPage() {
        return "redirect:/dashboard";
    }
}
