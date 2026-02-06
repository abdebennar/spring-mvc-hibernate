package fr.cinema.entities;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "sessions")
public class Session {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "film_id", nullable = false)
    private Film film;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "hall_id", nullable = false)
    private Hall hall;
    
    @Column(name = "date_time", nullable = false)
    private LocalDateTime dateTime;
    
    @Column(name = "ticket_price", nullable = false)
    private Double ticketPrice;
    
    public Session() {
    }
    
    public Session(Film film, Hall hall, LocalDateTime dateTime, Double ticketPrice) {
        this.film = film;
        this.hall = hall;
        this.dateTime = dateTime;
        this.ticketPrice = ticketPrice;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Film getFilm() {
        return film;
    }
    
    public void setFilm(Film film) {
        this.film = film;
    }
    
    public Hall getHall() {
        return hall;
    }
    
    public void setHall(Hall hall) {
        this.hall = hall;
    }
    
    public LocalDateTime getDateTime() {
        return dateTime;
    }
    
    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }
    
    public Double getTicketPrice() {
        return ticketPrice;
    }
    
    public void setTicketPrice(Double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }
}
