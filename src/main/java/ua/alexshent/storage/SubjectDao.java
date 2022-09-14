package ua.alexshent.storage;

import ua.alexshent.entities.Subject;

import javax.persistence.EntityManagerFactory;

public class SubjectDao extends EntityDao<Subject> {
    public SubjectDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Subject.class);
    }
}
