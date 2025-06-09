package src;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.time.LocalDate;

public class Movie {
    public enum AudioType {
        ORIGINAL,
        DUBBING,
        SUBTITLE
    }

    private int movieId;
    private String title;
    private String description;
    private String language;
    private String genre;
    private int durationMinutes;
    private Date releaseDate;
    private String posterUrl;
    private AudioType audioType;

    // TO DO: setter dla managers
    private List<Admin> managers;

    public void setManagers(List<Admin> managers) {
        this.managers = managers;
    }

    public Movie(int movieId, String title, String description, String language, String genre,
                 int durationMinutes, Date releaseDate, String posterUrl, AudioType audioType) {
        this.movieId = movieId;
        this.title = title;
        this.description = description;
        this.language = language;
        this.genre = genre;
        this.durationMinutes = durationMinutes;
        this.releaseDate = releaseDate;
        this.posterUrl = posterUrl;
        this.audioType = audioType;
        this.managers = new ArrayList<>();
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getDurationMinutes() {
        return durationMinutes;
    }

    public void setDurationMinutes(int durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getPosterUrl() {
        return posterUrl;
    }

    public void setPosterUrl(String posterUrl) {
        this.posterUrl = posterUrl;
    }

    public AudioType getAudioType() {
        return audioType;
    }

    public void setAudioType(AudioType audioType) {
        this.audioType = audioType;
    }

    public List<Admin> getManagers() {
        return managers;
    }
}
