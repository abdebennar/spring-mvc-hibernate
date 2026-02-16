package fr.cinema.repositories;

import fr.cinema.entities.ChatMessage;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class ChatMessageRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<ChatMessage> findLast20ByFilmId(Long filmId) {
        return entityManager
                .createQuery("from ChatMessage c where c.film.id = :filmId order by c.sentAt desc", ChatMessage.class)
                .setParameter("filmId", filmId)
                .setMaxResults(20)
                .getResultList();
    }

    @Transactional
    public void save(ChatMessage message) {
        entityManager.persist(message);
    }
}
