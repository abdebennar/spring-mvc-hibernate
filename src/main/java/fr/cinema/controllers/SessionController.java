package fr.cinema.controllers;

import fr.cinema.entities.Session;
import fr.cinema.repositories.SessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class SessionController {
    
    @Autowired
    private SessionRepository sessionRepository;
    
    // TODO: Implement /sessions/search endpoint for Exercise 01 (Live Search)
    // This should return JSON with sessions matching the filmName query parameter
    
    @GetMapping("/sessions/{id}")
    public String sessionDetail(@PathVariable Long id, Model model) {
        Session session = sessionRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Session not found"));
        
        model.addAttribute("session", session);
        return "session-detail";
    }
    
    @GetMapping("/sessions")
    public String searchPage() {
        return "search";
    }
}
