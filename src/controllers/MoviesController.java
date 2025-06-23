package src.controllers;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button; // Dodaj import Button
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.stage.Stage;
import src.Movie;
import src.MovieService;
import src.Show; // Importujemy klasę Show
import src.ShowService; // Importujemy ShowService
import src.Theatre;
import src.TheatreService;

import java.io.IOException;
import java.util.List;

public class MoviesController {

    @FXML
    private Label currentViewLabel; // Zmieniona nazwa z theatreLabel
    @FXML
    private ListView<Object> mainListView; // Typ Object, bo będzie wyświetlać Movie lub Show
    @FXML
    private Button backButton; // Dodajemy referencję do przycisku "Wróć"
    @FXML
    private Button actionButton; // Dodajemy referencję do przycisku "Wybierz"

    private MovieService movieService;
    private TheatreService theatreService; // Potrzebujemy TheatreService do cofania do wyboru teatru
    private ShowService showService; // Nowy ShowService

    private Theatre selectedTheatre;
    private Movie selectedMovieForShows; // Przechowuje aktualnie wybrany film, dla którego wyświetlamy seanse
    private int currentUserId;

    // Stan, czy aktualnie wyświetlamy filmy czy seanse
    private boolean showingMovies = true;
    private int userId;

    // Metoda do inicjalizacji danych
    public void initData(Theatre theatre, MovieService movieService) {
        this.selectedTheatre = theatre;
        this.movieService = movieService;
        this.currentUserId = userId;
        this.theatreService = theatreService; // Przekazujemy TheatreService
        this.showService = new ShowService(); // Inicjalizacja ShowService

        // Początkowo pokazujemy filmy
        showingMovies = true;
        loadMovies();
    }

    @FXML
    private void initialize() {
        // Dodaj listenera do ListView, aby reagować na pojedyncze kliknięcie
        mainListView.setOnMouseClicked(event -> {
            if (event.getClickCount() == 1) { // Pojedyncze kliknięcie, aby aktywować "Wybierz"
                // Nic nie robimy od razu, użytkownik musi kliknąć "Wybierz"
                // lub podwójne kliknięcie (jeśli chcesz to obsłużyć)
            }
            if (event.getClickCount() == 2) { // Obsługa podwójnego kliknięcia
                handleAction(); // Wywołaj akcję (wybierz film/seans)
            }
        });
    }

    private void loadMovies() {
        currentViewLabel.setText("Filmy w teatrze: " + selectedTheatre.getName());
        List<Movie> movies = movieService.getAllMovies();
        mainListView.getItems().setAll(movies);
        showingMovies = true;
        backButton.setText("Wróć do teatrów"); // Zmieniamy tekst przycisku
        actionButton.setText("Wybierz film"); // Zmieniamy tekst przycisku
    }

    private void loadShowsForMovie(Movie movie) {
        this.selectedMovieForShows = movie;
        currentViewLabel.setText("Seanse dla filmu: " + movie.getTitle());
        List<Show> shows = showService.getShowsByMovieId(movie.getMovieId());
        mainListView.getItems().setAll(shows);
        showingMovies = false;
        backButton.setText("Wróć do filmów"); // Zmieniamy tekst przycisku
        actionButton.setText("Wybierz miejsca"); // Zmieniamy tekst przycisku
    }

    @FXML
    private void handleAction() {
        if (showingMovies) {
            // Wybrano film, teraz pokaż seanse
            Movie selectedMovie = (Movie) mainListView.getSelectionModel().getSelectedItem();
            if (selectedMovie == null) {
                showAlert("Brak wybranego filmu", "Proszę wybrać film z listy.");
                return;
            }
            loadShowsForMovie(selectedMovie);
        } else {
            // Wybrano seans, teraz przejdź do wyboru miejsc
            Show selectedShow = (Show) mainListView.getSelectionModel().getSelectedItem();
            if (selectedShow == null) {
                showAlert("Brak wybranego seansu", "Proszę wybrać seans z listy.");
                return;
            }

            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../../Resources/sceneView.fxml"));
                Parent root = loader.load();

                SceneController sceneController = loader.getController();
                // Przekaż wybrany seans i ID użytkownika do SceneController
                sceneController.initData(selectedShow, currentUserId); // Używamy ulepszonej initData

                Stage stage = (Stage) mainListView.getScene().getWindow(); // Używamy mainListView dla Stage
                stage.setScene(new Scene(root));
                stage.setTitle("Wybór miejsc dla seansu: " + " " + selectedShow.getShowTime());
                stage.show();
            } catch (IOException e) {
                e.printStackTrace();
                showAlert("Błąd", "Nie można załadować ekranu wyboru miejsc.");
            }
        }
    }

    @FXML
    private void handleBack() {
        if (!showingMovies) {
            // Jesteśmy w widoku seansów, wracamy do widoku filmów
            loadMovies();
        } else {
            // Jesteśmy w widoku filmów, wracamy do widoku wyboru teatru
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("../../Resources/ChooseTheatreView.fxml"));
                Parent root = loader.load();

                ChooseTheatreController controller = loader.getController();
                // Przekaż TheatreService, aby mógł załadować teatry
                controller.setTheatreService(theatreService);
                // Przekaż też ID użytkownika z powrotem
                controller.setCurrentUserId(currentUserId);


                Stage stage = (Stage) mainListView.getScene().getWindow(); // Używamy mainListView dla Stage
                stage.setScene(new Scene(root));
                stage.setTitle("Wybierz teatr");
                stage.show();
            } catch (Exception e) {
                e.printStackTrace();
                showAlert("Błąd nawigacji", "Nie można wrócić do poprzedniego ekranu.");
            }
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