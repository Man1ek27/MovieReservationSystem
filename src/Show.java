package src;

import java.util.Date;

public class Show {
    private int showId;
    private Date showTime;
    private Date showDate;
    private double price;
    private int movieId;
    private int screenId;

    // licznik do tworzenia prostego ID
    private static int id = 0;

    /**
     * Klasa implementująca dany seans
     * @param showTime - czas seansu
     * @param showDate -  data seansu
     * @param price - cena biletu
     * @param movieId - id filmu wyświetlanego
     * @param screenId - id powiązanego ekranu/sali
     */
    public Show(Date showTime, Date showDate, double price, int movieId, int screenId) {
        this.showId = ++id;
        this.showTime = showTime;
        this.showDate = showDate;
        this.price = price;
        this.movieId = movieId;
        this.screenId = screenId;
    }

    // GETTERY
    /**
     * Lista Getterów
     */
    public int getShowId() {return showId;}
    public Date getShowTime() {return showTime;}
    public Date getShowDate() {return showDate;}
    public double getPrice() {return price;}
    public int getMovieId() {return movieId;}
    public int getScreenId() {return screenId;}

    //SETTERY
    /**
     * Lista Setterów
     */
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