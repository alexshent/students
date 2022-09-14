package ua.alexshent.entities;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
public class Grade {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToMany(mappedBy = "grades")
    private List<Student> students;

    @OneToOne
    private Subject subject;

    private int value;

    public Grade() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
