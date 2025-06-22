// TheatreService.java
package src;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Klasa realizująca komunikacje Theatre.java z bazą danych
 */
public class TheatreService {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "123qwe";

    /**
     * Metoda zwracająca wszystkie dostępne i pasujące kina.
     */
    public List<Theatre> getAllTheatres() {
        List<Theatre> theatres = new ArrayList<>();
        String query = "SELECT * FROM theatre";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Theatre theatre = new Theatre(
                        rs.getInt("theatre_id"),    // dodaj id
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("city")
                );
                theatres.add(theatre);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return theatres;
    }
}
