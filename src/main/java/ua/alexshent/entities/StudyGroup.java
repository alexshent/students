package ua.alexshent.entities;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
public class StudyGroup {
    @Id
    @GeneratedValue
    private UUID id;

    private String name;

    @OneToMany(mappedBy = "studyGroup")
    private List<Student> students;

    public StudyGroup() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
