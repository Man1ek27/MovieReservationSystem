package src.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.event.ActionEvent;
import javafx.scene.paint.Color; // Dodaj import dla Color
import org.java_websocket.client.WebSocketClient;

// TODO: Trzeba bedzie podpiac to potem do wszystkiego


public class PaymentController {

    @FXML private Label amountLabel;
    @FXML private ComboBox<String> paymentMethodComboBox;
    @FXML private Label bookingIdLabel;
    @FXML private Label messageLabel;

    private WebSocketClient wsClient;

    // Dane, które zostaną przekazane do tego kontrolera
    private double currentAmount;
    private int currentBookingId;
    private int currentUserId;

    // --- Metody do ustawiania danych z poprzedniego ekranu ---
    public void setAmount(double amount) {
        this.currentAmount = amount;
        amountLabel.setText(String.format("%.2f PLN", amount));
    }

    public void setBookingId(int bookingId) {
        this.currentBookingId = bookingId;
        bookingIdLabel.setText("#" + bookingId);
    }

    public void setUserId(int userId) {
        this.currentUserId = userId;
    }

    // Metoda do ustawienia klienta WebSocket
    public void setWsClient(WebSocketClient client) {
        this.wsClient = client;
    }

    @FXML
    public void initialize() {
        paymentMethodComboBox.getItems().addAll("Blik", "Google Pay", "Przelew Bankowy");
        paymentMethodComboBox.getSelectionModel().selectFirst();
        }

    @FXML
    public void handlePayment(ActionEvent event) {
        String paymentMethod = paymentMethodComboBox.getValue();

        if (paymentMethod == null || paymentMethod.isEmpty()) {
            messageLabel.setText("Proszę wybrać metodę płatności.");
            messageLabel.setTextFill(Color.RED);
            return;
        }

        if (wsClient != null && wsClient.isOpen()) {
            // Format: PAYMENT_REQUEST:kwota:metoda_platnosci:id_rezerwacji:id_uzytkownika (opcjonalnie)
            String paymentData = "PAYMENT_REQUEST:" + currentAmount + ":" + paymentMethod + ":" + currentBookingId;
            if (currentUserId != 0) { // Jeśli ID użytkownika jest ustawione
                paymentData += ":" + currentUserId;
            }

            wsClient.send(paymentData);
            messageLabel.setText("Wysyłam żądanie płatności...");
            messageLabel.setTextFill(Color.BLACK);
        } else {
            messageLabel.setText("Brak połączenia z serwerem WebSocket. Spróbuj ponownie.");
            messageLabel.setTextFill(Color.RED);
            // Opcjonalnie: spróbuj ponownie nawiązać połączenie
            if (wsClient != null) {
                wsClient.reconnect();
            }
        }
    }

    public void closeWebSocket() {
        if (wsClient != null && wsClient.isOpen()) {
            wsClient.close();
            System.out.println("PaymentController: Klient WebSocket zamknięty.");
        }
    }
}