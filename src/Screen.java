package src;

import java.util.List;
import java.util.ArrayList;

public class Screen {
    private int screenId;
    private String name;
    private int capacity;
    private int theatreId;
    //    private List<Rows> rows;
    //    private List<Show>
    //TO DO: Uwzględnić rows w konstruktorach, gettery, settery dla nich jak rows beda

    private Theatre theatre;

    public Screen(int screenId, String name, int capacity, int theatreId, List<String> rows) {
        this.screenId = screenId;
        this.name = name;
        this.capacity = capacity;
        this.theatreId = theatreId;
    }

    public Screen(int screenId, String name, int capacity, Theatre theatre, List<String> rows) {
        this.screenId = screenId;
        this.name = name;
        this.capacity = capacity;
        this.theatre = theatre;
        this.theatreId = (theatre != null) ? theatre.getTheatreId() : 0; // Set theatreId from object
    }

    public int getScreenId() {
        return screenId;
    }

    public void setScreenId(int screenId) {
        this.screenId = screenId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getTheatreId() {
        return theatreId;
    }

    public void setTheatreId(int theatreId) {
        this.theatreId = theatreId;
    }

    public Theatre getTheatre() {
        return theatre;
    }

}
