package src;

import src.Screen;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Klasa realizująca komunikacje klasy Screen z bazą danych
 */
public class ScreenService {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "123qwe";

    public List<Screen> getScreensForTheatre(int theatreId) {
        List<Screen> screens = new ArrayList<>();
        String sql = "SELECT * FROM screen WHERE theatre_id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, theatreId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Screen screen = new Screen(
                            rs.getInt("screen_id"),
                            rs.getString("name"),
                            rs.getInt("capacity"),
                            rs.getInt("theatre_id")
                    );
                    screens.add(screen);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return screens;
    }

    // Możesz też dodać addScreen(Screen screen)
}
