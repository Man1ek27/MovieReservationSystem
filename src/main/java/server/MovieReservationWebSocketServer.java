package server;

import classes.Row;
import classes.Seat;
import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;


import java.net.InetSocketAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
        conn.send("Welcome to the classes.Movie Reservation Server!"); // Wysyłamy powitanie
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
        } else if (message.startsWith("REQUEST_SEATS:")){
            int screenId = Integer.parseInt(message.substring("REQUEST_SEATS:".length()));

            // Pobierz dane z bazy PostgreSQL
            String seatsData = null;
            try {
                seatsData = getSeatsFromDatabase(screenId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // Wyślij odpowiedź do klienta
            conn.send("SEATS_DATA:" + seatsData);

        }
        else if (message.startsWith("RESERVED_SEATS:")){

            //Wyciąganie intów po dwukropku
            String numbersPart = message.substring("RESERVED_SEATS:".length()).trim();

            List<Integer> seats = new ArrayList<>();
            if (!numbersPart.isEmpty()) {
                String[] numbers = numbersPart.split("-");
                for (String num : numbers) {
                    if (!num.isEmpty()) { // dodatkowa ochrona
                        seats.add(Integer.parseInt(num));
                    }
                }
            }

            try {
                updateSeats(seats);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        else {
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

    private String getSeatsFromDatabase(int screenId) throws SQLException{
        String sql = "SELECT r.row_id, r.row_type, s.seat_id, s.seat_number, s.type, s.status\n" +
                "FROM row r JOIN seat s ON r.row_id = s.row_id\n" +
                "WHERE r.screen_id = ?\n" +
                "ORDER BY r.row_id, s.seat_number\n";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, screenId);
            ResultSet rs = stmt.executeQuery();

            // Mapowanie wyników do obiektów
            Map<Integer, Row> rowMap = new LinkedHashMap<>();
            while (rs.next()) {
                int rowId = rs.getInt("row_id");
                String rowType = rs.getString("row_type");
                int seatId = rs.getInt("seat_id");
                int seatNumber = rs.getInt("seat_number");
                String seatType = rs.getString("type");
                boolean status = rs.getBoolean("status");

                // Pobierz lub utwórz rząd
                Row row = rowMap.computeIfAbsent(rowId, id -> new Row(rowId, rowType, new ArrayList<>()));
                // Dodaj miejsce do rzędu
                row.getSeats().add(new Seat(seatId, seatNumber, seatType, status));
            }

            // Budowanie stringa do wysłania po WebSocket
            StringBuilder result = new StringBuilder();
            for (Row row : rowMap.values()) {
                if (result.length() > 0) result.append("|");
                result.append(row.getRowId()).append(":");
                List<String> seatStrings = new ArrayList<>();
                for (Seat seat : row.getSeats()) {
                    seatStrings.add(seat.getSeatId() + "-" + seat.getSeatNumber() + "-" + seat.getType() + "-" + seat.isReserved());
                }
                result.append(String.join(",", seatStrings));
            }
            return result.toString();

        }
    }


    private void updateSeats(List<Integer> ids) throws SQLException {
        if (ids == null || ids.isEmpty()) return; // nic nie rób, jeśli lista pusta

        String placeholders = ids.stream()
                .map(i -> "?")
                .collect(Collectors.joining(","));

        String sql = "UPDATE seat SET status = true WHERE seat_id IN (" + placeholders + ")";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Ustawiamy parametry
            for (int i = 0; i < ids.size(); i++) {
                stmt.setInt(i + 1, ids.get(i));
            }

            System.out.println("Aktualizuję miejsca: " + ids);
            int updated = stmt.executeUpdate();
            System.out.println("Zmieniono wierszy: " + updated);
        }
    }


    public static void main(String[] args) {
        int port = 8887; // Port dla serwera WebSocket
        MovieReservationWebSocketServer server = new MovieReservationWebSocketServer(port);
        server.start();
        System.out.println("WebSocket server listening on port " + port);
    }
}