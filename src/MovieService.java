package src;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MovieService {
    private List<Movie> movies = new ArrayList<>();

    public void addMovie(String title, String description, String language, String genre,
                         int duration, java.util.Date releaseDate, String posterUrl, Movie.AudioType audioType) {
        Movie movie = new Movie(title, description, language, genre,
                duration, releaseDate, posterUrl, audioType);
        movies.add(movie);
    }

    public void addMovie(Movie movie) {
        movies.add(movie);
    }

    public void deleteMovie(int movieId) {
        movies.removeIf(m -> m.getMovieId() == movieId);
    }

    public List<Movie> getAllMovies() {
        return movies;
    }

    public List<Movie> filterByTitle(String keyword) {
        return movies.stream()
                .filter(m -> m.getTitle().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }
}