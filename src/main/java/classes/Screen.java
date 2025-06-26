package classes;

import java.util.List;
import java.util.ArrayList;

public class Screen {
    private int screenId;
    private String name;
    private int capacity;
    private int theatreId;
    private List<Row> rows;
    private List<Show> shows;
    private Theatre theatre; //chyba ze lepiej porownywac theatreid tutaj?

    static private int id=0;
    //uzywamy id aby przydzielić w prosty sposób screenId w konstruktorach

    //konstruktor bez theatre (nw co sie przyda)
    public Screen(String name, int capacity, int theatreId, List<Row> rows) {
        this.screenId = ++id;
        this.name = name;
        this.capacity = capacity;
        this.theatreId = theatreId;
        this.rows = (rows != null) ? new ArrayList<>(rows) : new ArrayList<>();
        this.shows = new ArrayList<>();
    }

    /**
     * Klasa classes.Screen, reprezentująca konkretny ekran/salę w danym Kinie (classes.Theatre)
     * @param screenId Id ekranu/sali
     * @param name nazwa ekranu/sali
     * @param capacity pojemność ekranu/sali
     * @param theatreId id kina, w którym się znajduje
     */
    public Screen(int screenId, String name, int capacity, int theatreId) {
        this.screenId = screenId;
        this.name = name;
        this.capacity = capacity;
        this.theatreId = theatreId;
        this.rows = new ArrayList<>();
        this.shows = new ArrayList<>();
    }


    //konstruktor z theatre

    /**
     * Dodatkowy konstruktor z obiektem theatre; patrz konstruktor z theatreId
     */
    public Screen(String name, int capacity, Theatre theatre, List<Row> rows) {
        this.screenId = ++id;
        this.name = name;
        this.capacity = capacity;
        this.theatre = theatre;
        this.theatreId = (theatre != null) ? theatre.getTheatreId() : 0; // ustawiamy theatre id a jeśli nie to 0
        this.rows = (rows != null) ? new ArrayList<>(rows) : new ArrayList<>();
        this.shows = new ArrayList<>();
    }


    // Metoda dodaje pojedynczy rząd

    /**
     * Metoda dodaje rząd
     * @param row obiekt rzędu
     */
    public void addRow(Row row) {
        if (this.rows == null) {
            this.rows = new ArrayList<>();
        }
        this.rows.add(row);
    }

    //dodajemy show po Id

    /**
     * dodajemy seans
     * @param show obiekt seansu
     */
    public void addShow(Show show) {
        if (this.shows == null) {
            this.shows = new ArrayList<>();
        }
        this.shows.add(show);
    }
    // Usuwamy show po Id

    /**
     * usuwanie show po id
     * @param showId - id seansu
     */
    public void removeShow(int showId) {
        if (this.shows != null) {
            this.shows.removeIf(s -> s.getShowId() == showId);
        }
    }




    //GETTERS

    /**
     * Lista Getterów
     */
    public int getScreenId() {return screenId;}
    public Theatre getTheatre() {return theatre;}
    public String getName() {return name;}
    public int getCapacity() {return capacity;}
    public int getTheatreId() {return theatreId;}
    public List<Row> getRows() {return rows;} // Getter dla rzędów
    public List<Show> getShows() {return shows;}
    public Show getShowById(int showId) {
        if (this.shows != null) {
            for (Show show : shows) {
                if (show.getShowId() == showId) {
                    return show;
                }
            }
        }
        return null; // Zwraca null, jeśli seans o danym ID nie został znaleziony
    }


    //SETTERS

    /**
     * Lista Setterów
     */
    public void setScreenId(int screenId) {this.screenId = screenId;}
    public void setName(String name) {this.name = name;}
    public void setCapacity(int capacity) {this.capacity = capacity;}
    public void setTheatreId(int theatreId) {this.theatreId = theatreId;}
    public void setRows(List<Row> rows) {this.rows = rows;} // Setter dla rzędów
    public void setShows(List<Show> shows) {this.shows = shows;}

}