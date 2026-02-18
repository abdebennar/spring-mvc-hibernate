package fr.cinema.repositories;

import fr.cinema.entities.Hall;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Repository
public class HallRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Hall> findAll() {
        return entityManager
                .createQuery("from Hall", Hall.class)
                .getResultList();
    }

    public Optional<Hall> findById(Long id) {
        Hall hall = entityManager.find(Hall.class, id);
        return Optional.ofNullable(hall);
    }

    @Transactional
    public void save(Hall hall) {
        entityManager.persist(hall);
    }

    @Transactional
    public void update(Hall hall) {
        entityManager.merge(hall);
    }

    @Transactional
    public void delete(Long id) {
        Hall hall = entityManager.find(Hall.class, id);
        if (hall != null) {
            entityManager.remove(hall);
        }
    }
}
