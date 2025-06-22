package src;

import com.sun.prism.Texture;

public class Seat  {

    private int seatId;
    private int seatNumber;
    private String type;

    static private int id = 0;

    public Seat(int seatNumber){
        this.seatNumber = seatNumber;
        this.seatId = ++id;
    }

    /**
     * Klasa implementująca siedzenia
     * @param seatId - id siedzenia
     * @param seatNumber - nr siedzenia w rzędzie
     * @param seatType - typ siedzenia
     */
    public Seat(int seatId, int seatNumber, String seatType) {
        this.seatId = seatId;
        this.seatNumber = seatNumber;
        this.type = seatType;
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
}
