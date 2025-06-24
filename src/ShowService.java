package src;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date; // Upewnij się, że używasz java.util.Date


public class ShowService {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private static final String DB_USER = "postgres";

    private static final String DB_PASSWORD = "123qwe"; 

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
                    Timestamp showTime = rs.getTimestamp("show_time");

                    Show show = new Show(
                            showTime,
                            rs.getDouble("price"),
                            rs.getInt("movie_id"),
                            rs.getInt("screen_id")
                    );
                    show.setShowId(rs.getInt("show_id"));
                    shows.add(show);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shows;
    }

    public List<Show> getShowsByScreen(int screenId) {
        List<Show> shows = new ArrayList<>();
        String sql = "SELECT * FROM show WHERE screen_id = ? ORDER BY show_time";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, screenId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Timestamp showTime = rs.getTimestamp("show_time");

                    Show show = new Show(
                            showTime,
                            rs.getDouble("price"),
                            rs.getInt("movie_id"),
                            rs.getInt("screen_id")
                    );
                    show.setShowId(rs.getInt("show_id"));
                    shows.add(show);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shows;
    }

    public List<Show> getShowsForMovieInScreen(int movieId, int screenId) {
        List<Show> shows = new ArrayList<>();
        String sql = "SELECT * FROM show WHERE movie_id = ? AND screen_id = ? ORDER BY show_time";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);
            pstmt.setInt(2, screenId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Timestamp showTime = rs.getTimestamp("show_time");

                    Show show = new Show(
                            showTime,
                            rs.getDouble("price"),
                            rs.getInt("movie_id"),
                            rs.getInt("screen_id")
                    );
                    show.setShowId(rs.getInt("show_id"));
                    shows.add(show);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shows;
    }

    public void addShow(Show show) {
        String sql = "INSERT INTO show (show_time, price, movie_id, screen_id) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setTimestamp(1, new java.sql.Timestamp(show.getShowTime().getTime()));
            pstmt.setDouble(2, show.getPrice());
            pstmt.setInt(3, show.getMovieId());
            pstmt.setInt(4, show.getScreenId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateShow(Show show) throws SQLException {
        String sql = "UPDATE show SET show_time = ?, price = ?, movie_id = ?, screen_id = ? WHERE show_id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setTimestamp(1, new java.sql.Timestamp(show.getShowTime().getTime()));
            pstmt.setDouble(2, show.getPrice());
            pstmt.setInt(3, show.getMovieId());
            pstmt.setInt(4, show.getScreenId());
            pstmt.setInt(5, show.getShowId());

            pstmt.executeUpdate();
        }
    }

    public void deleteShow(int showId) throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            conn.setAutoCommit(false);

            try (PreparedStatement deleteReservations = conn.prepareStatement(
                    "DELETE FROM booking WHERE show_id = ?")) {
                deleteReservations.setInt(1, showId);
                deleteReservations.executeUpdate();
            }

            try (PreparedStatement deleteShow = conn.prepareStatement(
                    "DELETE FROM show WHERE show_id = ?")) {
                deleteShow.setInt(1, showId);
                deleteShow.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
