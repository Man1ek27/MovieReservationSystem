import controllers.LoginController;
import javafx.application.Platform;
import javafx.embed.swing.JFXPanel;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class LoginControllerTest {

    @BeforeAll
    static void initJfx() {
        new JFXPanel();
        Platform.setImplicitExit(false);
    }

    @Test
    void testHandleLoginNotConnected() {
        LoginController controller = new LoginController();
        controller.loginField = new TextField("user");
        controller.passwordField = new PasswordField();
        controller.passwordField.setText("pass");
        controller.messageLabel = new Label();

        // Mock websocketclient, który nie jest połączony
        org.java_websocket.client.WebSocketClient wsMock = mock(org.java_websocket.client.WebSocketClient.class);
        when(wsMock.isOpen()).thenReturn(false);
        controller.wsClient = wsMock;

        controller.handleLogin(new javafx.event.ActionEvent());
        assertEquals("Nie połączono z serwerem WebSocket.", controller.messageLabel.getText());
    }
}

