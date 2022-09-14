package ua.alexshent.storage;

import ua.alexshent.entities.Educator;

import javax.persistence.EntityManagerFactory;

public class EducatorDao extends EntityDao<Educator> {
    public EducatorDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Educator.class);
    }
}
