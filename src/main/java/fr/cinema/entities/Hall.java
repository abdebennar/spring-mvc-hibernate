package fr.cinema.entities;

import jakarta.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

@Entity
@Table(name = "halls")
public class Hall {

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
       private Long id;

       @Column(name = "serial_number", nullable = false, unique = true)
    private String serialNumber;
    
    @Column(name = "seats_count", nullable = false)
    private Integer seatsCount;

    
    @OneToMany(mappedBy = "hall", cascade = CascadeType.ALL)

       @JsonIgnore
    private List<Session> sessions;

    public Hall() {
       }

    
    public Hall(String serialNumber, Integer seatsCount) {
        this.serialNumber = serialNumber;

           this.seatsCount = seatsCount;
    }


       // Getters and Setters
    public Long getId() {
        return id;

       }

    public void setId(Long id) {

           this.id = id;
    }


       public String getSerialNumber() {
        return serialNumber;
    }

    
    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;

       }

    public Integer getSeatsCount() {
        return seatsCount;
    }

    public void setSeatsCount(Integer seatsCount) {
        this.seatsCount = seatsCount;
    }

    public List<Session> getSessions() {
        return sessions;
    }

    public void setSessions(List<Session> sessions) {
        this.sessions = sessions;
    }
}
