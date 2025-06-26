package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; // Dodaj import dla Statement

public class UserService {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "123qwe"; // Zmień na swoje hasło do bazy danych

    /**
     * Autoryzuje użytkownika na podstawie adresu e-mail i hasła.
     * @param email Adres e-mail użytkownika.
     * @param password Hasło użytkownika.
     * @return Obiekt classes.User, jeśli uwierzytelnienie powiedzie się, w przeciwnym razie null.
     * @throws SQLException Jeśli wystąpi błąd dostępu do bazy danych.
     */
    public User authenticateUser(String email, String password) throws SQLException {
        String sql = "SELECT * FROM public.\"user\" WHERE email = ? AND password = ?"; // Użyj "public.\"user\"" ze względu na słowo kluczowe "user"

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Użytkownik znaleziony i hasło się zgadza
                    return new User(
                            rs.getInt("user_id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"), // W prawdziwej aplikacji hasła nie powinny być pobierane ani przechowywane w plain text!
                            rs.getString("phone_number")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Błąd podczas autoryzacji użytkownika: " + e.getMessage());
            throw e; // Rzuć wyjątek dalej, aby kontroler mógł go obsłużyć
        }
        return null; // Użytkownik nie znaleziony lub hasło niepoprawne
    }

    /**
     * Rejestruje nowego użytkownika w bazie danych.
     * @param name Nazwa użytkownika.
     * @param email Adres e-mail użytkownika.
     * @param password Hasło użytkownika.
     * @param phoneNumber Numer telefonu użytkownika (może być null).
     * @return Zarejestrowany obiekt classes.User z przypisanym user_id z bazy danych, lub null w przypadku błędu (np. email już zajęty).
     * @throws SQLException Jeśli wystąpi błąd dostępu do bazy danych.
     */
    public User registerUser(String name, String email, String password, String phoneNumber) throws SQLException {
        // Najpierw sprawdź, czy użytkownik z danym e-mailem już istnieje
        if (getUserByEmail(email) != null) {
            System.out.println("Rejestracja nieudana: Użytkownik z tym adresem e-mail już istnieje.");
            return null; // Użytkownik już istnieje
        }

        String sql = "INSERT INTO public.\"user\" (name, email, password, phone_number) VALUES (?, ?, ?, ?) RETURNING user_id";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, phoneNumber);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        int userId = rs.getInt(1); // Pobierz wygenerowane ID użytkownika
                        return new User(userId, name, email, password, phoneNumber);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Błąd podczas rejestracji użytkownika: " + e.getMessage());
            throw e; // Rzuć wyjątek dalej
        }
        return null; // Błąd podczas rejestracji
    }

    /**
     * Pobiera użytkownika na podstawie jego adresu e-mail.
     * @param email Adres e-mail użytkownika.
     * @return Obiekt classes.User, jeśli znaleziono, w przeciwnym razie null.
     * @throws SQLException Jeśli wystąpi błąd dostępu do bazy danych.
     */
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM public.\"user\" WHERE email = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("user_id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("phone_number")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Błąd podczas pobierania użytkownika po e-mailu: " + e.getMessage());
            throw e;
        }
        return null;
    }

    // Możesz dodać inne metody, np. do aktualizacji danych użytkownika, usuwania itp.
}