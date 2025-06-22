package src;

import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.Stage;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MovieEditController {

    @FXML private TextField titleField;
    @FXML private TextArea descriptionArea;
    @FXML private TextField languageField;
    @FXML private TextField genreField;
    @FXML private TextField durationField;
    @FXML private DatePicker releaseDatePicker;
    @FXML private TextField posterUrlField;
    @FXML private ComboBox<Movie.AudioType> audioTypeCombo;

    private Movie movie;
    private MovieService movieService;

    public void setMovie(Movie movie) {
        this.movie = movie;
        populateFields();
    }

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }

    private void populateFields() {
        titleField.setText(movie.getTitle());
        descriptionArea.setText(movie.getDescription());
        languageField.setText(movie.getLanguage());
        genreField.setText(movie.getGenre());
        durationField.setText(String.valueOf(movie.getDurationMinutes()));
        releaseDatePicker.setValue(new java.sql.Date(movie.getReleaseDate().getTime()).toLocalDate());
        posterUrlField.setText(movie.getPosterUrl());
        audioTypeCombo.getItems().setAll(Movie.AudioType.values());
        audioTypeCombo.setValue(movie.getAudioType());
    }

    @FXML
    private void onSaveButtonClick() {
        try {
            movie.setTitle(titleField.getText());
            movie.setDescription(descriptionArea.getText());
            movie.setLanguage(languageField.getText());
            movie.setGenre(genreField.getText());
            movie.setDurationMinutes(Integer.parseInt(durationField.getText()));
            movie.setReleaseDate(java.sql.Date.valueOf(releaseDatePicker.getValue()));
            movie.setPosterUrl(posterUrlField.getText());
            movie.setAudioType(audioTypeCombo.getValue());

            movieService.updateMovie(movie); // Upewnij się, że ta metoda jest w MovieService

            closeWindow();
        } catch (Exception e) {
            e.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.ERROR, "Nie udało się zapisać zmian.");
            alert.showAndWait();
        }
    }

    @FXML
    private void onCancelButtonClick() {
        closeWindow();
    }

    private void closeWindow() {
        Stage stage = (Stage) titleField.getScene().getWindow();
        stage.close();
    }
}
