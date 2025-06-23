package src.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.Alert;
import src.Booking; // Zakładam, że masz klasę Booking
import src.MovieService;
import src.Theatre;

import java.util.List;
import java.util.ArrayList; // Do testów, docelowo dane z serwera

// Importy dla WebSocket (jeśli będziesz pobierać rezerwacje przez WebSocket)
// import org.java_websocket.client.WebSocketClient;
// import org.java_websocket.handshake.ServerHandshake;
// import java.net.URI;
// import com.google.gson.Gson;
// import com.google.gson.reflect.TypeToken;
// import java.lang.reflect.Type;

/**
 * Kontroler dla widoku "Moje Rezerwacje".
 * Odpowiada za wyświetlanie listy rezerwacji dla zalogowanego użytkownika.
 * Rezerwacje są pobierane na podstawie ID użytkownika.
 */
public class MyReservationsController {

    @FXML
    private Label welcomeLabel; // Opcjonalnie: aby powitać użytkownika
    @FXML
    private ListView<String> reservationsListView; // Lista do wyświetlania rezerwacji

    private int userId; // ID użytkownika, dla którego pobieramy rezerwacje
    private String username; // Nazwa użytkownika
    // private WebSocketClient wsClient; // Opcjonalnie: Jeśli używasz WebSocket do pobierania rezerwacji
    // private final Gson gson = new Gson(); // Opcjonalnie: do parsowania JSON

    public void initData(int userId, String username, Theatre theatre, MovieService movieService) {
        //TODO TUTAJ POTRZEBUJEMY KODU ZWIĄZANEGO Z BAZA DANYCH JEŚLI DOBRZE ROZUMIEM
//        this.currentUserId = userId;
//        this.currentUsername = username;
//        this.selectedTheatre = theatre;
//        this.movieService = movieService; <-- to jest źle
    }
    @FXML
    public void initialize() {
        // Tutaj możesz dodać początkową logikę, np. wyświetlić "Ładowanie rezerwacji..."
    }

    /**
     * Inicjalizuje kontroler z danymi użytkownika.
     * Wywołuje metodę pobierającą rezerwacje dla danego użytkownika.
     * @param userId ID zalogowanego użytkownika.
     * @param username Nazwa zalogowanego użytkownika.
     */
    public void initData(int userId, String username) {
        this.userId = userId;
        this.username = username;
        welcomeLabel.setText("Twoje Rezerwacje, " + username + ":");
        loadUserReservations();
    }

    // Jeśli będziesz używać WebSocket do pobierania rezerwacji, dodaj poniższą metodę
    /*
    public void setWsClient(WebSocketClient client) {
        this.wsClient = client;
        if (wsClient != null) {
            // Konfiguracja handlera wiadomości dla tego kontrolera
            // UWAGA: Potrzebujesz mechanizmu, który przekazuje konkretne wiadomości
            // do odpowiednich kontrolerów, np. przez mapowanie typów wiadomości.
            // Poniżej uproszczony przykład.
            ((MovieReservationWebSocketClient) wsClient).setMessageHandler(message -> {
                javafx.application.Platform.runLater(() -> {
                    if (message.startsWith("USER_BOOKINGS_LIST:")) {
                        String jsonBookings = message.substring("USER_BOOKINGS_LIST:".length());
                        Type bookingListType = new TypeToken<List<Booking>>(){}.getType();
                        List<Booking> receivedBookings = gson.fromJson(jsonBookings, bookingListType);
                        displayReservations(receivedBookings);
                    } else if (message.startsWith("ERROR_GET_BOOKINGS:")) {
                        showAlert(Alert.AlertType.ERROR, "Błąd", "Nie można pobrać rezerwacji: " + message.substring(19));
                    }
                });
            });

            // Wyślij żądanie rezerwacji po ustawieniu klienta WebSocket
            if (wsClient.isOpen()) {
                requestUserReservations(userId);
            } else {
                wsClient.connect(); // Spróbuj się połączyć, jeśli nie jest otwarte
            }
        }
    }

    private void requestUserReservations(int userId) {
        if (wsClient != null && wsClient.isOpen()) {
            wsClient.send("GET_USER_BOOKINGS_REQUEST:" + userId);
            System.out.println("Wysłano żądanie rezerwacji dla użytkownika ID: " + userId);
        } else {
            showAlert(Alert.AlertType.WARNING, "Brak połączenia", "Nie można pobrać rezerwacji. Brak połączenia z serwerem.");
        }
    }
    */

    /**
     * Ładuje rezerwacje dla bieżącego użytkownika.
     * W obecnej wersji jest to metoda "dummy", która generuje przykładowe rezerwacje.
     * Docelowo powinna ona wysyłać żądanie do serwera (np. przez WebSocket) i
     * pobierać faktyczne rezerwacje z bazy danych.
     */
    private void loadUserReservations() {
        reservationsListView.getItems().clear();
        // Tutaj powinna być logika pobierania rezerwacji z serwera przez WebSocket
        // Na razie dodajemy przykładowe rezerwacje:
        if (userId != 0) { // Sprawdź, czy userId jest ustawione
            List<String> dummyReservations = new ArrayList<>();
            dummyReservations.add("Film: Matrix, Kino: Cinema City, Seans: 2025-07-01 19:00, Miejsca: A1, A2, Kwota: 45 PLN");
            dummyReservations.add("Film: Interstellar, Kino: Multikino, Seans: 2025-06-28 21:30, Miejsca: H7, H8, Kwota: 60 PLN");
            if (userId == 1) { // Przykład dla konkretnego użytkownika
                dummyReservations.add("Film: Incepcja, Kino: Kinepolis, Seans: 2025-07-05 18:00, Miejsca: B3, Kwota: 25 PLN");
            }
            reservationsListView.getItems().addAll(dummyReservations);

            if (dummyReservations.isEmpty()) {
                reservationsListView.getItems().add("Brak rezerwacji dla tego użytkownika.");
            }
        } else {
            reservationsListView.getItems().add("Błąd: Nie można pobrać rezerwacji (brak ID użytkownika).");
        }
    }

    /**
     * Wyświetla rezerwacje w ListView. Ta metoda byłaby wywoływana po otrzymaniu
     * danych z serwera (np. jako zdeserializowana lista obiektów Booking).
     * @param bookings Lista obiektów Booking do wyświetlenia.
     */
    private void displayReservations(List<Booking> bookings) {
        reservationsListView.getItems().clear();
        if (bookings != null && !bookings.isEmpty()) {
            for (Booking booking : bookings) {
                // Sformatuj obiekt Booking do Stringa, który będzie wyświetlany
                // np. "Film: [Tytuł], Data: [Data], Kwota: [Kwota]"
                reservationsListView.getItems().add("Rezerwacja #" + booking.getBookingId() +
                        " - Kwota: " + String.format("%.2f PLN", booking.getTotalAmount()) +
                        " - Status: " + booking.getStatus());
            }
        } else {
            reservationsListView.getItems().add("Brak rezerwacji dla tego użytkownika.");
        }
    }


    /**
     * Metoda pomocnicza do wyświetlania alertów.
     * @param type Typ alertu (INFORMATION, WARNING, ERROR).
     * @param title Tytuł okna alertu.
     * @param message Treść wiadomości.
     */
    private void showAlert(Alert.AlertType type, String title, String message) {
        Alert alert = new Alert(type);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}