package fr.cinema.repositories;

import fr.cinema.entities.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Repository
public class SessionRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Session> findAll() {
        return entityManager
                .createQuery("from Session s join fetch s.film join fetch s.hall", Session.class)
                .getResultList();
    }

    public Optional<Session> findById(Long id) {
        Optional<Session> session = entityManager
                .createQuery("from Session s join fetch s.film join fetch s.hall where s.id = :id", Session.class)
                .setParameter("id", id)
                .getResultStream()
                .findFirst();
        return session;
    }

    public List<Session> findByFilmTitleContaining(String filmTitle) {
        return entityManager
                .createQuery("from Session s join fetch s.film f join fetch s.hall where lower(f.title) like lower(:title)", Session.class)
                .setParameter("title", "%" + filmTitle + "%")
                .getResultList();
    }

    @Transactional
    public void save(Session session) {
        entityManager.persist(session);
    }

    @Transactional
    public void update(Session session) {
        entityManager.merge(session);
    }

    @Transactional
    public void delete(Long id) {
        Session session = entityManager.find(Session.class, id);
        if (session != null) {
            entityManager.remove(session);
        }
    }
}
