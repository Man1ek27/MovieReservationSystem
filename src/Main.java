package src;

import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.paint.Color;


public class Main extends Application{
    public static void main(String[] args) throws Exception {
        launch(args);

    }

    @Override
    public void start(Stage stage){

        Label label = new Label("Hello World");
        label.setLayoutX(250);
        label.setLayoutY(250);
        label.setTextFill(Color.WHITE);
        
        Circle circ = new Circle(250, 250, 50 );
        circ.setFill(Color.BLUE);

        StackPane stack = new StackPane(circ, label);
        
        Scene scene = new Scene(stack, 500, 500);
        stage.setTitle("Rezerwacja Miejsc");
        stage.setScene(scene);
        stage.show();
    }
}
