package ua.alexshent.storage;

import ua.alexshent.entities.StudyGroup;

import javax.persistence.EntityManagerFactory;

public class GroupDao extends EntityDao<StudyGroup> {
    public GroupDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, StudyGroup.class);
    }
}
