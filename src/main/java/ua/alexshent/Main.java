package ua.alexshent;

import ua.alexshent.storage.Storage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        //Storage.getInstance().seed();

        Analyst analyst = new Analyst();

        MenuItem menuItem1 = new MenuItem("Students Number By Group", () -> {
            String studentsNumberByGroup = analyst.studentsNumberByGroup();
            System.out.println(studentsNumberByGroup);
        });

        MenuItem menuItem2 = new MenuItem("Average Grade By Group", () -> {
            String averageGradeByGroup = analyst.averageGradeByGroup();
            System.out.println(averageGradeByGroup);
        });

        MenuItem menuItem3 = new MenuItem("Subjects With Best And Worst Grade", () -> {
            String subjectsWithBestAndWorstGrade = analyst.subjectsWithBestAndWorstGrade();
            System.out.println(subjectsWithBestAndWorstGrade);
        });

        MenuItem menuItem4 = new MenuItem("Students With Average Grade Greater Than", () -> {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
            System.out.print("average grade = ");
            String userInput;
            try {
                userInput = bufferedReader.readLine();
            } catch (IOException e) {
                throw new ReadLineException(e.getMessage());
            }
            int averageGrade = Integer.parseInt(userInput);
            String studentsWithAverageGradeGreaterThan = analyst.studentsWithAverageGradeGreaterThan(averageGrade);
            System.out.println(studentsWithAverageGradeGreaterThan);
        });

        MenuItem menuItem5 = new MenuItem("Educator By Name", () -> {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
            System.out.print("educator name = ");
            String userInput;
            try {
                userInput = bufferedReader.readLine();
            } catch (IOException e) {
                throw new ReadLineException(e.getMessage());
            }
            String educator = analyst.educatorByName(userInput);
            System.out.println(educator);
        });

        MenuItem menuItem6 = new MenuItem("Group By Name", () -> {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
            System.out.print("group name = ");
            String userInput;
            try {
                userInput = bufferedReader.readLine();
            } catch (IOException e) {
                throw new ReadLineException(e.getMessage());
            }
            String group = analyst.groupsByName(userInput);
            System.out.println(group);
        });

        Menu menu = new Menu();
        menu.addItem(menuItem1);
        menu.addItem(menuItem2);
        menu.addItem(menuItem3);
        menu.addItem(menuItem4);
        menu.addItem(menuItem5);
        menu.addItem(menuItem6);
        menu.run();
    }
}
