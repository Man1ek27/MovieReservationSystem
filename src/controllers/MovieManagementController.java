package src.controllers;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Modality;
import javafx.stage.Stage;
import src.AdminDashboardController;
import src.Movie;
import src.MovieService;

public class MovieManagementController {

    @FXML private Button editMovieButton;
    @FXML private Button deleteMovieButton;

    @FXML
    public void initialize() {
        moviesListView.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            boolean selected = newVal != null;
            editMovieButton.setDisable(!selected);
            deleteMovieButton.setDisable(!selected);
        });
    }


    @FXML
    private ListView<Movie> moviesListView;

    private MovieService movieService;

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }

    public void loadMovies() {
        moviesListView.getItems().clear();
        for (Movie m : movieService.getAllMovies()) {
            moviesListView.getItems().add(m);
        }
    }

//    @FXML
//    private void handleLogout() {
//        try {
//            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/login.fxml"));
//            Parent root = loader.load();
//
//            Stage stage = (Stage) moviesListView.getScene().getWindow();
//            stage.setScene(new Scene(root));
//            stage.setTitle("Logowanie");
//            stage.show();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    @FXML
    private void onAddMovieButtonClick() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/MovieAddView.fxml"));
            Parent root = loader.load();

            Stage stage = new Stage();
            stage.setTitle("Dodaj film");
            stage.setScene(new Scene(root));
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.showAndWait();

            loadMovies();
        } catch (Exception e) {
            e.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.ERROR, "Nie udało się otworzyć formularza dodawania filmu.");
            alert.showAndWait();
        }
    }

    @FXML
    private void handleBackToAdminDashboard() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/Resources/AdminDashboard.fxml"));
            Parent root = loader.load();

            AdminDashboardController controller = loader.getController();
            controller.setMovieService(this.movieService);

            Stage stage = (Stage) moviesListView.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Panel Administratora");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void onEditMovieButtonClick() {
        Movie selectedMovie = moviesListView.getSelectionModel().getSelectedItem();
        if (selectedMovie == null) {
            Alert alert = new Alert(Alert.AlertType.WARNING, "Proszę wybrać film do edycji.");
            alert.showAndWait();
            return;
        }

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/MovieEditView.fxml"));
            Parent root = loader.load();

            MovieEditController editController = loader.getController();
            editController.setMovie(selectedMovie);
            editController.setMovieService(movieService);

            Stage stage = new Stage();
            stage.setTitle("Edytuj film");
            stage.setScene(new Scene(root));
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.showAndWait();

            loadMovies();
        } catch (Exception e) {
            e.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.ERROR, "Nie udało się otworzyć okna edycji filmu.");
            alert.showAndWait();
        }
    }

    @FXML
    private void onDeleteMovieButtonClick() {
        Movie selectedMovie = moviesListView.getSelectionModel().getSelectedItem();
        if (selectedMovie == null) {
            Alert alert = new Alert(Alert.AlertType.WARNING, "Proszę wybrać film do usunięcia.");
            alert.showAndWait();
            return;
        }

        Alert confirmAlert = new Alert(Alert.AlertType.CONFIRMATION, "Czy na pewno chcesz usunąć film \"" + selectedMovie.getTitle() + "\"?", ButtonType.YES, ButtonType.NO);
        confirmAlert.showAndWait();

        if (confirmAlert.getResult() == ButtonType.YES) {
            movieService.deleteMovie(selectedMovie.getMovieId());
            loadMovies();
            Alert infoAlert = new Alert(Alert.AlertType.INFORMATION, "Film został usunięty.");
            infoAlert.showAndWait();
        }
    }
}
