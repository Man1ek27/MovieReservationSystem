package src;
import java.util.List;
import java.util.ArrayList;

public class Admin {
    private int adminId;
    private String name;
    private String email;
    private String password;

    //TO DO: Dodać settery dla managedTheatres i managedMovies
    private List<Theatre> managedTheatres;
    private List<Movie> managedMovies;


    static private int id =0;
    public Admin(String name, String email, String password) {
        this.adminId = ++id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.managedTheatres = new ArrayList<>();
        this.managedMovies = new ArrayList<>();
    }



    //GETTERS
    public List<Movie> getManagedMovies() {return managedMovies;}
    public int getAdminId() {return adminId;}
    public String getName() {return name;}
    public String getEmail() {return email;}
    public String getPassword() {return password;}
    public List<Theatre> getManagedTheatres() {return managedTheatres;}

    //SETTERS
    public void setAdminId(int adminId) {this.adminId = adminId;}
    public void setPassword(String password) {this.password = password;}
    public void setName(String name) {this.name = name;}
    public void setEmail(String email) {this.email = email;}

}