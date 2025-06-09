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

    static private int id=0;

    public Screen(String name, int capacity, int theatreId, List<String> rows) {
        this.screenId = ++id;
        this.name = name;
        this.capacity = capacity;
        this.theatreId = theatreId;
    }

    public Screen(String name, int capacity, Theatre theatre, List<String> rows) {
        this.screenId = ++id;
        this.name = name;
        this.capacity = capacity;
        this.theatre = theatre;
        this.theatreId = (theatre != null) ? theatre.getTheatreId() : 0; // Set theatreId from object
    }

    //GETETRS
    public int getScreenId() {return screenId;}
    public Theatre getTheatre() {return theatre;}
    public String getName() {return name;}
    public int getCapacity() {return capacity;}
    public int getTheatreId() {return theatreId;}

    //SETTERS
    public void setScreenId(int screenId) {this.screenId = screenId;}
    public void setName(String name) {this.name = name;}
    public void setCapacity(int capacity) {this.capacity = capacity;}
    public void setTheatreId(int theatreId) {this.theatreId = theatreId;}

}
