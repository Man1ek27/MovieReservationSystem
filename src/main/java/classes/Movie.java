package classes;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

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

    /**
     * Klasa movie, przechowująca informacje o danym filmie
     * @param movieId id filmu
     * @param title tytuł filmu
     * @param description opis filmu
     * @param language język filmu
     * @param genre opis gatunku filmu
     * @param durationMinutes czas trwania filmu
     * @param releaseDate data wydania filmu
     * @param posterUrl url do plakatu filmu
     * @param audioType typ ścieżki dźwiękowej (enum: ORIGINAL, DUBBING, SUBTITLE)
     */
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

    /**
     * Klasa movie, przechowująca informacje o danym filmie
     * konstruktor bez ID, aby współpracował z bazą danych
     * @param title tytuł filmu
     * @param description opis filmu
     * @param language język filmu
     * @param genre opis gatunku filmu
     * @param durationMinutes czas trwania filmu
     * @param releaseDate data wydania filmu
     * @param posterUrl url do plakatu filmu
     * @param audioType typ ścieżki dźwiękowej (enum: ORIGINAL, DUBBING, SUBTITLE)
     */
    public Movie(String title, String description, String language, String genre,
                 int durationMinutes, Date releaseDate, String posterUrl, AudioType audioType) {
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

    @Override
    public String toString() {
        return title;
    }


    //ADD Manager

    /**
     * Dodaje admina
     * @param admin - wybrany admin
     */
    public void addManager(Admin admin){
        managers.add(admin);
    }

    //GETTERS

    /**
     * Lista getterów
     */
    public int getMovieId() {return movieId;}
    public List<Admin> getManagers() {return managers;}
    public String getTitle() {return title;}
    public String getDescription() {return description;}
    public String getLanguage() {return language;}
    public String getGenre() {return genre;}
    public int getDurationMinutes() {return durationMinutes;}
    public Date getReleaseDate() {return releaseDate;}
    public String getPosterUrl() {return posterUrl;}
    public AudioType getAudioType() {return audioType;}

    //SETTERS
    /**
     * Lista setterów
     */
    public void setMovieId(int movieId) {this.movieId = movieId;}
    public void setTitle(String title) {this.title = title;}
    public void setDescription(String description) {this.description = description;}
    public void setLanguage(String language) {this.language = language;}
    public void setGenre(String genre) {this.genre = genre;}
    public void setDurationMinutes(int durationMinutes) {this.durationMinutes = durationMinutes;}
    public void setReleaseDate(Date releaseDate) {this.releaseDate = releaseDate;}
    public void setPosterUrl(String posterUrl) {this.posterUrl = posterUrl;}
    public void setAudioType(AudioType audioType) {this.audioType = audioType;}
}
