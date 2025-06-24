package src;

import com.sun.prism.Texture;

public class Seat  {

    private int seatId;
    private int seatNumber;
    private String type;
    private boolean reserved = false;


    static private int id = 0;

    public Seat(int seatNumber){
        this.seatNumber = seatNumber;
        this.seatId = ++id;
    }

    public Seat(int seatId, int seatNumber, String seatType) {
        this.seatId = seatId;
        this.seatNumber = seatNumber;
        this.type = seatType;
    }

    /**
     * Klasa implementująca siedzenia
     * @param seatId - id siedzenia
     * @param seatNumber - nr siedzenia w rzędzie
     * @param seatType - typ siedzenia
     */
    public Seat(int seatId, int seatNumber, String seatType, boolean reserved) {
        this.seatId = seatId;
        this.seatNumber = seatNumber;
        this.type = seatType;
        this.reserved = reserved;
    }

    //SETTERS
    /**
     * Lista Setterów
     */
    public void setSeatId(int seatId) { this.seatId = seatId;}
    public void setSeatNumber(int seatNumber) { this.seatNumber = seatNumber;}
    public void setType(String type) {this.type = type;}

    //GETTERS
    /**
     * Lista Getterów
     */
    public int getSeatId() { return seatId;}
    public int getSeatNumber() {
        return seatNumber;
    }
    public String getType() {
        return type;
    }

    public boolean isReserved() {
        return reserved;
    }

    public void setReserved(boolean reserved) {
        this.reserved = reserved;
    }
}
