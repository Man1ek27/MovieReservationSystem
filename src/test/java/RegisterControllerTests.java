import controllers.RegisterController;
import javafx.application.Platform;
import javafx.embed.swing.JFXPanel;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class RegisterControllerTest {

    @BeforeAll
    static void initJfx() {
        // Inicjalizacja JavaFX dla testów
        new JFXPanel();
        Platform.setImplicitExit(false);
    }

    @Test
    void testPasswordsDoNotMatch() {
        RegisterController controller = new RegisterController();
        controller.username = new TextField("testuser");
        controller.email = new TextField("test@example.com");
        controller.password = new PasswordField();
        controller.password.setText("pass1");
        controller.reppassword = new PasswordField();
        controller.reppassword.setText("pass2");
        controller.phone = new TextField("123456789");
        controller.messageLabel = new Label();

        controller.setClient(mock(org.java_websocket.client.WebSocketClient.class));
        controller.handleRegister(new javafx.event.ActionEvent());

        assertEquals("ERROR: Passwords do not match!", controller.messageLabel.getText());
    }

    @Test
    void testInvalidEmail() {
        RegisterController controller = new RegisterController();
        controller.username = new TextField("testuser");
        controller.email = new TextField("invalid_email");
        controller.password = new PasswordField();
        controller.password.setText("pass");
        controller.reppassword = new PasswordField();
        controller.reppassword.setText("pass");
        controller.phone = new TextField("123456789");
        controller.messageLabel = new Label();

        controller.setClient(mock(org.java_websocket.client.WebSocketClient.class));
        controller.handleRegister(new javafx.event.ActionEvent());

        assertEquals("ERROR: Invalid email format!", controller.messageLabel.getText());
    }

    @Test
    void testInvalidPhone() {
        RegisterController controller = new RegisterController();
        controller.username = new TextField("testuser");
        controller.email = new TextField("test@example.com");
        controller.password = new PasswordField();
        controller.password.setText("pass");
        controller.reppassword = new PasswordField();
        controller.reppassword.setText("pass");
        controller.phone = new TextField("12345");
        controller.messageLabel = new Label();

        controller.setClient(mock(org.java_websocket.client.WebSocketClient.class));
        controller.handleRegister(new javafx.event.ActionEvent());

        assertEquals("ERROR: Invalid phone number!", controller.messageLabel.getText());
    }
}
