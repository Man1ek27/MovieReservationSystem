package src;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;

import javafx.scene.paint.Color;
import javafx.stage.Stage;
import org.java_websocket.WebSocket;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;


public class RegisterController {

    @FXML private TextField username;
    @FXML private TextField email;
    @FXML private PasswordField password;
    @FXML private PasswordField reppassword;
    @FXML private TextField phone;
    @FXML private Label messageLabel;

    private WebSocketClient wsClient;

    public void setClient(WebSocketClient wsClient){
        this.wsClient = wsClient;
    }

    @FXML
    public void handleRegister(ActionEvent event){
        User user = new User(username.getText(), email.getText(), password.getText(), phone.getText());
        String repass = reppassword.getText();

        System.out.println(user.getPassword());
        System.out.println(repass);
        if(!user.getPassword().equals(repass)){
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
}
