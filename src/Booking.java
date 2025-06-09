package src;

import java.util.Date;

public class Booking {
    private int bookingId;
    private Date bookingTime;
    private double totalAmount;
    private int userId;
    private int showId;

    // Możliwe wartości: PENDING, CONFIRMED, CANCELLED
    private String status;

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int  bookingId) {
        this.bookingId = bookingId;
    }

    public Date getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Date bookingTime) {
        this.bookingTime = bookingTime;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getShowId() {
        return showId;
    }

    public void setShowId(int showId) {
        this.showId = showId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

