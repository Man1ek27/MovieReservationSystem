package src.controllers;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.*;
import javafx.stage.Stage;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.*;

import src.Booking;
import src.Row;
import src.Seat;
import src.Show;

public class SceneController {
    private WebSocketClient wsClient;
    private int screenId = 1; // id sali do wyświetlenia
    private Show selectedShow;

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
                    send("REQUEST_SEATS:" + screenId);
                }

                @Override
                public void onMessage(String message) {
                    Platform.runLater(() -> {
                        if (message.startsWith("SEATS_DATA:")) {
                            List<Row> rows = parseSeatsData(message);
                            generujMiejsca(rows);
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

    // Parsowanie danych przesłanych przez serwer
    private List<Row> parseSeatsData(String message) {
        List<Row> rows = new ArrayList<>();
        // Zakładając format: "SEATS_DATA:row1_id:seat1,seat2,seat3|row2_id:seat4,seat5"
        String data = message.substring("SEATS_DATA:".length());
        String[] rowsData = data.split("\\|");

        for (String rowData : rowsData) {
            String[] parts = rowData.split(":");
            int rowId = Integer.parseInt(parts[0]);
            String[] seatsData = parts[1].split(",");

            ArrayList<Seat> seats = new ArrayList<>();
            for (String seatData : seatsData) {
                String[] seatParts = seatData.split("-"); // format: "seatId-seatNumber-type"
                int seatId = Integer.parseInt(seatParts[0]);
                int seatNumber = Integer.parseInt(seatParts[1]);
                String seatType = seatParts[2];
                boolean status = Boolean.parseBoolean(seatParts[3]);
                seats.add(new Seat(seatId, seatNumber, seatType,status));
            }

            rows.add(new Row(rowId, "Classic", seats)); // Zakładając typ rzędu
        }

        return rows;
    }

    // Generowanie widoku miejsc w GridPane
    @FXML private GridPane seatsGrid;
    @FXML private Label counter;

    public void setScreenId(int screenId){
        this.screenId = screenId;
    }

    private final Set<Seat> selectedSeats = new HashSet<>();



    private void generujMiejsca(List<Row> rows) {
        seatsGrid.getChildren().clear();
        seatsGrid.getColumnConstraints().clear();
        seatsGrid.getRowConstraints().clear();

        // Przykład: przejście w kolumnach 7, 8, 9, 10 (indeksy od 0)
        Set<Integer> aisleColumns = new HashSet<>(Arrays.asList( 10, 11, 12));

        int maxSeats = rows.stream().mapToInt(row -> row.getSeats().size()).max().orElse(0) + aisleColumns.size();

        for (int col = 0; col < maxSeats + 2; col++) { // +2 na numery rzędów
            ColumnConstraints cc = new ColumnConstraints(36); // szerokość miejsca
            seatsGrid.getColumnConstraints().add(cc);
        }

        for (int i = 0; i < rows.size(); i++) {
            Row row = rows.get(i);
            int colIndex = 1; // 0 to numer rzędu z lewej

            // Numer rzędu po lewej
            Label rowNumLeft = new Label(String.valueOf(i + 1));
            rowNumLeft.setPrefWidth(24);
            rowNumLeft.setAlignment(Pos.CENTER_RIGHT);
            seatsGrid.add(rowNumLeft, 0, i);

            for (int s = 0; s < row.getSeats().size(); s++) {
                // Jeśli to kolumna przejścia – pomiń (nie dodawaj przycisku, ale zwiększ colIndex)
                if((i !=rows.size()-1)){
                    while (aisleColumns.contains(colIndex - 1)) {
                        colIndex++;
                    }
                }
                Seat seat = row.getSeats().get(s);
                Button seatBtn = new Button(String.valueOf(seat.getSeatNumber()));
                seatBtn.setPrefSize(32, 32);
                seatBtn.setStyle(getSeatStyle(seat));
//---------------------------------------------------------------
                seatBtn.setOnAction(event -> {
                    if(!seat.isReserved()){
                        if (selectedSeats.contains(seat)) {
                            selectedSeats.remove(seat);
                            seatBtn.setStyle(getSeatStyle(seat)); // Przywróć domyślny styl
                        } else {
                            selectedSeats.add(seat);
                            seatBtn.setStyle("-fx-background-color: #222; -fx-text-fill: white;"); // Wybrany
                        }
                    }

                    counter.setText("(liczba wybranych miejsc: " +selectedSeats.size() + ")");
                });
                seatsGrid.add(seatBtn, colIndex, i);
                colIndex++;
            }

            // Numer rzędu po prawej
            Label rowNumRight = new Label(String.valueOf(i + 1));
            rowNumRight.setPrefWidth(24);
            rowNumRight.setAlignment(Pos.CENTER_LEFT);
            seatsGrid.add(rowNumRight, colIndex, i);
        }
    }

    // Przykładowa metoda stylująca miejsca
    private String getSeatStyle(Seat seat) {
        if (seat.isReserved()) {
            return "-fx-background-color: #bdbdbd; -fx-text-fill: white;";
        }
        switch (seat.getType()) {
            case "Regular":
                return "-fx-background-color: #43a047; -fx-text-fill: white;";
            case "Wheelchair":
                return "-fx-background-color: #2196f3; -fx-text-fill: white;";
            case "Selected":
                return "-fx-background-color: #222; -fx-text-fill: white;";
            case "Unavailable":
                return "-fx-background-color: #bdbdbd; -fx-text-fill: white;";
            default:
                return "-fx-background-color: #43a047; -fx-text-fill: white;";
        }


    }

    public void initData(Show show, int currentUserId) {
        this.selectedShow = show;
    }

    @FXML
    private void handleNext() {
        if (selectedSeats.isEmpty()) {
            showAlert("Brak wybranych miejsc", "Proszę wybrać co najmniej jedno miejsce.");
            return;
        }

        double totalAmount = selectedSeats.size() * selectedShow.getPrice();

        try {
//            Booking newBooking = new Booking(new Date(), totalAmount, currentUser.getUserId(), selectedShow.getShowId());
            //TODO: NAPRAWIC CURRENTUSER
            Booking newBooking = new Booking(new Date(), totalAmount, 1, selectedShow.getShowId());
            newBooking.setStatus("PENDING");


            int bookingId = newBooking.getBookingId(); // Użyjemy wygenerowanego ID z obiektu Booking

            FXMLLoader loader = new FXMLLoader(getClass().getResource("../../Resources/PaymentView.fxml"));
            Parent root = loader.load();

            PaymentController paymentController = loader.getController();
            paymentController.setAmount(totalAmount);
            paymentController.setBookingId(bookingId);
//            paymentController.setUserId(currentUser.getUserId()); // Przekaż ID użytkownika
            paymentController.setUserId(1); // Przekaż ID użytkownika
            paymentController.setWsClient(wsClient); // Przekaż instancję WebSocketClient

            Stage stage = (Stage) seatsGrid.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Płatność");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
            showAlert("Błąd", "Nie można załadować ekranu płatności.");
        }
    }

    private void showAlert(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}


