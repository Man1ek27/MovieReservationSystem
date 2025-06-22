package src;

import java.util.List;
import java.util.ArrayList;

public class Theatre {
    private int theatreId;
    private String name;
    private String address;
    private String city;

    private Admin manager;
    private List<Screen> screens;


    static private int id = 0;

    /**
     * Klasa implementująca dany kino.
     * @param theatreId id kina
     * @param name nazwa kina
     * @param address adres kina
     * @param city miasto kina
     */
    public Theatre(int theatreId, String name, String address, String city) {
        this.theatreId = theatreId;
        this.name = name;
        this.address = address;
        this.city = city;
        this.screens = new ArrayList<>();
    }


    public Theatre(String name, String address, String city) {
        this.theatreId = ++id;
        this.name = name;
        this.address = address;
        this.city = city;
        this.screens = new ArrayList<>();
    }

    //ADD screen

    /**
     * Metoda dodająca ekran
     */
    public void addScreen(Screen screen){
        screens.add(screen);
    }

    //GETTERS
    /**
     * Lista Getterów
     */
    public int getTheatreId() {return theatreId;}
    public String getName() {return name;}
    public String getAddress() {return address;}
    public String getCity() {return city;}
    public Admin getManager() {return manager;}
    public List<Screen> getScreens() {return screens;}

    //SETTERS
    /**
     * Lista Setterów
     */
    public void setTheatreId(int theatreId) {this.theatreId = theatreId;}
    public void setName(String name) {this.name = name;}
    public void setAddress(String address) {this.address = address;}
    public void setCity(String city) {this.city = city;}
    public void setManager(Admin manager) {this.manager = manager;}

    @Override
    public String toString() {
        return city + " – " + address;
    }
}
