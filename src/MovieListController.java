package src;

import javafx.fxml.FXML;
import javafx.scene.control.ListView;

public class MovieListController {

    @FXML
    private ListView<String> moviesListView;

    private MovieService movieService;

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
        loadMovies();
    }

    private void loadMovies() {
        moviesListView.getItems().clear();
        for (Movie m : movieService.getAllMovies()) {
            moviesListView.getItems().add(m.getTitle());
        }
    }
}
