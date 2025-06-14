package src;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ListView;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class AdminDashboardController {

    @FXML
    private ListView<String> moviesListView;

    private MovieService movieService;

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
        loadMovies();
    }

    private void loadMovies() {
        moviesListView.getItems().clear();
        for (Movie m : movieService.getAllMovies()) {
            moviesListView.getItems().add(m.getTitle());
        }
    }

    @FXML
    private void handleLogout() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/login.fxml"));
            Parent root = loader.load();

            Stage stage = (Stage) moviesListView.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Logowanie");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void onAddMovieButtonClick() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/MovieView.fxml"));
            Parent root = loader.load();

            Stage stage = new Stage();
            stage.setTitle("Dodaj film");
            stage.setScene(new Scene(root));
            stage.initModality(Modality.APPLICATION_MODAL);  // bardzo ważne - blokuje główne okno
            stage.showAndWait();  // czekaj aż okno zostanie zamknięte

            // Po zamknięciu formularza - odśwież listę filmów
            loadMovies();
        } catch (Exception e) {
            e.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.ERROR, "Nie udało się otworzyć formularza dodawania filmu.");
            alert.showAndWait();
        }
    }


}
