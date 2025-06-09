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

    public Theatre(String name, String address, String city) {
        this.theatreId = ++id;
        this.name = name;
        this.address = address;
        this.city = city;
        this.screens = new ArrayList<>();
    }

    //ADD screen
    public void addScreen(Screen screen){
        screens.add(screen);
    }

    //GETTERS
    public int getTheatreId() {return theatreId;}
    public String getName() {return name;}
    public String getAddress() {return address;}
    public String getCity() {return city;}
    public Admin getManager() {return manager;}
    public List<Screen> getScreens() {return screens;}

    //SETTERS
    public void setTheatreId(int theatreId) {this.theatreId = theatreId;}
    public void setName(String name) {this.name = name;}
    public void setAddress(String address) {this.address = address;}
    public void setCity(String city) {this.city = city;}
    public void setManager(Admin manager) {this.manager = manager;}
}
