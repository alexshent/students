package ua.alexshent;

import ua.alexshent.storage.Storage;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

public class Analyst {

    // Количество студентов в каждой группе
    public String studentsNumberByGroup() {
        StringBuilder sb = new StringBuilder();
        EntityManagerFactory entityManagerFactory = Storage.getInstance().getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(
                """
                        SELECT sg.name, COUNT(s)
                        FROM StudyGroup sg
                        JOIN sg.students s
                        GROUP BY sg.name
                        """
        );
        List<Object[]> result = query.getResultList();
        result.forEach(
                (row) -> {
                    sb.append((String) row[0]);
                    sb.append(" : ");
                    sb.append((long) row[1]);
                    sb.append("\n");
                }
        );
        entityManager.close();
        return sb.toString();
    }

    // Средний балл каждой группы
    public String averageGradeByGroup() {
        StringBuilder sb = new StringBuilder();
        EntityManagerFactory entityManagerFactory = Storage.getInstance().getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(
                """
                        SELECT sg.name, g.subject.name, AVG(g.value)
                        FROM StudyGroup sg
                        JOIN sg.students s
                        JOIN s.grades g
                        GROUP BY sg.name, g.subject.name
                        """
        );
        List<Object[]> result = query.getResultList();
        result.forEach(
                (row) -> {
                    sb.append(row[0]);
                    sb.append(" ");
                    sb.append(row[1]);
                    sb.append(" ");
                    sb.append(row[2]);
                    sb.append("\n");
                }
        );
        entityManager.close();
        return sb.toString();
    }

    // Предмет с самой худшей и самой лучшей успеваемостью
    public String subjectsWithBestAndWorstGrade() {
        StringBuilder sb = new StringBuilder();
        EntityManagerFactory entityManagerFactory = Storage.getInstance().getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(
                """
                        SELECT g.subject.name, AVG(g.value) AS grade_average_value
                        FROM Grade g
                        GROUP BY g.subject.name
                        ORDER BY grade_average_value DESC
                        """
        );
        List<Object[]> result = query.getResultList();
        Object[] best = result.get(0);
        Object[] worst = result.get(result.size() - 1);

        sb.append("Best : ");
        sb.append(best[0]);
        sb.append(" ");
        sb.append(best[1]);
        sb.append("\n");
        sb.append("Worst : ");
        sb.append(worst[0]);
        sb.append(" ");
        sb.append(worst[1]);

        entityManager.close();
        return sb.toString();
    }

    // Студентов чей средний балл выше заданного значения
    public String studentsWithAverageGradeGreaterThan(int gradeValue) {
        StringBuilder sb = new StringBuilder();
        EntityManagerFactory entityManagerFactory = Storage.getInstance().getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(
                """
                        SELECT s.lastName, s.firstName, AVG(g.value)
                        FROM Student s
                        JOIN s.grades g
                        GROUP BY s.lastName, s.firstName
                        HAVING AVG(g.value) > ?1
                        """
        );
        query.setParameter(1, (double) gradeValue);
        List<Object[]> result = query.getResultList();
        result.forEach(
                (row) -> {
                    sb.append(row[0]);
                    sb.append(" ");
                    sb.append(row[1]);
                    sb.append(" ");
                    sb.append(row[2]);
                    sb.append("\n");
                }
        );
        entityManager.close();
        return sb.toString();
    }

    // Преподавателя по имени или фамилии
    public String educatorByName(String name) {
        StringBuilder sb = new StringBuilder();
        EntityManagerFactory entityManagerFactory = Storage.getInstance().getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(
                """
                        SELECT e.firstName, e.lastName
                        FROM Educator e
                        WHERE e.firstName = ?1 OR e.lastName = ?1
                        """
        );
        query.setParameter(1, name);
        List<Object[]> result = query.getResultList();
        result.forEach(
                (row) -> {
                    sb.append(row[0]);
                    sb.append(" ");
                    sb.append(row[1]);
                    sb.append("\n");
                }
        );
        entityManager.close();
        return sb.toString();
    }

    // Поиск групп по названию (не строгое совпадение, т.е. ввод ТК выдаст 1ТК-31, 2ЛТК-2)
    public String groupsByName(String name) {
        StringBuilder sb = new StringBuilder();
        EntityManagerFactory entityManagerFactory = Storage.getInstance().getEntityManagerFactory();
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(
                """
                        SELECT sg.name
                        FROM StudyGroup sg
                        WHERE sg.name LIKE :name
                        """
        );
        query.setParameter("name", "%" + name + "%");
        List<String> result = query.getResultList();
        result.forEach(
                (row) -> {
                    sb.append(row);
                    sb.append("\n");
                }
        );
        entityManager.close();
        return sb.toString();
    }
}
