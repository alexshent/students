package ua.alexshent.storage;

import ua.alexshent.entities.*;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Storage {
    private static Storage instance;
    private final EntityManagerFactory entityManagerFactory;
    private final StudentDao studentDao;
    private final GroupDao groupDao;
    private final SubjectDao subjectDao;
    private final EducatorDao educatorDao;
    private final GradeDao gradeDao;

    public static synchronized Storage getInstance() {
        if (instance == null) {
            instance = new Storage();
        }
        return instance;
    }

    private Storage() {
        String persistenceUnit;
        if (isDevelopment()) {
            persistenceUnit = "pu-dev";
        } else {
            persistenceUnit = "pu-prod";
        }
        entityManagerFactory = Persistence.createEntityManagerFactory(persistenceUnit);
        studentDao = new StudentDao(entityManagerFactory);
        groupDao = new GroupDao(entityManagerFactory);
        subjectDao = new SubjectDao(entityManagerFactory);
        educatorDao = new EducatorDao(entityManagerFactory);
        gradeDao = new GradeDao(entityManagerFactory);
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }

    private boolean isDevelopment() {
        String userName = System.getenv("USERNAME");
        if (userName != null && userName.equals("alex")) {
            return true;
        }
        return false;
    }

    public void seed() {
        Subject subject1 = new Subject();
        subject1.setName("SUBJ1");
        subject1.setCode("S-001");
        subjectDao.create(subject1);

        Educator educator1 = new Educator();
        educator1.setFirstName("EducatorFN1");
        educator1.setLastName("EducatorLN1");
        educator1.setBirthdate(LocalDate.of(1970, 3, 15));
        educator1.setSubject(subject1);
        educatorDao.create(educator1);

        Subject subject2 = new Subject();
        subject2.setName("SUBJ2");
        subject2.setCode("S-002");
        subjectDao.create(subject2);

        Educator educator2 = new Educator();
        educator2.setFirstName("EFN2");
        educator2.setLastName("ELN2");
        educator2.setBirthdate(LocalDate.of(1970, 3, 15));
        educator2.setSubject(subject2);
        educatorDao.create(educator2);

        // ---------------------------

        Grade grade1 = new Grade();
        grade1.setSubject(subject1);
        grade1.setValue(10);
        gradeDao.create(grade1);

        Grade grade2 = new Grade();
        grade2.setSubject(subject1);
        grade2.setValue(8);
        gradeDao.create(grade2);

        Grade grade3 = new Grade();
        grade3.setSubject(subject2);
        grade3.setValue(6);
        gradeDao.create(grade3);

        Grade grade4 = new Grade();
        grade4.setSubject(subject2);
        grade4.setValue(4);
        gradeDao.create(grade4);

        List<Grade> gradeList1 = new ArrayList<>();
        gradeList1.add(grade1);
        gradeList1.add(grade3);

        List<Grade> gradeList2 = new ArrayList<>();
        gradeList1.add(grade2);
        gradeList1.add(grade4);

        // ------------------------------

        Student student1 = new Student();
        student1.setFirstName("FN1");
        student1.setLastName("LN1");
        student1.setBirthdate(LocalDate.now());
        student1.setEnrollmentDate(LocalDate.of(1999, 3, 11));
        student1.setGrades(gradeList1);

        Student student2 = new Student();
        student2.setFirstName("FN2");
        student2.setLastName("LN2");
        student2.setBirthdate(LocalDate.now());
        student2.setEnrollmentDate(LocalDate.of(1999, 3, 11));
        student2.setGrades(gradeList2);

        Student student3 = new Student();
        student3.setFirstName("FN3");
        student3.setLastName("LN3");
        student3.setBirthdate(LocalDate.now());
        student3.setEnrollmentDate(LocalDate.of(1999, 3, 11));

        List<Student> studentsList1 = new ArrayList<>();
        studentsList1.add(student1);
        studentsList1.add(student2);
        studentsList1.add(student3);

        StudyGroup studyGroup1 = new StudyGroup();
        studyGroup1.setName("Group1");
        studyGroup1.setStudents(studentsList1);

        groupDao.create(studyGroup1);

        // ------------------

        Student student4 = new Student();
        student4.setFirstName("FN4");
        student4.setLastName("LN4");
        student4.setBirthdate(LocalDate.now());
        student4.setEnrollmentDate(LocalDate.of(1999, 3, 11));
        student4.setGrades(gradeList1);

        Student student5 = new Student();
        student5.setFirstName("FN5");
        student5.setLastName("LN5");
        student5.setBirthdate(LocalDate.now());
        student5.setEnrollmentDate(LocalDate.of(1999, 3, 11));
        student5.setGrades(gradeList2);

        List<Student> studentsList2 = new ArrayList<>();
        studentsList2.add(student4);
        studentsList2.add(student5);

        StudyGroup studyGroup2 = new StudyGroup();
        studyGroup2.setName("Group2");
        studyGroup2.setStudents(studentsList2);

        groupDao.create(studyGroup2);

        // --------------------------


    }
}
