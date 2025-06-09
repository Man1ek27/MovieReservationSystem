package src;

import com.sun.prism.Texture;

class Seat  {

    private int seatId;
    private int seatNumber;
    private String type;

    static private int id = 0;

    public Seat(int seatNumber){
        this.seatNumber = seatNumber;
        this.seatId = ++id;
    }


    //SETTERS
    public void setSeatId(int seatId) { this.seatId = seatId;}
    public void setSeatNumber(int seatNumber) { this.seatNumber = seatNumber;}
    public void setType(String type) {this.type = type;}

    //GETTERS
    public int getSeatId() { return seatId;}
    public int getSeatNumber() {
        return seatNumber;
    }
    public String getType() {
        return type;
    }
}
