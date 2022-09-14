package ua.alexshent.entities;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Educator extends Person {
    @OneToOne
    private Subject subject;

    public Educator() {
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
}
