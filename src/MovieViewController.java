package src;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.event.ActionEvent;

public class MovieViewController {

    @FXML
    private TextField titleField;

    @FXML
    private Button saveButton;

    // metoda wywoływana po kliknięciu przycisku "Zapisz"
    @FXML
    private void onSaveButtonClicked(ActionEvent event) {
        String title = titleField.getText();
        System.out.println("Wpisany tytuł filmu: " + title);

        // tutaj możesz dodać kod, żeby np. zapisać film do bazy lub listy
    }
}
