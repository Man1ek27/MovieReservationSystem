package src;

import javafx.fxml.FXMLLoader;
import javafx.application.Application;
// import javafx.scene.Group;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.sql.*;


public class Main extends Application {
    public static void main(String[] args) throws Exception {
        launch(args);

//        String url = "jdbc:postgresql://localhost:5432/moviereservation";
//        String user = "postgres";
//        String password = "123qwe";
//
//        try{
//            Connection conn = DriverManager.getConnection(url, user, password);
//            if(conn != null){
//                System.out.println("Połączono!");
//            }
//
//            Statement stmt= conn.createStatement();
//            String sql = "SELECT * FROM \"Scanes\".\"Scanes\"";
//            ResultSet rs = stmt.executeQuery(sql);
//
//            while (rs.next()){
//                int id = rs.getInt("ID");
//                String name = rs.getString("name");
//                int capacity = rs.getInt("capacity");
//                System.out.println("ID: " + id + ", name: " + name + ", capacity: " + capacity);
//            }
//        }
//        catch (SQLException e){
//            e.printStackTrace();
//        }

    }

    @Override
    public void start(Stage primaryStage) throws Exception {
//        FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/MovieView.fxml"));
//        Scene scene = new Scene(loader.load());
//        primaryStage.setTitle("Dodawanie filmu");
//        primaryStage.setScene(scene);
//        primaryStage.show();

        FXMLLoader loader = new FXMLLoader(getClass().getResource("../Recources/login.fxml"));
        Parent root = loader.load();
        primaryStage.setTitle("Logowanie");
        primaryStage.setScene(new Scene(root));
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

