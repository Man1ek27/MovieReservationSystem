package controllers;

import classes.*;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
//import javafx.stage.classes.Screen;
import javafx.stage.Stage;

import java.math.BigDecimal;
import java.sql.*;
import java.time.*;
import java.util.Date;
import java.util.List;




public class AddShowController {

    @FXML
    private DatePicker datePicker;
    @FXML private TextField timeField;
    @FXML private TextField priceField;
    @FXML private ComboBox<Screen> screenComboBox;

    private Movie movie;
    private Theatre theatre;
    private ShowService showService = new ShowService();

    private Show showToEdit = null;

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public void setTheatre(Theatre theatre) {
        this.theatre = theatre;
        loadScreens();
    }

    private void loadScreens() {
        List<Screen> screens = new ScreenService().getScreensForTheatre(theatre.getTheatreId());
        screenComboBox.setItems(FXCollections.observableArrayList(screens));
    }

    @FXML
    private void handleAdd() {
        try {
            LocalDate date = datePicker.getValue();
            String time = timeField.getText();
            BigDecimal price = new BigDecimal(priceField.getText());
            Screen screen = screenComboBox.getValue();

            if (date == null || time.isEmpty() || screen == null) {
                showAlert("Wypełnij wszystkie pola.");
                return;
            }

            LocalDateTime showTime = LocalDateTime.parse(date + "T" + time);
            Date legacyDate = java.util.Date.from(showTime.atZone(ZoneId.systemDefault()).toInstant());

            if (showToEdit != null) {
                showToEdit.setShowTime(legacyDate);
                showToEdit.setPrice(price.doubleValue());
                showToEdit.setMovieId(movie.getMovieId());
                showToEdit.setScreenId(screen.getScreenId());
                showService.updateShow(showToEdit);
            } else {
                Show show = new Show(legacyDate, price.doubleValue(), movie.getMovieId(), screen.getScreenId());
                saveShowToDatabase(show);
            }

//            showService.addShow(show);

            Stage stage = (Stage) datePicker.getScene().getWindow();
            stage.close();

        } catch (Exception e) {
            e.printStackTrace();
            showAlert("Błąd przy dodawaniu seansu.");
        }
    }

    private void saveShowToDatabase(Show show) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/moviereservation";
        String user = "postgres";
        String password = "123qwe";

        String sql = "INSERT INTO show (show_time, price, movie_id, screen_id) VALUES (?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setTimestamp(1, new java.sql.Timestamp(show.getShowTime().getTime()));
            stmt.setDouble(2, show.getPrice());
            stmt.setInt(3, show.getMovieId());
            stmt.setInt(4, show.getScreenId());

            stmt.executeUpdate();
        }
    }



    @FXML
    private void handleCancel() {
        ((Stage) datePicker.getScene().getWindow()).close();
    }

    private void showAlert(String msg) {
        Alert alert = new Alert(Alert.AlertType.ERROR, msg);
        alert.showAndWait();
    }

    public void setShowToEdit(Show show) {
        this.showToEdit = show;

        Date showDate = show.getShowTime();

        if (showDate != null) {
            // konwersja java.util.Date -> LocalDateTime
            Instant instant = showDate.toInstant();
            LocalDateTime showDateTime = instant.atZone(ZoneId.systemDefault()).toLocalDateTime();

            datePicker.setValue(showDateTime.toLocalDate());
            timeField.setText(showDateTime.toLocalTime().toString());
        } else {
            System.err.println("show_time jest null");
        }

        priceField.setText(String.valueOf(show.getPrice()));

        for (Screen screen : screenComboBox.getItems()) {
            if (screen.getScreenId() == show.getScreenId()) {
                screenComboBox.setValue(screen);
                break;
            }
        }
    }






}
