package src;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.ListView;
import javafx.stage.Stage;

import java.util.List;

public class ChooseTheatreController {

    @FXML
    private ListView<Theatre> theatreListView;

    private TheatreService theatreService;

    public void setTheatreService(TheatreService service) {
        this.theatreService = service;
        loadTheatres(); // od razu po ustawieniu serwisu
    }

    private void loadTheatres() {
        List<Theatre> theatres = theatreService.getAllTheatres(); // np. SELECT * FROM theatre
        theatreListView.getItems().setAll(theatres); // Ustawiamy w ListView
    }

    @FXML
    private void onNextButtonClick() {
        Theatre selected = theatreListView.getSelectionModel().getSelectedItem();
        if (selected == null) {
            Alert alert = new Alert(Alert.AlertType.WARNING, "Wybierz teatr!");
            alert.showAndWait();
            return;
        }

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/MoviesView.fxml"));
            Parent root = loader.load();

            MoviesController controller = loader.getController();
            controller.initData(selected, new MovieService()); // przekaż wybrany teatr i serwis do filmów

            Stage stage = (Stage) theatreListView.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Filmy");
            stage.show();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void handleLogout() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/login.fxml"));
            Parent root = loader.load();

            Stage stage = (Stage) theatreListView.getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Logowanie");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


