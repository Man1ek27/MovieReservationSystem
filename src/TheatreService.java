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

    private Connection connection;

    public TheatreService() {
        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

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

    public void deleteTheatre(int theatreId) {
        try {
//            // Usuń powiązania z tabeli admin_theatre
//            String sql1 = "DELETE FROM admin_theatre WHERE theatre_id = ?";
//            try (PreparedStatement ps = connection.prepareStatement(sql1)) {
//                ps.setInt(1, theatreId);
//                ps.executeUpdate();
//            }

            // Usuń kino z tabeli theatre
            String sql2 = "DELETE FROM theatre WHERE theatre_id = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql2)) {
                ps.setInt(1, theatreId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // tu możesz dodać obsługę błędów (np. rzucić wyjątek dalej)
        }
    }

}
