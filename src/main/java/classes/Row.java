package classes;

import java.util.ArrayList;

/**
 * Klasa pośrednia, obsługująca rzędy w sali kinowej
 * 3 konstruktory wykorzystywane odpowiednio od potrzeb
 */
public class Row {
    private ArrayList<Seat> seats = new ArrayList<>();
    private int rowId;
    private String rowType = "Classic";

    static private int id = 0;


    public Row(){
        this.rowId = ++ id;
    }
    public Row(ArrayList<Seat> seats){
        this.seats = seats;
        this.rowId = ++ id;
    }

    public Row(int rowId, String rowType, ArrayList<Seat> es) {
        this.rowId = rowId;
        this.rowType = rowType;
        this.seats = es;
    }

    //ADD seat

    /**
     * dodajemy siedzenie do rzędu
     * @param seat obiekt siedzenia
     */
    public void addSeat(Seat seat){
        seats.add(seat);
    }

    //GETTERY
    /**
     * Lista Getterów
     */
    public ArrayList<Seat> getSeats() {return seats;}
    public int getRowId() {return rowId;}
    public int getSize(){
        return seats.size();
    }

    //SETTERY
    /**
     * Lista Setterów
     */
    public void setSeats(ArrayList<Seat> seats) {this.seats = seats;}
    public void setRowId(int rowId) {this.rowId = rowId;}
}
