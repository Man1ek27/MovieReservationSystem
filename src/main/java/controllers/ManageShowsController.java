package controllers;

import classes.*;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.scene.control.*;

import java.util.List;

public class ManageShowsController {

    @FXML
    private ListView<Screen> screenListView;

    @FXML
    private ListView<Show> showListView;

    @FXML
    private Button addShowButton;

    private Theatre theatre;

    private ScreenService screenService = new ScreenService();
    private ShowService showService = new ShowService();

    public void setTheatre(Theatre theatre) {
        this.theatre = theatre;
    }

    public void loadScreens() {
        List<Screen> screens = screenService.getScreensForTheatre(theatre.getTheatreId());
        screenListView.setItems(FXCollections.observableArrayList(screens));
    }

    @FXML
    public void initialize() {
        // Gdy wybierzesz ekran, ładuj seanse dla tego ekranu
        screenListView.getSelectionModel().selectedItemProperty().addListener((obs, oldScreen, newScreen) -> {
            if (newScreen != null) {
                loadShows(newScreen);
            } else {
                showListView.getItems().clear();
            }
        });
    }

    private void loadShows(Screen screen) {
        List<Show> shows = showService.getShowsByScreen(screen.getScreenId());
        showListView.setItems(FXCollections.observableArrayList(shows));
    }

    @FXML
    private void onAddShowButtonClick() {
        Screen selectedScreen = screenListView.getSelectionModel().getSelectedItem();
        if (selectedScreen == null) {
            Alert alert = new Alert(Alert.AlertType.WARNING, "Proszę wybrać ekran do dodania seansu.");
            alert.showAndWait();
            return;
        }

        // Otwórz okno dodawania seansu, przekazując wybrany ekran i listę filmów
        // Tutaj możesz np. otworzyć okno z listą filmów do wyboru i formularzem na czas seansu
    }
}
