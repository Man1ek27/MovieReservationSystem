package src;

import java.util.List;
import java.util.ArrayList;

public class Screen {
    private int screenId;
    private String name;
    private int capacity;
    private int theatreId;
    private List<Row> rows;
    // private List<Movie> movies // Pozostawiamy to jako potencjalne rozszerzenie, ale na razie skupiamy się na rzędach

    private Theatre theatre;

    static private int id=0;
    //uzywamy id aby przydzielić w prosty sposób screenId w konstruktorach

    //konstruktor bez theatre (nw co sie przyda)
    public Screen(String name, int capacity, int theatreId, List<Row> rows) {
        this.screenId = ++id;
        this.name = name;
        this.capacity = capacity;
        this.theatreId = theatreId;
        this.rows = (rows != null) ? new ArrayList<>(rows) : new ArrayList<>();
    }

    //konstruktor z theatre
    public Screen(String name, int capacity, Theatre theatre, List<Row> rows) {
        this.screenId = ++id;
        this.name = name;
        this.capacity = capacity;
        this.theatre = theatre;
        this.theatreId = (theatre != null) ? theatre.getTheatreId() : 0; // ustawiamy theatre id a jeśli nie to 0
        this.rows = (rows != null) ? new ArrayList<>(rows) : new ArrayList<>();
    }


    // Metoda dodaje pojedynczy rząd
    public void addRow(Row row) {
        if (this.rows == null) {
            this.rows = new ArrayList<>();
        }
        this.rows.add(row);
    }

    //GETTERS
    public int getScreenId() {return screenId;}
    public Theatre getTheatre() {return theatre;}
    public String getName() {return name;}
    public int getCapacity() {return capacity;}
    public int getTheatreId() {return theatreId;}
    public List<Row> getRows() {return rows;} // Getter dla rzędów

    //SETTERS
    public void setScreenId(int screenId) {this.screenId = screenId;}
    public void setName(String name) {this.name = name;}
    public void setCapacity(int capacity) {this.capacity = capacity;}
    public void setTheatreId(int theatreId) {this.theatreId = theatreId;}
    public void setRows(List<Row> rows) {this.rows = rows;} // Setter dla rzędów

}