package src;

import javafx.animation.PauseTransition;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.PasswordField;
import javafx.event.ActionEvent;
import javafx.scene.control.TextField;
import javafx.scene.control.Label;

import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.CountDownLatch; // Do synchronizacji w testach/przykładach

public class LoginController {
    @FXML private TextField loginField;
    @FXML private PasswordField passwordField;
    @FXML private Label messageLabel;


    private WebSocketClient wsClient;
    private final CountDownLatch latch = new CountDownLatch(1); // Do synchronizacji odpowiedzi serwera
    private Stage registerStage;
    private  RegisterController reg;

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
                            String[] parts = message.substring(14).split(":");
                            if (parts.length >= 2) {
                                String role = parts[0];
                                String username = parts[1];
                                messageLabel.setText("Zalogowano jako: " + username + " (" + role + ")");

                                if ("admin".equalsIgnoreCase(role)) {
                                    try {
                                        FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/AdminDashboard.fxml"));
                                        Parent root = loader.load();

                                        // Pobierz kontroler i przekaż mu MovieService (jeśli potrzebujesz)
                                        AdminDashboardController controller = loader.getController();
                                        controller.setMovieService(new MovieService()); // lub jakikolwiek sposób masz na dostęp do MovieService

                                        Stage stage = (Stage) loginField.getScene().getWindow();
                                        stage.setScene(new Scene(root));
                                        stage.setTitle("Panel administratora");
                                        stage.show();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        messageLabel.setText("Błąd podczas ładowania panelu admina.");
                                    }
                                } else if ("user".equalsIgnoreCase(role)) {
                                    messageLabel.setText("Zalogowano jako zwykły użytkownik.");
                                    // Po poprawnym zalogowaniu jako user
                                    FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/ChooseTheatreView.fxml"));
                                    Parent root = null;
                                    try {
                                        root = loader.load();
                                    } catch (IOException e) {
                                        throw new RuntimeException(e);
                                    }

                                    // Przekazanie połączenia do serwisu
                                    ChooseTheatreController controller = loader.getController();
                                    controller.setTheatreService(new TheatreService()); // lub jak masz połączenie

                                    Stage stage = new Stage();
                                    stage.setTitle("Wybierz teatr");
                                    stage.setScene(new Scene(root));
                                    stage.show();

                                    // Zamknięcie okna logowania
                                    ((Stage) loginField.getScene().getWindow()).close();

                                }
                            }

                        } else if (message.startsWith("LOGIN_FAILED:")) {
                            messageLabel.setText(message.substring(13)); // Wyświetl wiadomość błędu
                        }
                        else if (message.startsWith("REGISTER_SUCCESS:")) {



                            //odczekaj 2 sekundy, a potem zamnij okno rejestracji
                            PauseTransition delay = new PauseTransition(Duration.seconds(2));
                            reg.setMessageLabel("Registered successfuly!!!!");//przekazanie wiadomości do RegisterControll.messageLabel

                            delay.setOnFinished(event -> {//to się dzieje po skończeniu opóźnienia
                                try {
                                    if (registerStage != null) registerStage.close();

                                    FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/login.fxml"));
                                    Parent root = loader.load();

                                    Stage stage = (Stage) loginField.getScene().getWindow();
                                    stage.setScene(new Scene(root));
                                    stage.setTitle("Login");
                                    stage.show();

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            });

                            delay.play();//włączenie opóźnienia
                        }
                        else if (message.startsWith("SERVER_ERROR:")) {
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

    @FXML
    void handleRegister(ActionEvent event)throws IOException {
        FXMLLoader registerLoader = new FXMLLoader(getClass().getResource("../Recources/register.fxml"));
        Parent root = registerLoader.load();

        // Przekaż MovieService do nowego kontrolera, jeśli trzeba
        RegisterController controller= registerLoader.getController();
        controller.setClient(wsClient);
        reg = controller;

        Stage stage = new Stage();
        this.registerStage = stage;
        stage.setTitle("Register");
        stage.setScene(new Scene(root));
        stage.show();

        ((Stage) loginField.getScene().getWindow()).close();


    }

    // Metoda do zamknięcia klienta WebSocket, gdy kontroler nie jest już używany
    public void closeWebSocket() {
        if (wsClient != null && wsClient.isOpen()) {
            wsClient.close();
        }
    }
}