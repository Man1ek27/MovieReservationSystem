package src;

import java.util.Date;

public class Booking {
    private int bookingId;
    private Date bookingTime;
    private double totalAmount;
    private int userId;
    private int showId;
    private String status;

    static private int id =0;

    public Booking(Date time, double totalAmount, int userId, int showId){
        this.bookingId = ++id;
        this.bookingTime = time;
        this.totalAmount = totalAmount;
        this.userId = userId;
        this.showId = showId;
    }


    // Możliwe wartości: PENDING, CONFIRMED, CANCELLED

    //GETTERS
    public int getBookingId() {return bookingId;}
    public String getStatus() {return status;}
    public Date getBookingTime() {return bookingTime;}
    public double getTotalAmount() {return totalAmount;}
    public int getUserId() {return userId;}
    public int getShowId() {return showId;}

    //SETTERS
    public void setBookingId(int bookingId) {this.bookingId = bookingId;}
    public void setShowId(int showId) {this.showId = showId;}
    public void setBookingTime(Date bookingTime) {this.bookingTime = bookingTime;}
    public void setTotalAmount(double totalAmount) {this.totalAmount = totalAmount;}
    public void setUserId(int userId) {this.userId = userId;}
    public void setStatus(String status) {this.status = status;}
}

