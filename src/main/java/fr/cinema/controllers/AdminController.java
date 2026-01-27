package fr.cinema.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
public class AdminController {

    @GetMapping("/admin/panel/halls")
    public String Halls() {

        return "admin/halls";
    }

    @GetMapping("/admin/panel/films")
    public String Films() {

        return "/admin/panel/films";
    }

    @GetMapping("/admin/panel/sessions")
    public String Sessions() {

        return "/admin/panel/sessions";
    }
}
