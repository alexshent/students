package ua.alexshent;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Menu {
    private final List<MenuItem> items;

    public Menu() {
        items = new ArrayList<>();
    }

    public void addItem(MenuItem item) {
        if (item != null) {
            items.add(item);
        }
    }

    public void run() {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int index = -1;
        do {
            System.out.println("----------------------");
            for (int i=0; i < items.size(); i++) {
                System.out.println(items.get(i).label() + " : " + (i+1));
            }
            System.out.println("exit : 0");
            System.out.println("----------------------");
            System.out.print("# ");
            String userInput;
            try {
                userInput = bufferedReader.readLine();
            } catch (IOException e) {
                throw new ReadLineException(e.getMessage());
            }
            index = Integer.parseInt(userInput);
            if (index > 0 && index <= items.size()) {
                items.get(index-1).action().run();
            }
        } while (index != 0);
    }
}
