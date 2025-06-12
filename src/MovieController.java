package src;

import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.time.ZoneId;
import java.util.Date;

public class MovieController {

    @FXML private TextField titleField;
    @FXML private TextField descriptionField;
    @FXML private TextField languageField;
    @FXML private TextField genreField;
    @FXML private TextField durationField;
    @FXML private DatePicker releaseDatePicker;
    @FXML private TextField posterUrlField;
    @FXML private ComboBox<Movie.AudioType> audioTypeComboBox;

    private MovieListController movieListController;

    public void setMovieListController(MovieListController controller) {
        this.movieListController = controller;
    }



    private final MovieService movieService = new MovieService();

    @FXML
    public void initialize() {
        // Ustawienia początkowe (np. opcje ComboBoxa)
        audioTypeComboBox.getItems().setAll(Movie.AudioType.values());
    }

    @FXML
    private void onSaveButtonClick() {
        try {
            String title = titleField.getText();
            String description = descriptionField.getText();
            String language = languageField.getText();
            String genre = genreField.getText();
            int duration = Integer.parseInt(durationField.getText());
            Date releaseDate = Date.from(releaseDatePicker.getValue().atStartOfDay(ZoneId.systemDefault()).toInstant());
            String posterUrl = posterUrlField.getText();
            Movie.AudioType audioType = audioTypeComboBox.getValue();

            Movie movie = new Movie(title, description, language, genre, duration, releaseDate, posterUrl, audioType);
            movieService.addMovie(movie);
            System.out.println("Dodano film: " + movie.getTitle());

            // Zamknij aktualne okno formularza dodawania filmu
            Stage currentStage = (Stage) titleField.getScene().getWindow();
            currentStage.close();

//            // Otwórz nowe okno panelu admina (listy filmów)
//            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/AdminDashboard.fxml"));
//            Parent root = loader.load();
//
//            MovieListController controller = loader.getController();
//            controller.setMovieService(movieService);  // przekaż MovieService
//
//            Stage stage = new Stage();
//            stage.setTitle("Panel Admina - Lista filmów");
//            stage.setScene(new Scene(root));
//            stage.show();

        } catch (Exception e) {
            e.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.ERROR, "Nieprawidłowe dane!");
            alert.showAndWait();
        }
    }


    private void clearForm() {
        titleField.clear();
        descriptionField.clear();
        languageField.clear();
        genreField.clear();
        durationField.clear();
        posterUrlField.clear();
        releaseDatePicker.setValue(null);
        audioTypeComboBox.getSelectionModel().clearSelection();
    }


}

