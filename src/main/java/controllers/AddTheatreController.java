package controllers;

import classes.Theatre;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.stage.Stage;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddTheatreController {

    @FXML private TextField nameField;
    @FXML private TextField addressField;
    @FXML private TextField cityField;

    private TheatreViewController parentController;

    public void setParentController(TheatreViewController controller) {
        this.parentController = controller;
    }

    @FXML
    private void handleAddTheatre() {
        try {
            String name = nameField.getText();
            String address = addressField.getText();
            String city = cityField.getText();

            if (name.isEmpty() || address.isEmpty() || city.isEmpty()) {
                showError("Wszystkie pola są wymagane!");
                return;
            }

            Theatre theatre = new Theatre(name, address, city);
            saveTheatreToDatabase(theatre);
            parentController.addTheatre(theatre);

            Stage stage = (Stage) nameField.getScene().getWindow();
            stage.close();

        } catch (Exception e) {
            e.printStackTrace();
            showError("Wystąpił błąd przy dodawaniu kina.");
        }
    }

    private void saveTheatreToDatabase(Theatre theatre) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/moviereservation";
        String user = "postgres";
        String password = "123qwe";

        String sql = "INSERT INTO theatre (name, address, city) VALUES (?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, theatre.getName());
            stmt.setString(2, theatre.getAddress());
            stmt.setString(3, theatre.getCity());
            stmt.executeUpdate();
        }
    }

    private void showError(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Błąd");
        alert.setHeaderText(message);
        alert.showAndWait();
    }
}
