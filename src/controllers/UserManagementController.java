package src.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;

import javafx.event.ActionEvent;
import javafx.stage.Stage;
import src.AdminDashboardController;
import src.MovieService;
import src.User;

import java.sql.*;

public class UserManagementController {

    @FXML
    private Button backButton;

    private MovieService movieService;

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }


    @FXML
    private TableView<User> userTable;

    @FXML
    private TableColumn<User, Integer> userIdColumn;

    @FXML
    private TableColumn<User, String> nameColumn;

    @FXML
    private TableColumn<User, String> emailColumn;

    @FXML
    private TableColumn<User, String> passwordColumn;

    @FXML
    private TableColumn<User, String> phoneNumberColumn;

    @FXML
    private Button deleteButton;

    private ObservableList<User> userList = FXCollections.observableArrayList();

    // Dane do połączenia z bazą - dostosuj do swoich ustawień
    private final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
    private final String DB_USER = "postgres";
    private final String DB_PASSWORD = "123qwe";

    @FXML
    public void initialize() {
        // Ustaw kolumny na właściwości klasy User
        userIdColumn.setCellValueFactory(new PropertyValueFactory<>("userId"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<>("name"));
        emailColumn.setCellValueFactory(new PropertyValueFactory<>("email"));
        passwordColumn.setCellValueFactory(new PropertyValueFactory<>("password"));
        phoneNumberColumn.setCellValueFactory(new PropertyValueFactory<>("phoneNumber"));

        // Ustaw tryb edytowalny tabeli i kolumn
        userTable.setEditable(true);

        nameColumn.setCellFactory(TextFieldTableCell.forTableColumn());
        emailColumn.setCellFactory(TextFieldTableCell.forTableColumn());
        passwordColumn.setCellFactory(TextFieldTableCell.forTableColumn());
        phoneNumberColumn.setCellFactory(TextFieldTableCell.forTableColumn());

        // Obsługa edycji - zapis do bazy po zmianie komórki
        nameColumn.setOnEditCommit(event -> {
            User user = event.getRowValue();
            user.setName(event.getNewValue());
            updateUserInDB(user);
        });

        emailColumn.setOnEditCommit(event -> {
            User user = event.getRowValue();
            user.setEmail(event.getNewValue());
            updateUserInDB(user);
        });

        passwordColumn.setOnEditCommit(event -> {
            User user = event.getRowValue();
            user.setPassword(event.getNewValue());
            updateUserInDB(user);
        });

        phoneNumberColumn.setOnEditCommit(event -> {
            User user = event.getRowValue();
            user.setPhoneNumber(event.getNewValue());
            updateUserInDB(user);
        });

        // Załaduj dane z bazy
        loadUsersFromDB();

        // Wyłącz przycisk usuń jeśli nic nie jest wybrane
        deleteButton.disableProperty().bind(userTable.getSelectionModel().selectedItemProperty().isNull());
    }

    private void loadUsersFromDB() {
        userList.clear();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT user_id, name, email, password, phone_number FROM \"user\"")) {

            while (rs.next()) {
                userList.add(new User(
                        rs.getInt("user_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone_number")
                ));
            }
            userTable.setItems(userList);

        } catch (SQLException e) {
            e.printStackTrace();
            showAlert(AlertType.ERROR, "Błąd bazy danych", "Nie udało się wczytać użytkowników");
        }
    }

    private void updateUserInDB(User user) {
        String sql = "UPDATE \"user\" SET name = ?, email = ?, password = ?, phone_number = ? WHERE user_id = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setInt(5, user.getUserId());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                showAlert(AlertType.ERROR, "Błąd aktualizacji", "Nie udało się zaktualizować użytkownika");
            } else {
                showAlert(AlertType.INFORMATION, "Sukces", "Dane użytkownika zostały zaktualizowane");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            showAlert(AlertType.ERROR, "Błąd bazy danych", "Nie udało się zaktualizować użytkownika");
        }
    }

    @FXML
    private void onDeleteUser(ActionEvent event) {
        User selectedUser = userTable.getSelectionModel().getSelectedItem();
        if (selectedUser == null) {
            showAlert(AlertType.WARNING, "Brak wyboru", "Proszę wybrać użytkownika do usunięcia");
            return;
        }

        Alert confirmAlert = new Alert(AlertType.CONFIRMATION);
        confirmAlert.setTitle("Potwierdzenie usunięcia");
        confirmAlert.setHeaderText(null);
        confirmAlert.setContentText("Czy na pewno chcesz usunąć użytkownika " + selectedUser.getName() + "?");

        confirmAlert.showAndWait().ifPresent(response -> {
            if (response == ButtonType.OK) {
                deleteUserFromDB(selectedUser);
                userList.remove(selectedUser);
            }
        });
    }

    private void deleteUserFromDB(User user) {
        String sql = "DELETE FROM \"user\" WHERE user_id = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, user.getUserId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                showAlert(AlertType.ERROR, "Błąd usuwania", "Nie udało się usunąć użytkownika");
            } else {
                showAlert(AlertType.INFORMATION, "Sukces", "Użytkownik został usunięty");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            showAlert(AlertType.ERROR, "Błąd bazy danych", "Nie udało się usunąć użytkownika");
        }
    }

    private void showAlert(AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

//    public void onEditUser(ActionEvent event) {
//        // obsługa kliknięcia
//        System.out.println("Edit button clicked!");
//    }

    @FXML
    private void handleBackToAdminDashboard() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/Resources/AdminDashboard.fxml"));
            Parent root = loader.load();

            // Ustawiamy serwis zanim kontroler zacznie z niego korzystać
            AdminDashboardController controller = loader.getController();
            controller.setMovieService(this.movieService);  // UPEWNIJ SIĘ, że this.movieService nie jest nullem

            Stage stage = (Stage) backButton.getScene().getWindow(); // lub inny element, np. userTable
            stage.setScene(new Scene(root));
            stage.setTitle("Panel Administratora");
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
