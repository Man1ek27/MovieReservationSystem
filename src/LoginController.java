package src;

import javafx.fxml.FXML;
import javafx.scene.control.PasswordField;
import javafx.event.ActionEvent;
import javafx.scene.control.TextField;
import javafx.scene.control.Label;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.CountDownLatch; // Do synchronizacji w testach/przykładach

public class LoginController {
    @FXML private TextField loginField;
    @FXML private PasswordField passwordField;
    @FXML private Label messageLabel;

    private WebSocketClient wsClient;
    private final CountDownLatch latch = new CountDownLatch(1); // Do synchronizacji odpowiedzi serwera

    public void initialize() {
        try {
            // Inicjalizacja klienta WebSocket
            wsClient = new WebSocketClient(new URI("ws://localhost:8887")) {
                @Override
                public void onOpen(ServerHandshake handshakedata) {
                    System.out.println("Connected to WebSocket server");
                    // Możesz wysłać wiadomość powitalną do serwera
                }

                @Override
                public void onMessage(String message) {
                    // Obsługa wiadomości od serwera
                    System.out.println("Received from server: " + message);
                    javafx.application.Platform.runLater(() -> {
                        if (message.startsWith("LOGIN_SUCCESS:")) {
                            messageLabel.setText(message.substring(14)); // Wyświetl wiadomość sukcesu
                            // TODO: Przejdź do głównego widoku aplikacji po zalogowaniu
                            // Na przykład:
                            // try {
                            //     FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/MovieListView.fxml"));
                            //     Parent root = loader.load();
                            //     Stage stage = (Stage) loginField.getScene().getWindow();
                            //     stage.setScene(new Scene(root));
                            //     stage.setTitle("Movie List");
                            //     stage.show();
                            // } catch (Exception e) {
                            //     e.printStackTrace();
                            // }
                        } else if (message.startsWith("LOGIN_FAILED:")) {
                            messageLabel.setText(message.substring(13)); // Wyświetl wiadomość błędu
                        } else if (message.startsWith("SERVER_ERROR:")) {
                            messageLabel.setText(message.substring(13));
                        }
                    });
                    latch.countDown(); // Sygnalizuj, że wiadomość została odebrana
                }

                @Override
                public void onClose(int code, String reason, boolean remote) {
                    System.out.println("Disconnected from WebSocket server: " + reason);
                    javafx.application.Platform.runLater(() -> messageLabel.setText("Disconnected from server."));
                }

                @Override
                public void onError(Exception ex) {
                    System.err.println("WebSocket error: " + ex.getMessage());
                    javafx.application.Platform.runLater(() -> messageLabel.setText("Connection error: " + ex.getMessage()));
                }
            };
            wsClient.connect(); // Połącz z serwerem WebSocket
        } catch (URISyntaxException e) {
            System.err.println("Invalid WebSocket URI: " + e.getMessage());
            messageLabel.setText("Błąd konfiguracji klienta.");
        }
    }

    @FXML
    void handleLogin(ActionEvent event) {
        String login = loginField.getText();
        String pass = passwordField.getText();

        if (wsClient.isOpen()) {
            // Wysyłamy dane logowania do serwera WebSocket
            wsClient.send("LOGIN:" + login + ":" + pass);
            // W przypadku bardziej złożonych aplikacji, można poczekać na odpowiedź
            // try {
            //     latch.await(5, TimeUnit.SECONDS); // Poczekaj na odpowiedź przez 5 sekund
            // } catch (InterruptedException e) {
            //     Thread.currentThread().interrupt();
            //     messageLabel.setText("Login request timed out.");
            // }
        } else {
            messageLabel.setText("Nie połączono z serwerem WebSocket.");
        }
    }

    // Metoda do zamknięcia klienta WebSocket, gdy kontroler nie jest już używany
    public void closeWebSocket() {
        if (wsClient != null && wsClient.isOpen()) {
            wsClient.close();
        }
    }
}