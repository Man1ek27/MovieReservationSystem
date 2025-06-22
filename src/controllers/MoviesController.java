package src.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import src.Movie;
import src.MovieService;
import src.Theatre;
import src.TheatreService;

import java.util.List;

public class MoviesController {

    @FXML
    private Label theatreLabel;

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
}
