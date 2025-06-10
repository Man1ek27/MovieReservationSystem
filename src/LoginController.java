package src;

import javafx.fxml.FXML;
import javafx.scene.control.PasswordField;
import javafx.event.ActionEvent;

import javafx.scene.control.TextField;
import javafx.scene.control.Label;
import java.sql.*;

public class LoginController {
    @FXML private TextField loginField;
    @FXML private PasswordField passwordField;
    @FXML private Label messageLabel;


    private final String url = "jdbc:postgresql://localhost:5432/moviereservation";
    private final String user = "postgres";
    private final String password = "123qwe";


    @FXML
    void handleLogin(ActionEvent event) {
        String login = loginField.getText();
        String pass = passwordField.getText();

        String sql = "SELECT name, password FROM \"user\" WHERE name = ? AND password = ?";

        try(Connection conn = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = conn.prepareStatement(sql)){

            stmt.setString(1, login);
            stmt.setString(2, pass);

            ResultSet rs = stmt.executeQuery();

            if(rs.next()){
                messageLabel.setText("Zalogowano!!");
            }
            else{
                messageLabel.setText("Błędny login lub hasło.");
            }
        }
        catch(SQLException e){
            messageLabel.setText("Błąd połączenia z bazą");
            e.printStackTrace();
        }
    }

}
