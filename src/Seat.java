package src;

import com.sun.prism.Texture;

class Seat  {

    private int seatID;
    private int seatNumber;
    private String type;

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getSeatID() {
        return seatID;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public String getType() {
        return type;
    }
}
