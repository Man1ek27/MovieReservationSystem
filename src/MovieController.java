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

            // Załaduj nowy widok z listą filmów
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/MovieListView.fxml"));
            Parent root = loader.load();

            // Przekaż MovieService do nowego kontrolera, jeśli trzeba
            MovieListController controller = loader.getController();
            controller.setMovieService(movieService);  // musisz dodać tę metodę w MovieListController

            Stage stage = new Stage();
            stage.setTitle("Lista filmów");
            stage.setScene(new Scene(root));
            stage.show();

            // Zamknij bieżące okno
            ((Stage) titleField.getScene().getWindow()).close();

//            // Wyczyść pola
//            titleField.clear();
//            descriptionField.clear();
//            languageField.clear();
//            genreField.clear();
//            durationField.clear();
//            posterUrlField.clear();
//            releaseDatePicker.setValue(null);
//            audioTypeComboBox.getSelectionModel().clearSelection();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("DEBUG: title = " + titleField.getText());
            System.out.println("DEBUG: duration = " + durationField.getText());
            System.out.println("DEBUG: date = " + releaseDatePicker.getValue());
            System.out.println("DEBUG: audio = " + audioTypeComboBox.getValue());
            Alert alert = new Alert(Alert.AlertType.ERROR, "Nieprawidłowe dane!");
            alert.showAndWait();
        }
    }

}


