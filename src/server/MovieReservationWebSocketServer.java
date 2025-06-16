package src.server; // Możesz umieścić w osobnym pakiecie, np. src.server

import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import java.net.InetSocketAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Możesz umieścić tę klasę w osobnym pliku src/server/MovieReservationWebSocketServer.java
public class MovieReservationWebSocketServer extends WebSocketServer {

    private final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private final String DB_USER = "postgres";
    private final String DB_PASSWORD = "123qwe"; // Pamiętaj o zabezpieczeniu hasła w produkcji!

    private String authenticateAndGetRole(String username, String password) throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Sprawdź admina
            String sqlAdmin = "SELECT * FROM admin WHERE name = ? AND password = ?";
            try (PreparedStatement stmtAdmin = conn.prepareStatement(sqlAdmin)) {
                stmtAdmin.setString(1, username);
                stmtAdmin.setString(2, password);
                ResultSet rsAdmin = stmtAdmin.executeQuery();
                if (rsAdmin.next()) {
                    return "admin";  // jest adminem
                }
            }


            // Sprawdź usera
            String sqlUser = "SELECT * FROM \"user\" WHERE name = ? AND password = ?";
            try (PreparedStatement stmtUser = conn.prepareStatement(sqlUser)) {
                stmtUser.setString(1, username);
                stmtUser.setString(2, password);
                ResultSet rsUser = stmtUser.executeQuery();
                if (rsUser.next()) {
                    return "user";   // jest userem
                }
            }

            // Nie znaleziono w admin ani user
            return null;
        }
    }


    public MovieReservationWebSocketServer(int port) {
        super(new InetSocketAddress(port));
        System.out.println("WebSocket Server started on port: " + port);
    }

    @Override
    public void onOpen(WebSocket conn, ClientHandshake handshake) {
        System.out.println("New connection from " + conn.getRemoteSocketAddress().getAddress().getHostAddress());
        conn.send("Welcome to the Movie Reservation Server!"); // Wysyłamy powitanie
    }

    @Override
    public void onClose(WebSocket conn, int code, String reason, boolean remote) {
        System.out.println("Closed connection to " + conn.getRemoteSocketAddress().getAddress().getHostAddress() + " with exit code " + code + " reason: " + reason);
    }

    @Override
    public void onMessage(WebSocket conn, String message) {
        System.out.println("Received message from " + conn.getRemoteSocketAddress().getAddress().getHostAddress() + ": " + message);

        if (message.startsWith("LOGIN:")) {
            String[] parts = message.substring(6).split(":");
            if (parts.length == 2) {
                String username = parts[0];
                String password = parts[1];
                try {
                    String role = authenticateAndGetRole(username, password);
                    if (role != null) {
                        conn.send("LOGIN_SUCCESS:" + role + ":" + username);
                    } else {
                        conn.send("LOGIN_FAILED: Invalid username or password.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    conn.send("SERVER_ERROR: Database error during login.");
                }
            } else {
                conn.send("LOGIN_FAILED: Invalid login format.");
            }

        } else if (message.startsWith("ADD_MOVIE:")) {
            // TODO: Tutaj obsługa dodawania filmu do bazy danych
            // Przykład: ADD_MOVIE:Title:Description:Language:Genre:Duration:ReleaseDate(YYYY-MM-DD):PosterURL:AudioType
            conn.send("MESSAGE_ACK: " + message); // Potwierdzenie otrzymania wiadomości

        } else if (message.startsWith("REGISTER:")) {
            String[] parts = message.substring(9).split(":"); // REGISTER:user:email:password:phone
            if (parts.length == 4) {
                String username = parts[0];
                String email = parts[1];
                String password = parts[2];
                String phone = parts[3];
                try {
                    if(userNotINBaze(username, email)){
                        registerUser(username, email, password, phone);
                        conn.send("REGISTER_SUCCESS: Created " + username + "!");
                    }
                    else{
                        conn.send("REGISTER_FAILED: User exsist.");
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                    conn.send("SERVER_ERROR: Database error during register.");
                }
            } else {
                conn.send("REGISTER_FAILED: Missing data.");
            }
        } else {
            conn.send("UNKNOWN_COMMAND: " + message);
        }
    }


    @Override
    public void onError(WebSocket conn, Exception ex) {
        System.err.println("An error occurred on connection " + (conn != null ? conn.getRemoteSocketAddress() : "unknown") + ": " + ex);
    }

    @Override
    public void onStart() {
        System.out.println("Server started successfully!");
        setConnectionLostTimeout(0); // Ustaw na 0, aby wyłączyć timeout dla testów
        setConnectionLostTimeout(100); // Standardowo np. 100 sekund
    }

    // Metoda do uwierzytelniania użytkownika w bazie danych
    private boolean userNotINBaze(String username, String email) throws SQLException {
        String sql = "SELECT user_id FROM \"user\" WHERE name = ? OR email = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();
            return !rs.next(); // Zwróci false, jeśli znajdzie użytkownika
        }
    }

    private void registerUser(String username, String email, String password, String phone)throws SQLException{
        String sql = "INSERT INTO \"user\" (name, email, password, phone_number) VALUES (?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, phone);
            stmt.execute();
        }
    }

    public static void main(String[] args) {
        int port = 8887; // Port dla serwera WebSocket
        MovieReservationWebSocketServer server = new MovieReservationWebSocketServer(port);
        server.start();
        System.out.println("WebSocket server listening on port " + port);
    }
}