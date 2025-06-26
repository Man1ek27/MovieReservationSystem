package classes;

import java.util.Date;

public class Show {
    private int showId;
    private Date showTime;
    private double price;
    private int movieId;
    private int screenId;

    private static int id = 0;

    /**
     * Klasa implementująca dany seans
     * @param price - cena biletu
     * @param movieId - id filmu wyświetlanego
     * @param screenId - id powiązanego ekranu/sali
     */
    public Show(Date showTime, double price, int movieId, int screenId) {
        this.showId = ++id;
        this.showTime = showTime;
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
    public double getPrice() {return price;}
    public int getMovieId() {return movieId;}
    public int getScreenId() {return screenId;}

    //SETTERY
    /**
     * Lista Setterów
     */
    public void setShowId(int showId) {this.showId = showId;}
    public void setShowTime(Date showTime) {this.showTime = showTime;}
    public void setPrice(double price) {this.price = price;}
    public void setMovieId(int movieId) {this.movieId = movieId;}
    public void setScreenId(int screenId) {this.screenId = screenId;}

    @Override
    public String toString() {
        return "classes.Show{" +
                "showId=" + showId +
                ", showTime=" + showTime +
                ", price=" + price +
                ", movieId=" + movieId +
                ", screenId=" + screenId +
                '}';
    }
}