package fr.cinema.entities;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "films")
public class Film {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "title", nullable = false)
    private String title;
    
    @Column(name = "release_year")
    private Integer releaseYear;
    
    @Column(name = "age_restriction")
    private Integer ageRestriction;
    
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;
    
    @Column(name = "poster_url")
    private String posterUrl;
    
    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
    private List<Session> sessions;
    
    @OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
    private List<ChatMessage> chatMessages;
    
    public Film() {
    }
    
    public Film(String title, Integer releaseYear, Integer ageRestriction, String description, String posterUrl) {
        this.title = title;
        this.releaseYear = releaseYear;
        this.ageRestriction = ageRestriction;
        this.description = description;
        this.posterUrl = posterUrl;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public Integer getReleaseYear() {
        return releaseYear;
    }
    
    public void setReleaseYear(Integer releaseYear) {
        this.releaseYear = releaseYear;
    }
    
    public Integer getAgeRestriction() {
        return ageRestriction;
    }
    
    public void setAgeRestriction(Integer ageRestriction) {
        this.ageRestriction = ageRestriction;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getPosterUrl() {
        return posterUrl;
    }
    
    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }
    
    public List<Session> getSessions() {
        return sessions;
    }
    
    public void setSessions(List<Session> sessions) {
        this.sessions = sessions;
    }
    
    public List<ChatMessage> getChatMessages() {
        return chatMessages;
    }
    
    public void setChatMessages(List<ChatMessage> chatMessages) {
        this.chatMessages = chatMessages;
    }
}
