package src;

import javafx.fxml.FXMLLoader;
import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import src.controllers.SceneController;
import src.server.MovieReservationWebSocketServer; // Import nowej klasy serwera

/**
 * Main, który odpowiada za wczytanie pierwszy ekran login.fxml
 * Setupuje on również webSocketServer w tle.
 * Kończy działanie serwera razem z zamknięciem programu.
 */
public class Main extends Application {

    private static MovieReservationWebSocketServer webSocketServer; // Statyczna referencja do serwera

    public static void main(String[] args) throws Exception {
        int port = 8887;
        webSocketServer = new MovieReservationWebSocketServer(port);
        webSocketServer.start();
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        // ... reszta kodu JavaFX, która ładuje login.fxml
        FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/login.fxml"));
        Parent root = loader.load();
        primaryStage.setTitle("Logowanie");
        primaryStage.setScene(new Scene(root));
        primaryStage.show();

//        FXMLLoader loader = new FXMLLoader(getClass().getResource("../Resources/sceneView.fxml"));
//        Parent root = loader.load();
//        primaryStage.setTitle("Wybór miejsc");
//        SceneController controller = loader.getController();
//        controller.setScreenId(30);//// tutaj zmieniacie numer Sali
//        primaryStage.setScene(new Scene(root));
//        primaryStage.show();
        //Szybkie wytłumacznie jak to działa: zmieniacie tylko i wyłącznie numer wyświetlanej sali
        //reszta działa sama
    }

    @Override
    public void stop() throws Exception {
        if (webSocketServer != null) {
            webSocketServer.stop();
            System.out.println("WebSocket server stopped.");
        }
        super.stop();
    }
}