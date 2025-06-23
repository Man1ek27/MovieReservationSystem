package src;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date; // Upewnij się, że używasz java.util.Date

public class ShowService {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "123qwe"; // Zmień na swoje hasło

    /**
     * Pobiera wszystkie seanse dla danego filmu.
     * @param movieId ID filmu, dla którego szukamy seansów.
     * @return Lista obiektów Show odpowiadających danemu filmowi.
     */
    public List<Show> getShowsByMovieId(int movieId) {
        List<Show> shows = new ArrayList<>();
        // Zmieniono SQL: Wybieramy 'show_time' zamiast 'show_date'
        String sql = "SELECT show_id, show_time, price, movie_id, screen_id FROM public.show WHERE movie_id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // Odczytujemy jako Timestamp i konwertujemy na Date
                    Date showTime = new Date(rs.getTimestamp("show_time").getTime());
                    double price = rs.getDouble("price");
                    int screenId = rs.getInt("screen_id");
                    int showId = rs.getInt("show_id");

                    Show show = new Show(showTime, price, movieId, screenId);
                    // Ponieważ showId jest generowane, ustawiamy je z bazy danych
                    show.setShowId(showId);
                    shows.add(show);
                }
            }
        } catch (SQLException e) {
            System.err.println("Błąd podczas pobierania seansów dla filmu o ID " + movieId + ": " + e.getMessage());
            e.printStackTrace();
        }
        return shows;
    }

    // Dodaj konstruktor w klasie Show, jeśli jeszcze go nie masz
    // public Show(int showId, Date showTime, Date showDate, double price, int movieId, int screenId) { ... }
}