package src;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;


public class Main extends Application{
    public static void main(String[] args) throws Exception {
        launch(args);

    }

    @Override
    public void start(Stage stage){

        Label label = new Label("Hellow Word");
        Scene scene = new Scene(new StackPane(label), 500, 500);
        stage.setScene(scene);
        stage.show();
    }
}
