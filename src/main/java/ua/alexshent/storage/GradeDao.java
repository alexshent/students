package ua.alexshent.storage;

import ua.alexshent.entities.Grade;

import javax.persistence.EntityManagerFactory;

public class GradeDao extends EntityDao<Grade> {
    public GradeDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Grade.class);
    }
}
