package ua.alexshent.storage;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.Optional;
import java.util.UUID;

public class EntityDao<T> implements Dao<T> {
    private final EntityManagerFactory entityManagerFactory;
    private final Class<T> entityClass;

    public EntityDao(EntityManagerFactory entityManagerFactory, Class<T> entityClass) {
        this.entityManagerFactory = entityManagerFactory;
        this.entityClass = entityClass;
    }

    @Override
    public void create(T entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public Optional<T> read(UUID id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        T entity = entityManager.find(entityClass, id);
        entityManager.close();
        return Optional.ofNullable(entity);
    }

    @Override
    public void update(T entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void delete(UUID id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        T entity = entityManager.find(entityClass, id);
        entityManager.getTransaction().begin();
        entityManager.remove(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
