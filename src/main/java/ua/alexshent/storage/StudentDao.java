package ua.alexshent.storage;

import ua.alexshent.entities.Student;

import javax.persistence.EntityManagerFactory;

public class StudentDao extends EntityDao<Student> {

    public StudentDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Student.class);
    }
}
