package fr.cinema.controllers;

import fr.cinema.entities.Film;
import fr.cinema.entities.Hall;
import fr.cinema.entities.Session;
import fr.cinema.repositories.FilmRepository;
import fr.cinema.repositories.HallRepository;
import fr.cinema.repositories.SessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

@Controller
public class AdminController {

    @Autowired
    private HallRepository hallRepository;
    
    @Autowired
    private FilmRepository filmRepository;
    
    @Autowired
    private SessionRepository sessionRepository;

    @GetMapping("/admin/panel/halls")
    public String halls(Model model) {
        model.addAttribute("halls", hallRepository.findAll());
        return "halls";
    }
    
    @PostMapping("/admin/panel/halls")
    public String createHall(@RequestParam String serialNumber, 
                            @RequestParam Integer seatsCount) {
        Hall hall = new Hall(serialNumber, seatsCount);
        hallRepository.save(hall);
        return "redirect:/admin/panel/halls";
    }

    @GetMapping("/admin/panel/films")
    public String films(Model model) {
        model.addAttribute("films", filmRepository.findAll());
        return "films";
    }
    
    @PostMapping("/admin/panel/films")
    public String createFilm(@RequestParam String title,
                            @RequestParam Integer releaseYear,
                            @RequestParam Integer ageRestriction,
                            @RequestParam String description,
                            @RequestParam(required = false) MultipartFile poster) throws IOException {
        
        String posterUrl = null;
        if (poster != null && !poster.isEmpty()) {
            // Save poster to disk with unique filename
            String uploadDir = "/tmp/cinema-uploads/";
            File uploadDirectory = new File(uploadDir);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs();
            }
            
            String originalFilename = poster.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String uniqueFilename = UUID.randomUUID().toString() + extension;
            
            File destinationFile = new File(uploadDir + uniqueFilename);
            poster.transferTo(destinationFile);
            
            posterUrl = "images/" + uniqueFilename;
        }
        
        Film film = new Film(title, releaseYear, ageRestriction, description, posterUrl);
        filmRepository.save(film);
        return "redirect:/admin/panel/films";
    }

    @GetMapping("/admin/panel/sessions")
    public String sessions(Model model) {
        model.addAttribute("sessions", sessionRepository.findAll());
        model.addAttribute("films", filmRepository.findAll());
        model.addAttribute("halls", hallRepository.findAll());
        return "sessions";
    }
    
    @PostMapping("/admin/panel/sessions")
    public String createSession(@RequestParam Long filmId,
                               @RequestParam Long hallId,
                               @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") LocalDateTime dateTime,
                               @RequestParam Double ticketPrice) {
        
        Film film = filmRepository.findById(filmId).orElseThrow();
        Hall hall = hallRepository.findById(hallId).orElseThrow();
        
        Session session = new Session(film, hall, dateTime, ticketPrice);
        sessionRepository.save(session);
        return "redirect:/admin/panel/sessions";
    }
}

