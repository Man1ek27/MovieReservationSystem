package src;

public class BookedSeat {
    private int bookedSeatId;
    private int bookingId;
    private int seatId;
    private int showId;
    private String status;

    private static int id = 0;

    /**
     * Klasa bookedSeat
     * @param bookingId id bookingu
     * @param seatId id siedzenia
     * @param showId id danego seansu
     * @param status status seansu
     */
    public BookedSeat(int bookingId, int seatId, int showId, String status) {
        this.bookedSeatId = ++id;
        this.bookingId = bookingId;
        this.seatId = seatId;
        this.showId = showId;
        this.status = status;
    }

    // GETTERY
    /**
     * Lista getterów
     */
    public int getBookedSeatId() { return bookedSeatId; }
    public int getBookingId() { return bookingId; }
    public int getSeatId() { return seatId; }
    public int getShowId() { return showId; }
    public String getStatus() { return status; }

    // SETTERY
    /**
     * Lista setterów
     */
    public void setBookedSeatId(int bookedSeatId) { this.bookedSeatId = bookedSeatId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    public void setSeatId(int seatId) { this.seatId = seatId; }
    public void setShowId(int showId) { this.showId = showId; }
    public void setStatus(String status) { this.status = status; }

    /**
     * Wykorzystywane do debugowania
     * @return zwraca standardowe parametry klasy booked seat
     */
    @Override
    public String toString() {
        return "BookedSeat{" +
                "bookedSeatId=" + bookedSeatId +
                ", bookingId=" + bookingId +
                ", seatId=" + seatId +
                ", showId=" + showId +
                ", status='" + status + '\'' +
                '}';
    }
}