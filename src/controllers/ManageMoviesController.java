package src.controllers;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Modality;
import javafx.stage.Stage;
import src.*;
import src.controllers.AddShowController;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ManageMoviesController {

    @FXML
    private ListView<Movie> moviesListView;

    @FXML
    private ListView<Show> showsListView; // zmienione z screensListView na showsListView

    private MovieService movieService = new MovieService();
    private ShowService showService = new ShowService();

    private Theatre theatre;

    public void setTheatre(Theatre theatre) {
        this.theatre = theatre;
        loadMovies(); // wczytaj filmy po ustawieniu kina
    }

    private void loadMovies() {
        List<Movie> movies = movieService.getAllMovies();
        moviesListView.setItems(FXCollections.observableArrayList(movies));
        showsListView.getItems().clear();
    }

    @FXML
    private void initialize() {
        moviesListView.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
            if (newSelection != null) {
                loadShows(newSelection);
            } else {
                showsListView.getItems().clear();
            }
        });
    }

    private void loadShows(Movie movie) {
        List<Show> shows = showService.getShowsByMovie(movie.getMovieId());
        showsListView.setItems(FXCollections.observableArrayList(shows));
    }

    @FXML
    private void handleAddShow() {
        Movie selectedMovie = moviesListView.getSelectionModel().getSelectedItem();
        if (selectedMovie == null) {
            showAlert("Proszę wybrać film, aby dodać seans.");
            return;
        }

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/Resources/AddShowView.fxml"));
            Parent root = loader.load();

            AddShowController controller = loader.getController();
            controller.setMovie(selectedMovie);
            controller.setTheatre(theatre); // przekazujemy też kino jeśli potrzebne

            Stage stage = new Stage();
            stage.setTitle("Dodaj seans - " + selectedMovie.getTitle());
            stage.setScene(new Scene(root));
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.showAndWait();

            // Odśwież listę seansów po dodaniu nowego
            loadShows(selectedMovie);

        } catch (IOException e) {
            e.printStackTrace();
            showAlert("Nie udało się otworzyć okna dodawania seansu.");
        }
    }

    @FXML
    private void handleEditShow() {
        Show selectedShow = showsListView.getSelectionModel().getSelectedItem();
        if (selectedShow == null) {
            showAlert("Wybierz seans do edycji.");
            return;
        }

        // Podobnie jak w handleAddShow, otwórz okno edycji z wybranym seansiem
        System.out.println("Edytuj seans: " + selectedShow);
        // Tutaj dodaj implementację okna edycji seansu, jeśli masz
    }

    @FXML
    private void handleDeleteShow() {
        Show selectedShow = showsListView.getSelectionModel().getSelectedItem();
        if (selectedShow == null) {
            showAlert("Wybierz seans do usunięcia.");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION,
                "Czy na pewno chcesz usunąć wybrany seans?",
                ButtonType.YES, ButtonType.NO);
        confirm.showAndWait().ifPresent(response -> {
            if (response == ButtonType.YES) {
                try {
                    showService.deleteShow(selectedShow.getShowId());
                    showsListView.getItems().remove(selectedShow);
                } catch (SQLException e) {
                    e.printStackTrace();
                    showAlert("Nie udało się usunąć seansu.");
                }
            }
        });
    }


    @FXML
    private void handleBack() {
        Stage stage = (Stage) moviesListView.getScene().getWindow();
        stage.close();
    }

    private void showAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setTitle("Uwaga");
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }


}
