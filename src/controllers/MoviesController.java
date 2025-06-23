package src.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import src.*;

import java.util.List;

public class MoviesController {

    @FXML
    private Label theatreLabel;

    @FXML
    private ListView<Show> showsListView;

    @FXML
    private ListView<Movie> moviesListView;

    private MovieService movieService;
    private Theatre selectedTheatre;

    public void initData(Theatre theatre, MovieService movieService) {
        this.selectedTheatre = theatre;
        this.movieService = movieService;

        theatreLabel.setText("Filmy w teatrze: " + theatre.getName());

        List<Movie> movies = movieService.getAllMovies();
        moviesListView.getItems().setAll(movies);
    }

    @FXML
    private void handleBack() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../../Resources/ChooseTheatreView.fxml"));
            Parent root = loader.load();

            ChooseTheatreController controller = loader.getController();
            controller.setTheatreService(new TheatreService()); // lub przekaż z powrotem ten sam obiekt

            Stage stage = (Stage) theatreLabel.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Wybierz teatr");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void handleSelectShow() {
        Show selectedShow = showsListView.getSelectionModel().getSelectedItem();

//        if (selectedShow == null) {
//            showAlert("Błąd wyboru", "Proszę wybrać seans z listy.");
//            return;
//        }

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../../Resources/SceneView.fxml"));
            Parent root = loader.load();

            SceneController sceneController = loader.getController();
            // Przekaż wybrany seans do SceneController
            sceneController.initData(selectedShow);

            Stage stage = (Stage) theatreLabel.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Wybór miejsc");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
            showAlert("Błąd", "Nie można załadować ekranu wyboru miejsc.");
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
