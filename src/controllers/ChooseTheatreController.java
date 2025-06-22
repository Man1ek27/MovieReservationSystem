package src.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.ListView;
import src.Theatre;
import src.TheatreService;

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

        System.out.println("Wybrano teatr: " + selected.getName());
        // Możesz tu załadować kolejny widok np. z filmami w tym teatrze
    }
}


