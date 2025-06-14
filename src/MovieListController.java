package src;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.ListView;

public class MovieListController {

    @FXML
    private ListView<String> moviesListView;

    private MovieService movieService;

    // Lista tytułów filmów (observable)
    private ObservableList<String> moviesObservableList = FXCollections.observableArrayList();

    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
        loadMovies();
    }

    private void loadMovies() {
        moviesObservableList.clear();
        for (Movie m : movieService.getAllMovies()) {
            moviesObservableList.add(m.getTitle());
        }
        moviesListView.setItems(moviesObservableList);
    }

    // Dodanie tytułu nowego filmu do listy i aktualizacja widoku
    public void addMovieToList(Movie movie) {
        moviesObservableList.add(movie.getTitle());
    }
}
