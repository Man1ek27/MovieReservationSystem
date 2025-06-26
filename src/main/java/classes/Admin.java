package classes;

import java.util.List;
import java.util.ArrayList;

public class Admin {
    private int adminId;
    private String name;
    private String email;
    private String password;

    private List<Theatre> managedTheatres;
    private List<Movie> managedMovies;


    static private int id =0;

    /**
     * Klasa admin
     * @param name nazwa admina
     * @param email mail
     * @param password halso
     */
    public Admin(String name, String email, String password) {
        this.adminId = ++id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.managedTheatres = new ArrayList<>();
        this.managedMovies = new ArrayList<>();
    }

    //ADD classes.Theatre

    /**
     * Dodaje teatr do listy teatrów zarządzanych przez admina
     * @param theatre
     */
    public void addTheatre(Theatre theatre){
        managedTheatres.add(theatre);
    }

    //ADD classes.Movie

    /**
     * Dodaje film do listy zarządzanych classes.Movie
     * @param movie
     */
    public void addMovie(Movie movie){
        managedMovies.add(movie);
    }



    //GETTERS

    /**
     * Lista getterów
     */
    public List<Movie> getManagedMovies() {return managedMovies;}
    public int getAdminId() {return adminId;}
    public String getName() {return name;}
    public String getEmail() {return email;}
    public String getPassword() {return password;}
    public List<Theatre> getManagedTheatres() {return managedTheatres;}

    //SETTERS
    /**
     * Lista setterów
     */
    public void setAdminId(int adminId) {this.adminId = adminId;}
    public void setPassword(String password) {this.password = password;}
    public void setName(String name) {this.name = name;}
    public void setEmail(String email) {this.email = email;}

}