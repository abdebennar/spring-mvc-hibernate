package fr.cinema.repositories;

import fr.cinema.entities.UserAvatar;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Repository
public class UserAvatarRepository {
    
    @PersistenceContext
    private EntityManager entityManager;
    
    public List<UserAvatar> findAll() {
        return entityManager
            .createQuery("from UserAvatar order by uploadedAt desc", UserAvatar.class)
            .getResultList();
    }
    
    public Optional<UserAvatar> findByUserIdentifier(String userIdentifier) {
        return entityManager
            .createQuery("from UserAvatar where userIdentifier = :userIdentifier order by uploadedAt desc", UserAvatar.class)
            .setParameter("userIdentifier", userIdentifier)
            .setMaxResults(1)
            .getResultStream()
            .findFirst();
    }
    
    @Transactional
    public void save(UserAvatar avatar) {
        entityManager.persist(avatar);
    }
}
