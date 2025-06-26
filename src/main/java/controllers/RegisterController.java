package controllers;

import classes.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;

import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import org.java_websocket.client.WebSocketClient;


import java.io.IOException;


public class RegisterController {

    public AnchorPane back;
    @FXML
    public TextField username;
    @FXML
    public TextField email;
    @FXML
    public PasswordField password;
    @FXML
    public PasswordField reppassword;
    @FXML
    public TextField phone;
    @FXML
    public Label messageLabel;

    private WebSocketClient wsClient;

    public void setClient(WebSocketClient wsClient){
        this.wsClient = wsClient;
    }

    @FXML
    public void handleRegister(ActionEvent event){//przycisk register
        User user = new User(username.getText(), email.getText(), password.getText(), phone.getText());
        String repass = reppassword.getText();

//        System.out.println(user.getPassword());
//        System.out.println(repass);
        if(!user.getPassword().equals(repass)){//Sprawdzenie czy hasła są takie same
            messageLabel.setText("ERROR: Passwords do not match!");
            messageLabel.setTextFill(new Color(1,0,0,1));
            return;
        }
        // Walidacja emaila
        String emailPattern = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if(!user.getEmail().matches(emailPattern)){
            messageLabel.setText("ERROR: Invalid email format!");
            messageLabel.setTextFill(new Color(1,0,0,1));
            return;
        }

        // Walidacja numeru telefonu (np. tylko cyfry, 9 cyfr)
        String phonePattern = "^\\d{9}$";
        if(!user.getPhoneNumber().matches(phonePattern)){
            messageLabel.setText("ERROR: Invalid phone number!");
            messageLabel.setTextFill(new Color(1,0,0,1));
            return;
        }

        if(wsClient.isOpen()){
            wsClient.send("REGISTER:"+ user.getName() +":" + user.getEmail() +  ":"  + user.getPassword() + ":" + user.getPhoneNumber());
        }
        else {
            messageLabel.setText("Nie połączono z serwerem WebSocket.");
        }
    }

    public void setMessageLabel(String text, String color){
        messageLabel.setText(text);
        switch (color){
            case "GREEN" -> messageLabel.setTextFill(new Color(0,1,0,1));
            case "RED" ->messageLabel.setTextFill(new Color(1,0,0,1));
            default -> messageLabel.setTextFill(new Color(0,0,0,1));
        }
    }

    public void handleReturn(ActionEvent actionEvent) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/login.fxml"));
        Parent root = loader.load();
        Stage primaryStage = new Stage();
        primaryStage.setTitle("Logowanie");
        primaryStage.setScene(new Scene(root));
        primaryStage.show();

        Stage stage = (Stage)((Node) actionEvent.getSource()).getScene().getWindow();
        stage.close();
    }
}
