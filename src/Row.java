package src;

import java.util.ArrayList;

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
    public void addSeat(Seat seat){
        seats.add(seat);
    }

    //GETTERY
    public ArrayList<Seat> getSeats() {return seats;}
    public int getRowId() {return rowId;}
    public int getSize(){
        return seats.size();
    }

    //SETTERY
    public void setSeats(ArrayList<Seat> seats) {this.seats = seats;}
    public void setRowId(int rowId) {this.rowId = rowId;}
}
