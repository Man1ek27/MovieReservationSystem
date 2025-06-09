package src;

import java.util.List;
import java.util.ArrayList;

public class Theatre {
    private int theatreId;
    private String name;
    private String address;
    private String city;

    private Admin manager;
    //TO DO: Dodać setter dla screen
    private List<Screen> screens;

    public Theatre(int theatreId, String name, String address, String city) {
        this.theatreId = theatreId;
        this.name = name;
        this.address = address;
        this.city = city;
        this.screens = new ArrayList<>();
    }

    public int getTheatreId() {
        return theatreId;
    }

    public void setTheatreId(int theatreId) {
        this.theatreId = theatreId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Admin getManager() {
        return manager;
    }

    public void setManager(Admin manager) {
        this.manager = manager;
    }

    public List<Screen> getScreens() {
        return screens;
    }

}
