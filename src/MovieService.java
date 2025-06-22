package src;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MovieService {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "123qwe";

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();

        String sql = "SELECT * FROM movie";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Movie movie = new Movie(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("language"),
                        rs.getString("genre"),
                        rs.getInt("duration_minutes"),
                        rs.getDate("release_date"),
                        rs.getString("poster_url"),
                        Movie.AudioType.valueOf(rs.getString("audio_type").toUpperCase())
                );
                movies.add(movie);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movies;
    }

    public Movie addMovie(Movie movie) throws Exception {
        String sql = "INSERT INTO movie (title, description, language, genre, duration_minutes, release_date, poster_url, audio_type) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, movie.getTitle());
            pstmt.setString(2, movie.getDescription());
            pstmt.setString(3, movie.getLanguage());
            pstmt.setString(4, movie.getGenre());
            pstmt.setInt(5, movie.getDurationMinutes());
            pstmt.setDate(6, new java.sql.Date(movie.getReleaseDate().getTime()));
            pstmt.setString(7, movie.getPosterUrl());
            pstmt.setString(8, movie.getAudioType().name());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating movie failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int newId = generatedKeys.getInt(1);
                    return new Movie(
                            newId,
                            movie.getTitle(),
                            movie.getDescription(),
                            movie.getLanguage(),
                            movie.getGenre(),
                            movie.getDurationMinutes(),
                            movie.getReleaseDate(),
                            movie.getPosterUrl(),
                            movie.getAudioType()
                    );
                } else {
                    throw new SQLException("Creating movie failed, no ID obtained.");
                }
            }
        }
    }


    public void deleteMovie(int movieId) {
        String sql = "DELETE FROM movie WHERE movie_id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, movieId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Movie getMovieById(int movieId) {
        String sql = "SELECT * FROM movie WHERE movie_id = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, movieId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Movie(
                            rs.getInt("movie_id"),
                            rs.getString("title"),
                            rs.getString("description"),
                            rs.getString("language"),
                            rs.getString("genre"),
                            rs.getInt("duration_minutes"),
                            rs.getDate("release_date"),
                            rs.getString("poster_url"),
                            Movie.AudioType.valueOf(rs.getString("audio_type").toUpperCase())
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateMovie(Movie movie) throws SQLException {
        String sql = "UPDATE movie SET title=?, description=?, language=?, genre=?, duration_minutes=?, release_date=?, poster_url=?, audio_type=? WHERE movie_id=?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, movie.getTitle());
            pstmt.setString(2, movie.getDescription());
            pstmt.setString(3, movie.getLanguage());
            pstmt.setString(4, movie.getGenre());
            pstmt.setInt(5, movie.getDurationMinutes());
            pstmt.setDate(6, new java.sql.Date(movie.getReleaseDate().getTime()));
            pstmt.setString(7, movie.getPosterUrl());
            pstmt.setString(8, movie.getAudioType().name());
            pstmt.setInt(9, movie.getMovieId());

            pstmt.executeUpdate();
        }
    }



    // Możesz też dodać metodę filterByTitle używającą SQL
}
