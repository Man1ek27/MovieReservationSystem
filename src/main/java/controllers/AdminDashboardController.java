package controllers;

import classes.MovieService;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import javafx.stage.Window;


import java.io.IOException;

public class AdminDashboardController {

    private MovieService movieService;

    @FXML
    private Button logoutButton;

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }


    @FXML
    void handleMoviesPanel(ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/MovieManagement.fxml"));
            Parent root = loader.load();

            // Możesz przekazać classes.MovieService do kontrolera MovieManagement (jeśli trzeba)
            MovieManagementController controller = loader.getController();
            controller.setMovieService(this.movieService); // jeśli masz taką metodę
            controller.loadMovies();

            Stage stage = (Stage) ((javafx.scene.Node) event.getSource()).getScene().getWindow();
            stage.setScene(new Scene(root));
            stage.setTitle("Zarządzanie filmami");
            stage.show();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void handleTheatresPanel(ActionEvent event) {
        switchScene("/TheatreView.fxml", "Panel Kin");
    }

    @FXML
    private void handleUsersPanel() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/UserManagement.fxml"));
            Parent userManagementRoot = loader.load();

            UserManagementController controller = loader.getController();
            controller.setMovieService(this.movieService);  // bardzo ważne — przekazujemy dalej movieService

            Stage stage = (Stage) logoutButton.getScene().getWindow();
            stage.getScene().setRoot(userManagementRoot);
            stage.setTitle("Zarządzanie użytkownikami");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void switchScene(String fxmlPath, String title) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource(fxmlPath));
            Parent root = loader.load();

            Stage stage = (Stage) Stage.getWindows().filtered(Window::isShowing).get(0);
            stage.setScene(new Scene(root));
            stage.setTitle(title);
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void handleLogout() {
        // zamiast: Stage stage = (Stage) moviesListView.getScene().getWindow();
        // użyj np. innego elementu, który faktycznie istnieje, np. logoutButton:

        Stage stage = (Stage) logoutButton.getScene().getWindow();

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/login.fxml"));
            Parent root = loader.load();
            stage.setScene(new Scene(root));
            stage.setTitle("Logowanie");
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
