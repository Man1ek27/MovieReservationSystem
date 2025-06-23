package src.controllers;

import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.Stage;
import src.Theatre;
import src.TheatreService;
import src.AdminDashboardController;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;

import java.io.IOException;
import java.util.List;

public class TheatreViewController {

    @FXML
    private ListView<Theatre> theatreListView;

    private final TheatreService theatreService = new TheatreService();

    @FXML
    public void initialize() {
        List<Theatre> theatres = theatreService.getAllTheatres();
        theatreListView.setItems(FXCollections.observableArrayList(theatres));
    }

    public void addTheatre(Theatre theatre) {
        theatreListView.getItems().add(theatre);
        // Można dodać do jakiejś listy typu `ObservableList<Theatre>` jeśli trzymasz więcej danych
    }


    @FXML
    private void handleAdd(ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/Resources/AddTheatreView.fxml"));
            Parent root = loader.load();

            AddTheatreController controller = loader.getController();
            controller.setParentController(this);

            Stage stage = new Stage();
            stage.setTitle("Dodaj kino");
            stage.setScene(new Scene(root));
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @FXML
    private void handleManage() {
        Theatre selected = theatreListView.getSelectionModel().getSelectedItem();
        if (selected != null) {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/Resources/ManageMoviesView.fxml"));
                Parent root = loader.load();

                ManageMoviesController controller = loader.getController();
                controller.setTheatre(selected); // przekazujemy wybrane kino

                Stage stage = new Stage();
                stage.setTitle("Zarządzaj seansami - " + selected.getName());
                stage.setScene(new Scene(root));
                stage.show();

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }



    @FXML
    private void handleDelete() {
        Theatre selected = theatreListView.getSelectionModel().getSelectedItem();
        if (selected != null) {
            Alert confirm = new Alert(Alert.AlertType.CONFIRMATION,
                    "Czy na pewno chcesz usunąć kino: " + selected.getName() + "?",
                    ButtonType.YES, ButtonType.NO);
            confirm.showAndWait().ifPresent(response -> {
                if (response == ButtonType.YES) {
                    theatreService.deleteTheatre(selected.getTheatreId());
                    theatreListView.getItems().remove(selected);
                }
            });
        }
    }

    @FXML
    private void handleBack() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/Resources/AdminDashboard.fxml"));
            Parent root = loader.load();
            Stage stage = (Stage) theatreListView.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Panel Administratora");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
