package src;

import javafx.fxml.FXML;
import javafx.scene.control.*;

import org.java_websocket.WebSocket;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;


public class RegisterController {

    @FXML private TextField username;
    @FXML private PasswordField password;
    @FXML private PasswordField reppassword;
    @FXML private TextField phone;
    @FXML private Label massageLabel;

    private WebSocketClient wsClient;

    public void setClient(WebSocketClient wsClient){
        this.wsClient = wsClient;
    }

    @FXML
    public void handleRegister(){
        if(wsClient.isOpen()){

        }
    }
}
