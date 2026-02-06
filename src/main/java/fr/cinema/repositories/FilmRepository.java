package fr.cinema.repositories;

import fr.cinema.entities.Film;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Repository
public class FilmRepository {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public List<Film> findAll() {
        return entityManager
            .createQuery("from Film", Film.class)
            .getResultList();
    }
    
    public Optional<Film> findById(Long id) {
        Film film = entityManager.find(Film.class, id);
        return Optional.ofNullable(film);
    }
    
    public List<Film> findByTitleContaining(String title) {
        return entityManager
            .createQuery("from Film f where lower(f.title) like lower(:title)", Film.class)
            .setParameter("title", "%" + title + "%")
            .getResultList();
    }
    
    @Transactional
    public void save(Film film) {
        entityManager.persist(film);
    }
    
    @Transactional
    public void update(Film film) {
        entityManager.merge(film);
    }
    
    @Transactional
    public void delete(Long id) {
        Film film = entityManager.find(Film.class, id);
        if (film != null) {
            entityManager.remove(film);
        }
    }
}
