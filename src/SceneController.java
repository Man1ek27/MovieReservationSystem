package src;

import javafx.animation.PauseTransition;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

public class SceneController {
    @FXML private GridPane seatsPane;
    private WebSocketClient wsClient;

    public void initialize() {
        connectToWebSocket();
    }

    private void connectToWebSocket() {
        try {
            wsClient = new WebSocketClient(new URI("ws://localhost:8887")) {
                @Override
                public void onOpen(ServerHandshake handshakedata) {
                    System.out.println("Connected to WebSocket server");
                    // Żądaj danych o miejscach od serwera
                    send("REQUEST_SEATS");
                }

                @Override
                public void onMessage(String message) {
                    Platform.runLater(() -> {
                        if (message.startsWith("SEATS_DATA:")) {
                            //generujMiejsca(parseSeatsData(message));
                        }
                    });
                }

                @Override
                public void onClose(int code, String reason, boolean remote) {
                    System.out.println("Disconnected from WebSocket server: " + reason);
                }

                @Override
                public void onError(Exception ex) {
                    System.err.println("WebSocket error: " + ex.getMessage());
                }
            };

            wsClient.connect();
        } catch (URISyntaxException e) {
            System.err.println("Invalid WebSocket URI: " + e.getMessage());
        }
    }

    private void generujMiejsca(List<Integer> miejscaWRzedach) {
        // Implementacja z poprzednich odpowiedzi
    }
}

