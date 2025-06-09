package src;

import javafx.scene.image.Image;
import com.sun.prism.Texture;
import javafx.application.Application;
// import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;
import javafx.scene.paint.Color;


public class Main {
    public static void main(String[] args) {
        Theatre kino1 = new Theatre("Cinama City", "Warszawska 1", "Krakow");
        kino1.addScreen(new Screen());
    }
}

//public class Main extends Application{
//    public static void main(String[] args) throws Exception {
//        launch(args);
//
//    }

//    @Override
//    public void start(Stage stage){
//
//        Label label = new Label("Hello World");
//        label.setLayoutX(250);
//        label.setLayoutY(250);
//        label.setTextFill(Color.WHITE);
//
//        Circle circ = new Circle(250, 250, 50 );
//        circ.setFill(Color.BLUE);
//
//        Image img = new Image(getClass().getResource("download.png").toExternalForm());
//        Circle prost = new Circle(0,0,127);
//        prost.setFill(new ImagePattern(img));
//
//
//        StackPane stack = new StackPane(circ, label, prost);
//
//        Scene scene = new Scene(stack, 500, 500);
//        stage.setTitle("Rezerwacja Miejsc");
//        stage.setScene(scene);
//        stage.show();
//
//    }
//}
