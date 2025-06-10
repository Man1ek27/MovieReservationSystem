package src;

import java.util.Date; // Import dla java.util.Date

public class Show {
    private int showId;
    private Date showTime;
    private Date showDate;
    private double price;
    private int movieId;
    private int screenId;

    // licznik do tworzenia prostego ID
    private static int id = 0;


    public Show(Date showTime, Date showDate, double price, int movieId, int screenId) {
        this.showId = ++id;
        this.showTime = showTime;
        this.showDate = showDate;
        this.price = price;
        this.movieId = movieId;
        this.screenId = screenId;
    }

    // GETTERY
    public int getShowId() {return showId;}
    public Date getShowTime() {return showTime;}
    public Date getShowDate() {return showDate;}
    public double getPrice() {return price;}
    public int getMovieId() {return movieId;}
    public int getScreenId() {return screenId;}

    //SETTERY
    public void setShowId(int showId) {this.showId = showId;}
    public void setShowTime(Date showTime) {this.showTime = showTime;}
    public void setShowDate(Date showDate) {this.showDate = showDate;}
    public void setPrice(double price) {this.price = price;}
    public void setMovieId(int movieId) {this.movieId = movieId;}
    public void setScreenId(int screenId) {this.screenId = screenId;}

    @Override
    public String toString() {
        return "Show{" +
                "showId=" + showId +
                ", showTime=" + showTime +
                ", showDate=" + showDate +
                ", price=" + price +
                ", movieId=" + movieId +
                ", screenId=" + screenId +
                '}';
    }
}