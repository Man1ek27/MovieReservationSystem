package src;

import javafx.fxml.FXMLLoader;
import javafx.application.Application;
// import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class Main extends Application {
    public static void main(String[] args) throws Exception {
        launch(args);

    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/MovieView.fxml"));
        Scene scene = new Scene(loader.load());
        primaryStage.setScene(scene);
        primaryStage.setTitle("Dodawanie filmu");
        primaryStage.show();
    }
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
}

