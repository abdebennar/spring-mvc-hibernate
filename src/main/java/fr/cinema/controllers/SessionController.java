package fr.cinema.controllers;

import fr.cinema.entities.Session;
import fr.cinema.repositories.SessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SessionController {
    
    @Autowired
    private SessionRepository sessionRepository;
    
    @GetMapping("/sessions/search")
    @ResponseBody
    public List<Session> searchSessions(@RequestParam("q") String filmName) {

        System.out.println("Searching sessions for film name: " + filmName);
        if (filmName == null || filmName.trim().isEmpty()) {
            return sessionRepository.findAll();
        }
        return sessionRepository.findByFilmTitleContaining(filmName.trim());
    }
    
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
